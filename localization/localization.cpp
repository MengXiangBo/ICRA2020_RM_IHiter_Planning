#include <sys/time.h>

#include <pcl/search/impl/search.hpp>
#ifndef PCL_NO_PRECOMPILE
#include <pcl/impl/instantiate.hpp>
#include <pcl/point_types.h>
PCL_INSTANTIATE(Search, PCL_POINT_TYPES)
#endif

#include "localization.h"

using namespace Eigen;
using namespace std;
using namespace hitcrt;

namespace hitcrt{
    timespec tstart,tend,tastart,taend,tbstart,tbend;

    // 如果得到的位姿产生的扫描不能和cost map产生很好的效果，那么重定位
    bool Localization::isreloc(vector<double > &scan){
        double theta;
        double x = position(0,3)*RESOLUTION; // x in image coordinate
        double y = pf.map.rows-position(1,3)*RESOLUTION; // y in image coordinate
        double p01 = asin(position(0,1));
        // pose is Tw_r which means
        // | cos(alpha)   sin(alpha)  0    dx   |
        // | -sin(alpha)  cos(alpha)  0    dy   |
        // |     0            0       1    1    |
        // |     0            0       0    1    |
        // alpha is delta angle of two coordinate(world and robot),however isn't theta
        // the world actually is INITIAL coordinate
        // clockwise is positive
        if (position(0,0)>=0 && position(0,1)>=0) theta = -p01*180/M_PI;
        if (position(0,0)<=0 && position(0,1)>=0) theta = p01*180/M_PI-180;
        if (position(0,0)<=0 && position(0,1)<=0) theta = p01*180/M_PI+180;
        if (position(0,0)>=0 && position(0,1)<=0) theta = -p01*180/M_PI;
        Point3d pt(x,y,theta);

        vector<double > laser_angle;
        for (int i = 0; i < scan.size(); ++i)
            laser_angle.push_back(pt.z+pf.angles[i]);

        // reset all outliers to 0, this step highly depend on odometry precision
        double outlier = 0.0;
        double total = 0.0;
        for (int j = 0; j < scan.size(); ++j) {
            if (scan[j] > 0)
            {
                Point temp;
                temp.x = int(pt.x+scan[j]*RESOLUTION*cos(laser_angle[j]*M_PI/180)+pf.expand_x);
                temp.y = int(pt.y-scan[j]*RESOLUTION*sin(laser_angle[j]*M_PI/180)+pf.expand_y);
                if (temp.x>=0 && temp.y>=0 && temp.x<=pf.dis_map.cols && temp.y<=pf.dis_map.rows )
                    if (2*(1-pf.normalCFD(pf.dis_map.ptr<uchar >(temp.y)[temp.x]/pf.pz_x_cov)) < 0.1 )
                        outlier++;
                total++;
            }
        }
        if (outlier > 0.3*total)
        {
            history_position.push_back(position);
            return true;
        }
        return false;
    }

    // 判断是否有动态点存在并删除
    void Localization::out(vector<double > &scan, vector<float > &angle, vector<double > &cos_theta, vector<double > &sin_theta) {
        double theta;
        double deltax = 0.0;
        double deltay = 0.0;
        double deltatheta = 0.0;
        if (!odo.empty())
        {
            deltax = odo[odo.size()-1][1]-odo[start][1];
            deltay = odo[odo.size()-1][2]-odo[start][2];
            deltatheta = (odo[odo.size()-1][3]-odo[start][3])*57.3;
        }
        double x = (position(0,3)+deltax)*RESOLUTION; // x in image coordinate
        double y = pf.map.rows-(position(1,3)+deltay)*RESOLUTION; // y in image coordinate
        double p01 = asin(position(0,1));
        // pose is Tw_r which means
        // | cos(alpha)   sin(alpha)  0    dx   |
        // | -sin(alpha)  cos(alpha)  0    dy   |
        // |     0            0       1    1    |
        // |     0            0       0    1    |
        // alpha is delta angle of two coordinate(world and robot),however isn't theta
        // the world actually is INITIAL coordinate
        // clockwise is positive
        if (position(0,0)>=0 && position(0,1)>=0) theta = -p01*180/M_PI;
        if (position(0,0)<=0 && position(0,1)>=0) theta = p01*180/M_PI-180;
        if (position(0,0)<=0 && position(0,1)<=0) theta = p01*180/M_PI+180;
        if (position(0,0)>=0 && position(0,1)<=0) theta = -p01*180/M_PI;
        theta += deltatheta;
        Point3d pt(x,y,theta);

        vector<double > laser_angle;
        for (int i = 0; i < scan.size(); ++i) {
            laser_angle.push_back(pt.z+angle[i]);
        }

        // reset all outliers to 0, this step highly depend on odometry precision
        for (int j = 0; j < scan.size(); ++j) {
            Point temp;
            temp.x = int(pt.x+scan[j]*RESOLUTION*cos(laser_angle[j]*M_PI/180)+pf.expand_x);
            temp.y = int(pt.y-scan[j]*RESOLUTION*sin(laser_angle[j]*M_PI/180)+pf.expand_y);
            if (2*(1-pf.normalCFD(pf.dis_map.ptr<uchar >(temp.y)[temp.x]/pf.pz_x_cov)) < 0.03 )
                scan[j] = 0.0;
        }
    }

    void Localization::run(vector<double > &scan, vector<double > &odometry,const float angle_min, const float angle_max) {
        present++;
        scans.push_back(scan);
        odo.push_back(odometry);

        vector<float > angles;
        vector<double > cos_theta, sin_theta;
        //unsigned long num = scan.size();
        float angle_increase = (angle_max-angle_min)/(scan.size()-1);
        for (int k = 0; k < scan.size(); ++k) {
            angles.push_back(angle_min+k*angle_increase);
            cos_theta.push_back(cos(angles.back()/180*M_PI));
            sin_theta.push_back(sin(angles.back()/180*M_PI));
        }

        //assert(scan.size() == scan_num);
        out(scan, angles, cos_theta, sin_theta);

        clock_gettime(CLOCK_REALTIME,&tstart);
        PointCloudT::Ptr Temp(new PointCloudT);
        int r = random(RANG_MIN, RANG_MAX);
        int g = random(RANG_MIN, RANG_MAX);
        int b = random(RANG_MIN, RANG_MAX);
        int start_point = 0;
        for (int i = 0; i < scan.size(); ++i) {
            PointT H;
            if (scan[i] < VALID_MIN || scan[i] > VALID_MAX) continue;
            if (i>=1 && scan[i]!=0){
                // 降采样
                if(sqrt(pow(scan[start_point]*cos_theta[start_point]-scan[i]*cos_theta[i],2)+
                pow(-scan[start_point]*sin_theta[start_point]+scan[i]*sin_theta[i],2)) <= 0.012)
                    continue;
                start_point = i;
            }
            //cout << "delta x,y : " << scan[start]*Sin_theta[start]-scan[i]*Sin_theta[i] << "," << -scan[start]*Cos_theta[start]+scan[i]*Cos_theta[i] << endl;
            H.x = scan[i]*cos_theta[i];
            H.y = scan[i]*sin_theta[i];
            H.z = 1.;
            H.r = r;
            H.g = g;
            H.b = b;
            Temp->push_back(H);
        }
        v_Cache.push_back(Temp);
#ifdef _DEBUG
        // save pcd files
        string name = "/home/mrm/ICRA/Dataset/20191218/pcd/map" + to_string(present) + ".pcd";
        pcl::io::savePCDFileBinary(name,*Temp);
#endif

        bool b_Calcflag = false;
        double deltax = odometry[1]-odo[start][1];
        double deltay = odometry[2]-odo[start][2];
        double deltaphi = (odometry[3]-odo[start][3])*57.3;
        // theta取越大越好，而且同时也要MaxCorrespondenceDistance变大

        if (abs(deltax) > 0.5 || abs(deltay) > 0.5 || abs(deltaphi) > 10) b_Calcflag = true;
        clock_gettime(CLOCK_REALTIME,&tend);

        if (b_Calcflag) {
            //cout<< "scan to point consume time : " << double(tend.tv_nsec-tstart.tv_nsec)/1000000 <<endl;
            clock_gettime(CLOCK_REALTIME,&tstart);
            PointCloudT::Ptr Final(new PointCloudT);

            // give a initial position from odometry
            double PHI_START = odo[start][3] * 57.3f * M_PI / 180;
            double PHI_I = odometry[3] * 57.3f * M_PI / 180;
            Matrix3f Tw_s = MatrixXf::Identity(3, 3);
            Matrix3f Tw_i = MatrixXf::Identity(3, 3);

            // 先使用里程记产生一个先验位置Tw_s并且计算Ti_s
            // Tw_s
            Tw_s(0, 0) = cos(-PHI_START);
            Tw_s(0, 1) = sin(-PHI_START);
            Tw_s(1, 0) = -sin(-PHI_START);
            Tw_s(1, 1) = cos(-PHI_START);
            Tw_s(0, 2) = odo[start][1];
            Tw_s(1, 2) = odo[start][2];
            // Tw_i
            Tw_i(0, 0) = cos(-PHI_I);
            Tw_i(0, 1) = sin(-PHI_I);
            Tw_i(1, 0) = -sin(-PHI_I);
            Tw_i(1, 1) = cos(-PHI_I);
            Tw_i(0, 2) = odometry[1];
            Tw_i(1, 2) = odometry[2];
            // Ti_w
            Matrix3f Ti_w3 = MatrixXf::Identity(3, 3);
            Ti_w3.block(0, 0, 2, 2) = Tw_i.block(0, 0, 2, 2).transpose();
            Ti_w3.block(0, 2, 2, 1) = -Tw_i.block(0, 0, 2, 2).transpose() * Tw_i.block(0, 2, 2, 1);
            // Ti_s
            Matrix3f Ti_s;
            Ti_s = Ti_w3 * Tw_s;

            PointCloudT::Ptr INTIAL(new PointCloudT);
            for (int j = 0; j < scan.size(); ++j) {
                auto *TEMP = new PointT;
                TEMP->x = v_Cache[start]->points[j].x * Ti_s(0, 0) + v_Cache[start]->points[j].y * Ti_s(0, 1) +
                          Ti_s(0, 2);
                TEMP->y = v_Cache[start]->points[j].x * Ti_s(1, 0) + v_Cache[start]->points[j].y * Ti_s(1, 1) +
                          Ti_s(1, 2);
                TEMP->z = 1;
                if (abs(TEMP->x) > RANG_MAX || abs(TEMP->y) > RANG_MAX)
                    continue;
                INTIAL->push_back(*TEMP);
            }

            clock_gettime(CLOCK_REALTIME,&tend);
            //cout<< "matrix calc consume time : " << double(tend.tv_nsec-tstart.tv_nsec)/1000000 <<endl;
            clock_gettime(CLOCK_REALTIME,&tstart);
            icp.setInputSource(INTIAL);
            icp.setInputTarget(v_Cache[present]);
            icp.setMaxCorrespondenceDistance(0.1);
            icp.setMaximumIterations(5);
            icp.setTransformationEpsilon(1e-3);
            icp.setEuclideanFitnessEpsilon(0.01);
            icp.align(*Final);
            Matrix4f transformation = icp.getFinalTransformation();
            clock_gettime(CLOCK_REALTIME,&tend);
            //cout<< "icp consume time : " << double(tend.tv_nsec-tstart.tv_nsec)/1000000 <<endl;

            /******************************************/
            clock_gettime(CLOCK_REALTIME,&tstart);
            // expand Ti_s to a 4x4 homogeneous matrices
            Matrix4f Ti_s_h = Matrix4f::Identity(4, 4);
            Ti_s_h.block(0, 0, 2, 2) = Ti_s.block(0, 0, 2, 2);
            Ti_s_h.block(0, 3, 2, 1) = Ti_s.block(0, 2, 2, 1);

            // inverse of homogeneous matrices
            Matrix3f R_THETA = Ti_s_h.block(0, 0, 3, 3);
            Matrix3f R_TRANS = transformation.block(0, 0, 3, 3);
            Vector3f T_THETA = Ti_s_h.block(0, 3, 3, 1);
            Vector3f T_TRANS = transformation.block(0, 3, 3, 1);
            Matrix4f Ts_i_h = Matrix4f::Identity(4, 4);
            Ts_i_h.block(0, 0, 3, 3) = R_THETA.transpose();
            transformation.block(0, 0, 3, 3) = R_TRANS.transpose();
            Ts_i_h.block(0, 3, 3, 1) = -R_THETA.transpose() * T_THETA;
            transformation.block(0, 3, 3, 1) = -R_TRANS.transpose() * T_TRANS;
            clock_gettime(CLOCK_REALTIME,&tend);
            //cout<< "matrix calc2 stage1 consume time : " << double(tend.tv_nsec-tstart.tv_nsec)/1000000 <<endl;

            clock_gettime(CLOCK_REALTIME,&tstart);
            // position is Tw_lidar
            position = position * Ts_i_h;
            position = position * transformation;
            position_car = position * Tlidar_car;
            float x = position_car(0, 3) - initial_x;
            float y = position_car(1, 3) - initial_y;
            double ground_x;
            double ground_y;

#ifdef _DEBUG
            printf("Match %d with %d ", start, present);
            printf("Matchcount : %d\n", match_count);
            cout << "has converged: " << icp.hasConverged() << endl;
#endif
            // cout << "Calc1 score: " << icp.getFitnessScore() << endl;
            if (readfromfile) {
                ground_x = pf.groundtruth[present][0];
                ground_y = pf.groundtruth[present][1];
#ifdef _DEBUG
                cout << "Real Value : (" << ground_x << "," << ground_y << ")" << endl;
                cout << "x,y : " << x << "," << y << endl;
                cout << "ERROR : (" << ground_x - x << "," << ground_y - y << ")" << endl;
#endif
            }
            clock_gettime(CLOCK_REALTIME,&tend);
            //cout<< "matrix calc2 stage2 consume time : " << double(tend.tv_nsec-tstart.tv_nsec)/1000000 <<endl;
            clock_gettime(CLOCK_REALTIME,&tstart);
            // if error is to big ,use particle filter
            //if (icp.getFitnessScore() > 0.4) {
            if (!icp.hasConverged()) {
                pf.sample_count = 1500;
                pf.sample(position(0, 3), position(1, 3));
                for (int j = 0; j < 2; ++j)
                    pf.forward(scan, Eigen::Vector3d::Zero(),angle_min,angle_max);
                position = Matrix4f::Identity();
                position(0, 0) = cos(-pf.state(2, 0) * M_PI / 180);
                position(0, 1) = sin(-pf.state(2, 0) * M_PI / 180);
                position(1, 0) = -position(0, 1);
                position(1, 1) = position(0, 0);
                position(0, 3) = pf.state(0, 0) / pf.resolution;
                position(1, 3) = (pf.map.rows - pf.state(1, 0)) / pf.resolution;
                position_car = position * Tlidar_car;
            }
            clock_gettime(CLOCK_REALTIME,&tend);
            //cout<< "matrix calc2 stage3 consume time : " << double(tend.tv_nsec-tstart.tv_nsec)/1000000 <<endl;
            /********************************************************/

            clock_gettime(CLOCK_REALTIME,&tstart);
            // 检测是否需要重定位
            if (isreloc(scan)) {
#ifdef _DEBUG
                cout << "******************************************" << endl;
                cout << "relocalization" << endl;
                cout << "******************************************" << endl;
#endif
                pf.sample_count = 3000;
                Eigen::Vector3d state, state_temp;
                if (history_position.size() >= 2)
                    position = history_position[history_position.size() - 2];
                x = position(0, 3) * pf.resolution; // x could be [0,MAP.cols], MAP.clos+1 number in total
                y = pf.map.rows - position(1, 3) * pf.resolution; // y could be [0,MAP.rows], MAP.rows+1 number in total
                double p01 = asin(position(0, 1));
                // pose is Tw_r which means
                // | cos(alpha)   sin(alpha)  0    dx   |
                // | -sin(alpha)  cos(alpha)  0    dy   |
                // |     0            0       1    1    |
                // |     0            0       0    1    |
                // alpha is delta angle of two coordinate(world and robot),however isn't theta
                // the world actually is INITIAL coordinate
                // clockwise is positive
                if (position(0, 0) >= 0 && position(0, 1) >= 0) state(2, 0) = -p01*180/M_PI;
                if (position(0, 0) <= 0 && position(0, 1) >= 0) state(2, 0) = p01*180/M_PI-180;
                if (position(0, 0) <= 0 && position(0, 1) <= 0) state(2, 0) = p01*180/M_PI+180;
                if (position(0, 0) >= 0 && position(0, 1) <= 0) state(2, 0) = -p01*180/M_PI;
                // theta = asin(pose(0,0));
                // -180 =< theta <= 180
                state(0, 0) = x;
                state(1, 0) = y;
                state_temp = state;
                pf.history.push_back(state);
                pf.relocalization();
                for (int j = 0; j < 2; ++j)
                    pf.forward(scan, Eigen::Vector3d::Zero(),angle_min,angle_max);
                position = Matrix4f::Identity();
                position(0, 0) = cos(-pf.state(2, 0)*M_PI/180);
                position(0, 1) = sin(-pf.state(2, 0)*M_PI/180);
                position(1, 0) = -position(0, 1);
                position(1, 1) = position(0, 0);
                position(0, 3) = pf.state(0, 0) / pf.resolution;
                position(1, 3) = (pf.map.rows - pf.state(1, 0)) / pf.resolution;
                position_car = position * Tlidar_car;
                if (isreloc(scan)) {
#ifdef _DEBUG
                    cout << "******************************************" << endl;
                    cout << "relocalization area" << endl;
                    cout << "******************************************" << endl;
#endif
                    if (history_position.size() >= 2)
                        position = history_position[history_position.size() - 2];
                    pf.sample_count = 10000;
                    pf.history.push_back(state_temp);
                    pf.relocalization(3); // increase search area
                    for (int j = 0; j < 2; ++j) {
                        pf.forward(scan, Eigen::Vector3d::Zero(), angle_min, angle_max);
                    }
                    position = Matrix4f::Identity();
                    position(0, 0) = cos(-pf.state(2, 0)*M_PI/180);
                    position(0, 1) = sin(-pf.state(2, 0)*M_PI/180);
                    position(1, 0) = -position(0, 1);
                    position(1, 1) = position(0, 0);
                    position(0, 3) = pf.state(0, 0) / pf.resolution;
                    position(1, 3) = (pf.map.rows - pf.state(1, 0)) / pf.resolution;
                    position_car = position * Tlidar_car;
                }
            }
            clock_gettime(CLOCK_REALTIME,&tend);
            //cout<< "isreloc consume time : " << double(tend.tv_nsec-tstart.tv_nsec)/1000000 <<endl;

            clock_gettime(CLOCK_REALTIME,&tstart);
            b_Calcflag = false;
            string PATH_NAME =
                    "/home/mrm/ICRA/Dataset/20191218/pcd/map"+to_string(start)+"_"+to_string(present)+".pcd";
            // pcl::io::savePCDFileBinary(PATH_NAME, *Final);
            start = present;
            // 计算这次旋转距离上次旋转的角度
            delta_R = position.block(0, 0, 3, 3).transpose()*LOCAL.block(0, 0, 3, 3);
            clock_gettime(CLOCK_REALTIME,&tend);
            //cout << "save consume time : " << double(tend.tv_nsec-tstart.tv_nsec)/1000000 <<endl;

            // local optimize
            if (abs(odometry[1] - odo[local_start][1]) > 2 || abs(odometry[2]-odo[local_start][2]) > 1.6
                || abs(acos(delta_R(0, 0))) > 40 *M_PI/180 || (match_count-local_match_count) > 9) {
                // Ti_w is inverse of stay , stay is Tw_i
                Matrix4f Ti_w = Matrix4f::Identity(4, 4);
                Ti_w.block(0, 0, 3, 3) = position.block(0, 0, 3, 3).transpose();
                Ti_w.block(0, 3, 3, 1) = -position.block(0, 0, 3, 3).transpose() * position.block(0, 3, 3, 1);

                // calc Ti_l = Ti_w * Tw_l, LOCAL is Tw_l，初始化位姿
                Matrix4f Ti_l;
                Ti_l = Ti_w * LOCAL;

                clock_gettime(CLOCK_REALTIME,&tstart);
                // trans p_l to p_virtual
                PointCloudT::Ptr VIRTUAL(new PointCloudT);
                for (int j = 0; j < v_Cache[local_start]->points.size(); ++j) {
                    PointT VT;
                    VT.x = Ti_l(0, 0) * v_Cache[local_start]->points[j].x +
                           Ti_l(0, 1) * v_Cache[local_start]->points[j].y + Ti_l(0, 3);
                    VT.y = Ti_l(1, 0) * v_Cache[local_start]->points[j].x +
                           Ti_l(1, 1) * v_Cache[local_start]->points[j].y + Ti_l(1, 3);
                    VT.z = 1;
                    VT.r = v_Cache[local_start]->points[j].r;
                    VT.g = v_Cache[local_start]->points[j].g;
                    VT.b = v_Cache[local_start]->points[j].b;
                    VIRTUAL->push_back(VT);
                }

                PointCloudT::Ptr Final2(new PointCloudT);
                PointCloudT::Ptr Final3(new PointCloudT);
                icp.setInputSource(VIRTUAL);
                icp.setInputTarget(v_Cache[present]);
                icp.setMaxCorrespondenceDistance(0.2);
                icp.setMaximumIterations(15);
                icp.setTransformationEpsilon(1e-3);
                icp.setEuclideanFitnessEpsilon(0.01);
                icp.align(*Final2);
                // transformation1 is Ti_virtual
                Matrix4f transformation1 = icp.getFinalTransformation();
                clock_gettime(CLOCK_REALTIME,&tend);
                //cout<< "optimize1 icp consume time : " << double(tend.tv_nsec-tstart.tv_nsec)/1000000 <<endl;

#ifdef _DEBUG
                cout << "---------------------------------------" << endl;
                printf("Refine %d with %d\n ", local_start, present);
                // store VIRTUAL and Final2
                string PATH_NAME1 =
                        "/home/mrm/ICRA/Dataset/20191218/pcd/map" + to_string(local_start) + "_" + to_string(present) +
                        "1.pcd";
                pcl::io::savePCDFileBinary(PATH_NAME1, *VIRTUAL);
                PATH_NAME1 =
                        "/home/mrm/ICRA/Dataset/20191218/pcd/map" + to_string(local_start) + "_" + to_string(present) +
                        "2.pcd";
                pcl::io::savePCDFileBinary(PATH_NAME1, *Final2);
#endif

                // 如果局部匹配成功了，那么更新位姿
                if (icp.hasConverged()) {
                    bool calc_flag = true;

                    // now we have stay=Tw_virtual transformation=Ti_virtual
                    // Tw_i(new_stay) = stay*transformation.inverse
                    Matrix3f R_TRANS1 = transformation1.block(0, 0, 3, 3);
                    Vector3f T_TRANS1 = transformation1.block(0, 3, 3, 1);
                    transformation1.block(0, 0, 3, 3) = R_TRANS1.transpose();
                    transformation1.block(0, 3, 3, 1) = -R_TRANS1.transpose() * T_TRANS1;
                    position = position * transformation1;
                    position_car = position * Tlidar_car;

                    if (readfromfile) {
                        // cout << " Calc2 score: " << icp.getFitnessScore() << endl;
#ifdef _DEBUG
                        cout << "ERROR : (" << pf.groundtruth[present][0] - position_car(0, 3) + initial_x << ","
                             << pf.groundtruth[present][1] - position_car(1, 3) + initial_y << ")" << endl;
#endif
                    }

                    /*
                    if (icp.getFitnessScore() > 0.1) {
                        PointCloudT::Ptr N1(new PointCloudT);
                        PointCloudT::Ptr N2(new PointCloudT);
                        // kick out outliers from each other
                        for (int j = 0; j < v_Cache[present]->points.size(); j++) {
                            bool OK = false;
                            PointT P1 = v_Cache[present]->points[j];
                            vector<int> OBSERVATION;
                            for (int k = 0; k < Final2->points.size(); k++) {
                                // two points are close enough
                                PointT P2 = Final2->points[k];
                                if (abs(P1.x-P2.x) < 0.15 && abs(P1.y-P2.y) < 0.15) {
                                    if ((pow((P1.x - P2.x),2) + pow((P1.y-P2.y),2)) < 0.0225) {
                                        OK = true;
                                        OBSERVATION.push_back(k);
                                        //break;
                                    }
                                }
                            }
                            if (OK)
                                N2->push_back(P1);
                        }
                        if (N2->empty()) calc_flag = false;

                        for (int j = 0; j < Final2->points.size(); j++) {
                            bool OK = false;
                            PointT P1 = Final2->points[j];
                            for (int k = 0; k < v_Cache[present]->points.size(); k++) {
                                // two points are close enough
                                PointT P2 = v_Cache[present]->points[k];
                                if (abs(P1.x - P2.x) < 0.15 && abs(P1.y - P2.y) < 0.15) {
                                    if ((pow((P1.x - P2.x), 2) + pow((P1.y - P2.y), 2)) < 0.0225) {
                                        OK = true;
                                        break;
                                    }
                                }
                            }
                            if (OK)
                                N1->push_back(P1);
                        }
                        if (N1->empty()) calc_flag = false;

                        if (calc_flag) {
                            icp.setInputSource(N1);
                            icp.setInputTarget(N2);
                            icp.setMaxCorrespondenceDistance(0.2);
                            icp.setMaximumIterations(50);
                            icp.setTransformationEpsilon(1e-8);
                            icp.setEuclideanFitnessEpsilon(0.01);
                            icp.align(*Final3);
                            // transformation is Ti_virtual
                            Matrix4f transformation2 = icp.getFinalTransformation();

                            // in case the second icp PointCLoud get a line or has a unstable numeric result
                            double error = pow(transformation2(0, 3),2)+pow(transformation2(1, 3),2);
                            double error_theta = acos(transformation2(0, 0))*M_PI/180;
                            if (error>0.04 || error_theta>2)
                                transformation2 = Matrix4f::Identity(4, 4);

                            R_TRANS = transformation2.block(0, 0, 3, 3);
                            T_TRANS = transformation2.block(0, 3, 3, 1);
                            transformation2.block(0, 0, 3, 3) = R_TRANS.transpose();
                            transformation2.block(0, 3, 3, 1) = -R_TRANS.transpose() * T_TRANS;
                            position = position*transformation2;
                            position_car = position*Tlidar_car;
                            string PATH_NAME2="/home/mrm/ICRA/Dataset/201910242/pcd/map"+to_string(local_start)+"_"+to_string(present)+"3.pcd";
                            pcl::io::savePCDFileBinary(PATH_NAME2, *Final3);
                            cout << "---------------------------------------" << endl;
                            cout << "Calc3 score: " << icp.getFitnessScore() << endl;
                            cout << "ERROR : (" << pf.groundtruth[present][0]-position_car(0, 3)+initial_x << ","
                                 << pf.groundtruth[present][1]-position_car(1, 3)+initial_y << ")" << endl;
                            cout << "---------------------------------------" << endl;

                            // if error is to big ,use particle filter
                            if (icp.getFitnessScore() > 0.2){
                                pf.sample_count = 1500;
                                pf.sample(position(0,3),position(1,3));
                                for (int j = 0; j < 3; ++j) {
                                    pf.forward(scan,Eigen::Vector3d::Zero());
                                }
                                position = Matrix4f::Identity();
                                position(0,0) = cos(-pf.state(2,0)*M_PI/180);
                                position(0,1) = sin(-pf.state(2,0)*M_PI/180);
                                position(1,0) = -position(0,1);
                                position(1,1) = position(0,0);
                                position(0,3) = pf.state(0,0)/pf.resolution;
                                position(1,3) = (pf.map.rows-pf.state(1,0))/pf.resolution;
                                position_car = position*Tlidar_car;
                            }
                            */

                }

                /*
                * 这样转换就不行，会出bug
                    stay_initial = stay*Tj_c;
                    stay_initial = Tc_j*stay;
                    stay_initial = trans_initial*stay_initial;
                     */
                clock_gettime(CLOCK_REALTIME,&tstart);
                // input is Tic_j;
                // 如果局部优化成功了那么和地图点匹配，不成功的话让地图点和没局部优化前的点匹配
                if (Final3->empty())
                    position = map.run(position, Final2, present);
                else
                    position = map.run(position, Final3, present);

                position_car = position * Tlidar_car;
                map.relax();
                // map.save_ground(GROUND_TRUTH[i][1],GROUND_TRUTH[i][2],GROUND_TRUTH[i][3]);
                float x = position_car(0, 3);
                float y = position_car(1, 3);
#ifdef _DEBUG
                cout << "Calc4" << endl;
                if (readfromfile) {
                    cout << "Real Value : (" << pf.groundtruth[present][0] << "," << pf.groundtruth[present][1] << ")"
                         << endl;
                    cout << "x,y : " << x << "," << y << endl;
                    cout << "ERROR : (" << pf.groundtruth[present][0] - x + initial_x << ","
                         << pf.groundtruth[present][1] - y + initial_y << ")" << endl;
                }
                cout << "---------------------------------------" << endl;
#endif

                local_start = present;
                local_match_count = match_count;
                LOCAL = position;
                clock_gettime(CLOCK_REALTIME,&tend);
                //cout<< "optimize map align consume time : " << double(tend.tv_nsec-tstart.tv_nsec)/1000000 <<endl;

                clock_gettime(CLOCK_REALTIME,&tstart);
                // if match with map is diverged
                if (isreloc(scan)) {
#ifdef _DEBUG
                    cout << "******************************************" << endl;
                    cout << "relocalization" << endl;
                    cout << "******************************************" << endl;
#endif
                    pf.sample_count = 3000;
                    Eigen::Vector3d state, state_temp;
                    if (history_position.size() >= 2)
                        position = history_position[history_position.size() - 2];
                    state(0, 0) = position(0, 3) * pf.resolution; // x could be [0,MAP.cols], MAP.clos+1 number in total
                    state(1, 0) = pf.map.rows -
                                  position(1, 3) * pf.resolution; // y could be [0,MAP.rows], MAP.rows+1 number in total
                    double p01 = asin(position(0, 1));
                    // pose is Tw_r which means
                    // | cos(alpha)   sin(alpha)  0    dx   |
                    // | -sin(alpha)  cos(alpha)  0    dy   |
                    // |     0            0       1    1    |
                    // |     0            0       0    1    |
                    // alpha is delta angle of two coordinate(world and robot),however isn't theta
                    // the world actually is INITIAL coordinate
                    // clockwise is positive
                    if (position(0, 0) >= 0 && position(0, 1) >= 0) state(2, 0) = -p01 * 180 / M_PI;
                    if (position(0, 0) <= 0 && position(0, 1) >= 0) state(2, 0) = p01 * 180 / M_PI - 180;
                    if (position(0, 0) <= 0 && position(0, 1) <= 0) state(2, 0) = p01 * 180 / M_PI + 180;
                    if (position(0, 0) >= 0 && position(0, 1) <= 0) state(2, 0) = -p01 * 180 / M_PI;
                    // theta = asin(pose(0,0));
                    // -180 =< theta <= 180
                    state_temp = state;
                    pf.history.push_back(state);
                    pf.relocalization();
                    for (int j = 0; j < 2; ++j) {
                        pf.forward(scan, Eigen::Vector3d::Zero(),angle_min,angle_max);
                    }
                    position = Matrix4f::Identity();
                    position(0, 0) = cos(-pf.state(2, 0) * M_PI / 180);
                    position(0, 1) = sin(-pf.state(2, 0) * M_PI / 180);
                    position(1, 0) = -position(0, 1);
                    position(1, 1) = position(0, 0);
                    position(0, 3) = pf.state(0, 0) / pf.resolution;
                    position(1, 3) = (pf.map.rows - pf.state(1, 0)) / pf.resolution;
                    position_car = position * Tlidar_car;
                    if (isreloc(scan)) {
#ifdef _DEBUG
                        cout << "******************************************" << endl;
                        cout << "relocalization area" << endl;
                        cout << "******************************************" << endl;
#endif
                        if (history_position.size() >= 2)
                            position = history_position[history_position.size() - 2];
                        pf.sample_count = 10000;
                        pf.history.push_back(state_temp);
                        pf.relocalization(3); // increase search area
                        for (int j = 0; j < 2; ++j) {
                            pf.forward(scan, Eigen::Vector3d::Zero(),angle_min,angle_max);
                        }
                        position = Matrix4f::Identity();
                        position(0, 0) = cos(-pf.state(2, 0) * M_PI / 180);
                        position(0, 1) = sin(-pf.state(2, 0) * M_PI / 180);
                        position(1, 0) = -position(0, 1);
                        position(1, 1) = position(0, 0);
                        position(0, 3) = pf.state(0, 0) / pf.resolution;
                        position(1, 3) = (pf.map.rows - pf.state(1, 0)) / pf.resolution;
                        position_car = position * Tlidar_car;
                    }
                }
                clock_gettime(CLOCK_REALTIME,&tend);
                //cout<< "optimize isreloc consume time : " << double(tend.tv_nsec-tstart.tv_nsec)/1000000 <<endl;
            }
            match_count++;
        }
    }

    void Localization::initial(vector<double > &odometry, vector<double > &scan,const float angle_min,const float angle_max) {
        vector<double > input;
        if (readfromfile)
            input = pf.readscans[0];
        else
            input = scan;

        vector<float > angles;
        vector<double > cos_theta, sin_theta;
        //unsigned long num = scan.size();
        float angle_increase = (angle_max-angle_min)/(input.size()-1);
        for (int k = 0; k < input.size(); ++k) {
            angles.push_back(angle_min+k*angle_increase);
            cos_theta.push_back(cos(angles.back()/180*M_PI));
            sin_theta.push_back(sin(angles.back()/180*M_PI));
        }
        
        Eigen::Vector3d zero_input = Eigen::Vector3d::Zero();
        for (int j = 0; j < 3; ++j)
            pf.forward(input,zero_input,angle_min,angle_max);
        // initial_pose is Tw_r which means
        // | cos(alpha)   sin(alpha)  0    dx   |
        // | -sin(alpha)  cos(alpha)  0    dy   |
        // |     0            0       1    1    |
        // |     0            0       0    1    |
        Eigen::Matrix4f initial_pose = Eigen::Matrix4f::Identity();
        initial_pose(0,0) = cos(-pf.state(2,0)*M_PI/180);
        initial_pose(0,1) = sin(-pf.state(2,0)*M_PI/180);
        initial_pose(1,0) = -initial_pose(0,1);
        initial_pose(1,1) = initial_pose(0,0);
        initial_pose(0,3) = pf.state(0,0)/pf.resolution;
        initial_pose(1,3) = (pf.map.rows-pf.state(1,0))/pf.resolution;
        map.INITIAL = initial_pose;
        position = initial_pose;
        position_car = position*Tlidar_car;
        initial_x = position_car(0,3);
        initial_y = position_car(1,3);
        cout << initial_x << endl;
        cout << initial_y << endl;
        if (position_car(0,0)>=0 && position_car(0,1)>=0) initial_theta = -asin(position_car(0,1))*180/M_PI;
        if (position_car(0,0)<=0 && position_car(0,1)>=0) initial_theta = asin(position_car(0,1))*180/M_PI-90;
        if (position_car(0,0)<=0 && position_car(0,1)<=0) initial_theta = asin(position_car(0,1))*180/M_PI-90;
        if (position_car(0,0)>=0 && position_car(0,1)<=0) initial_theta = -asin(position_car(0,1))*180/M_PI;
        LOCAL = initial_pose;
        out(input,angles,cos_theta,sin_theta);
        PointCloudT::Ptr Temp(new PointCloudT);
        int r = random(RANG_MIN,RANG_MAX);
        int g = random(RANG_MIN,RANG_MAX);
        int b = random(RANG_MIN,RANG_MAX);
        for (int i = 0; i < input.size(); ++i) {
            PointT H;
            if (scan[i] < VALID_MIN || scan[i] > VALID_MAX) continue;
            H.x = scan[i]*cos_theta[i];
            H.y = scan[i]*sin_theta[i];
            H.z = 1.;
            H.r = r;
            H.g = g;
            H.b = b;
            Temp->push_back(H);
        }
        v_Cache.push_back(Temp);
        odo.push_back(odometry);
        string name = "/home/mrm/ICRA/Dataset/20191218/pcd/map" + to_string(present) + ".pcd";
        pcl::io::savePCDFileBinary(name,*Temp);
    /*else{
        if(!pf.data_reader())
            cout << "error : data stream is not allowed !";
        Eigen::Vector3d zero_input = Eigen::Vector3d::Zero();
        for (int j = 0; j < 3; ++j) {
            pf.forward(pf.scan,zero_input);
        }
        // initial_pose is Tw_r which means
        // | cos(alpha)   sin(alpha)  0    dx   |
        // | -sin(alpha)  cos(alpha)  0    dy   |
        // |     0            0       1    1    |
        // |     0            0       0    1    |
        Eigen::Matrix4f initial_pose = Eigen::Matrix4f::Identity();
        initial_pose(0,0) = cos(-pf.state(2,0)*M_PI/180);
        initial_pose(0,1) = sin(-pf.state(2,0)*M_PI/180);
        initial_pose(1,0) = -initial_pose(0,1);
        initial_pose(1,1) = initial_pose(0,0);
        initial_pose(0,3) = pf.state(0,0)/pf.resolution;
        initial_pose(1,3) = (pf.map.rows-pf.state(1,0))/pf.resolution;
        map.INITIAL = initial_pose;
        position = initial_pose;
        position_car = position*Tlidar_car;
        LOCAL = initial_pose;
        out(pf.scan);
        PointCloudT::Ptr Temp(new PointCloudT);
        int r = random(RANG_MIN,RANG_MAX);
        int g = random(RANG_MIN,RANG_MAX);
        int b = random(RANG_MIN,RANG_MAX);
        for (int i = 0; i < scan_num; ++i) {
            PointT H;
            if (pf.scan[i] < VALID_MIN || pf.scan[i] > VALID_MAX) continue;
            H.x = pf.readscans[0][i]*Sin_theta[i];
            H.y = -pf.readscans[0][i]*Cos_theta[i];
            H.z = 1.;
            H.r = r;
            H.g = g;
            H.b = b;
            Temp->push_back(H);
        }
        v_Cache.push_back(Temp);
        odo.push_back(pf.odometry[0]);
    }*/
    }

}
