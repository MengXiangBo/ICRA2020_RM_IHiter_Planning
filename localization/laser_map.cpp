#include "laser_map.h"

int RANG_MAX = 255;
int RANG_MIN = 0;
double VALID_MIN = 0.26;
double VALID_MAX = 20.0;
#define random(a,b) (rand()%(b-a)+a)

namespace hitcrt{

    timespec start,end,astart,aend;

    uchar** Laser_Map::Mat2Vec(Mat &mat)
    {

        uchar **array = new uchar*[mat.rows];
        for (int i = 0; i<mat.rows; ++i)
            array[i] = new uchar[mat.cols];
        for (int i = 0; i < mat.rows; ++i)
        {
            for (int j = 0; j < mat.cols; ++j)
            {
                array[i][j] = mat.at<uchar>(i, j);
            }
        }

        return array;
    }

    // default construction
    Laser_Map::Laser_Map()
    {
        INITIAL = Matrix4f::Identity(4,4);
        MAP = imread(FILE,IMREAD_GRAYSCALE);
        dist_map = imread("/home/mrm/ICRA/map/map810x510_dist.png",IMREAD_GRAYSCALE);
        cout << "Image read" << endl;
        RESOLUTION = MAP.cols/8.1;
        map = Mat2Vec(MAP);
    }

    // return the Tw_c aligned with map
    Matrix4f Laser_Map::run(Matrix4f pose, PointCloudT::Ptr align_scan,int num)
    {
        clock_gettime(CLOCK_REALTIME,&astart);
        clock_gettime(CLOCK_REALTIME,&start);
        // Matrix4f Tc_j = Matrix4f::Identity(4,4);
        // Tc_j(1,3) = 0.125;
        // pose = pose*Tc_j;
        x = int(pose(0,3)*RESOLUTION); // x could be [0,MAP.cols], MAP.clos+1 number in total
        y = int(pose(1,3)*RESOLUTION); // y could be [0,MAP.rows], MAP.rows+1 number in total
        if (x == MAP.cols) x = MAP.cols-1; // scale x to [0,MAP.cols-1]
        if (y == MAP.rows) y = MAP.rows-1; // scale y to [0,MAP.rows-1]
        z = 1;
        double p01 = asin(pose(0,1));
        // pose is Tw_r which means
        // | cos(alpha)   sin(alpha)  0    dx   |
        // | -sin(alpha)  cos(alpha)  0    dy   |
        // |     0            0       1    1    |
        // |     0            0       0    1    |
        // alpha is delta angle of two coordinate(world and robot),however isn't theta
        // the world actually is INITIAL coordinate
        // clockwise is positive
        if (pose(0,0)>=0 && pose(0,1)>=0) theta = -p01*180/M_PI;
        if (pose(0,0)<=0 && pose(0,1)>=0) theta = p01*180/M_PI-180;
        if (pose(0,0)<=0 && pose(0,1)<=0) theta = p01*180/M_PI+180;
        if (pose(0,0)>=0 && pose(0,1)<=0) theta = -p01*180/M_PI;
        // theta = asin(pose(0,0));
        // -180 =< theta <= 180
        clock_gettime(CLOCK_REALTIME,&end);
#ifdef _DEBUG
        cout<< "optimize2 stage1 consume time : " << double(end.tv_nsec-start.tv_nsec)/1000000 <<endl;
#endif
        clock_gettime(CLOCK_REALTIME,&start);
        calc_scan();
        clock_gettime(CLOCK_REALTIME,&end);
#ifdef _DEBUG
        cout<< "optimize2 stage2 consume time : " << double(end.tv_nsec-start.tv_nsec)/1000000 <<endl;
#endif
        clock_gettime(CLOCK_REALTIME,&start);
        vector<double > Cos_theta;
        vector<double > Sin_theta;
        for (int i = 0; i < scan_num; ++i) {
            // cos and sin is from left to right
            Cos_theta.push_back(cos(-angle/2*M_PI/180+i*angle/scan_num*M_PI/180));
            Sin_theta.push_back(sin(-angle/2*M_PI/180+i*angle/scan_num*M_PI/180));

            //Cos_theta.push_back(cos(M_PI/2-angle/2*M_PI/180+i*angle/scan_num*M_PI/180));
            //Sin_theta.push_back(sin(M_PI/2-angle/2*M_PI/180+i*angle/scan_num*M_PI/180));
        }

        PointCloudT::Ptr MAP_POS(new PointCloudT);
        int r = random(RANG_MIN,RANG_MAX);
        int g = random(RANG_MIN,RANG_MAX);
        int b = random(RANG_MIN,RANG_MAX);

        for (int i = 0; i < scan_num; ++i) {
            PointT H;
            if (scan[i] < VALID_MIN || scan[i] > VALID_MAX) continue;
            // scan is from left to right
            //H.x = scan[i]*Sin_theta[i];
            //H.y = scan[i]*Cos_theta[i];
            // scan is from right to left
            H.x = scan[i]*Cos_theta[i];
            H.y = scan[i]*Sin_theta[i];
            H.z = 1.;
            H.r = r;
            H.g = g;
            H.b = b;
            MAP_POS->push_back(H);
        }

        bool calc_flag=true;
        clock_gettime(CLOCK_REALTIME,&end);
#ifdef _DEBUG
        cout<< "optimize2 stage3 consume time : " << double(end.tv_nsec-start.tv_nsec)/1000000 <<endl;
#endif
        clock_gettime(CLOCK_REALTIME,&start);
        PointCloudT::Ptr N1(new PointCloudT);
        PointCloudT::Ptr N2(new PointCloudT);
        // kick out outliers from each other
        for (int j=0; j<MAP_POS->points.size() ;j++) {
            bool OK = false;
            PointT P1 = MAP_POS->points[j];
            vector<int > OBSERVATION;

            for (int k=0; k<align_scan->points.size(); k++) {
                // two points are close enough
                PointT P2 = align_scan->points[k];
                if (abs(P1.x-P2.x)<0.2 && abs(P1.y-P2.y)<0.2)
                {
                    if ((pow((P1.x-P2.x),2)+pow((P1.y-P2.y),2))<0.04)
                    {
                        OK = true;
                        OBSERVATION.push_back(k);
                        //break;
                    }
                }
            }
            if (OK)
                N2->push_back(P1);
        }
        if (N2->empty()) calc_flag=false;

        if (calc_flag)
        {
            PointCloudT::Ptr Final(new PointCloudT);
            pcl::IterativeClosestPoint<PointT, PointT> icp;
            icp.setInputSource(align_scan);
            icp.setInputTarget(N2);
            icp.setMaxCorrespondenceDistance(0.15);
            icp.setMaximumIterations(15);
            icp.setTransformationEpsilon(1e-3);
            icp.setEuclideanFitnessEpsilon(0.01);
            icp.align(*Final);
            Matrix4f transformation = icp.getFinalTransformation();
            // suppose pose is c positon, so pose is Tw_c, icp get Tc_robot, so Tw_robot = Tw_c*Tc_robot
#ifdef _DEBUG
            printf("Aligned with map !\n");
#endif
            // string PATH_NAME2="/home/mrm/ICRA/Dataset/201910242/pcd/map"+to_string(num)+"s.pcd";
            // pcl::io::savePCDFileBinary(PATH_NAME2, *Final);
            //show();
            return pose*transformation;
        }
        clock_gettime(CLOCK_REALTIME,&end);
        clock_gettime(CLOCK_REALTIME,&aend);
#ifdef _DEBUG
        cout<< "optimize2 stage4 consume time : " << double(end.tv_nsec-start.tv_nsec)/1000000 <<endl;
        cout<< "optimize2 icp consume time : " << double(aend.tv_nsec-astart.tv_nsec)/1000000 <<endl;
#endif
        /*
        PointCloudT::Ptr Final(new PointCloudT);
        pcl::IterativeClosestPoint<PointT,PointT> icp;
        icp.setInputSource(align_scan);
        icp.setInputTarget(MAP_POS);
        icp.setMaxCorrespondenceDistance(0.1);
        icp.setMaximumIterations(50);
        icp.setTransformationEpsilon(1e-8);
        icp.setEuclideanFitnessEpsilon(0.01);
        icp.align(*Final);
        Matrix4f transformation = icp.getFinalTransformation();

        show();
         */
        return pose;
    }

    // calc all lasers scan value
    void Laser_Map::calc_scan()
    {
        for (int i = 0; i < scan_num; ++i) {
            Point2i p;
            //scan_theta.push_back(theta+angle/2-i*angle/scan_num); // lasers from left to right
            scan_theta.push_back(theta-angle/2+i*angle/scan_num); // lasers from right to left
            p = calc_range(scan_theta[i]); // if range is 0 then the point is invalid;
            if (p.x==0 && p.y==0)
                scan.push_back(0.0);
            else
                scan.push_back((sqrt(pow(p.x-x,2)+pow(MAP.rows-p.y-y,2)))/RESOLUTION);
            P.push_back(p);
        }
        //show();
    }


    // theta_now should be
    // in range (-180,180]
    Point2i Laser_Map::calc_range(double &theta_now)
    {
        // laser_theta won't beyond 360 or below -360
        // scale laser_theta to (-180,180]
        if (theta_now>180) theta_now -= 360;
        if (theta_now<=-180) theta_now += 360;

        int x_ration;
        int y_ration;
        double theta;
        if (theta_now > 0 && theta_now <= 90)
        {
            x_ration = 1;
            y_ration = 1;
            theta = theta_now;
        }
        else if (theta_now > 90 && theta_now <= 180)
        {
            x_ration = -1;
            y_ration = 1;
            theta = 180-theta_now;
        }
        else if (theta_now > -180 && theta_now <= -90)
        {
            x_ration = -1;
            y_ration = -1;
            theta = theta_now+180;
        }
        else if (theta_now > -90 && theta_now <= 0)
        {
            x_ration = 1;
            y_ration = -1;
            theta = -theta_now;
        } else return Point2i(0,0);

        int dynamic_x = x + x_ration;
        int dynamic_y = y;
        double dx = dynamic_x-x;
        double dy = dynamic_y-y;
        // while pixel is white
        while (map[MAP.rows-dynamic_y-1][dynamic_x*MAP.channels()] > 100)
        {
            int dist = dist_map.ptr<uchar>(MAP.rows-dynamic_y-1+expand_y)[dynamic_x*MAP.channels()+expand_x];
            int y_gain = abs(int(dist*sin(theta*M_PI/180)));
            int x_gain = abs(int(dist*cos(theta*M_PI/180)));

            if (abs(dy/dx)>tan(theta*M_PI/180))
            {
                if (x_gain > 3)
                    dynamic_x += x_gain*x_ration;
                else
                    dynamic_x += x_ration;
                dx = dynamic_x-x;
            }
            else{
                if (y_gain > 3)
                    dynamic_y += y_gain*y_ration;
                else
                    dynamic_y += y_ration;
                dy = dynamic_y-y;
            }

            if (dynamic_y >= MAP.rows-1 || dynamic_y < 0 || dynamic_x > MAP.cols-1 || dynamic_x < 0)
                return Point2i(dynamic_x,MAP.rows-dynamic_y-1);
        }
        return Point2i(dynamic_x,MAP.rows-dynamic_y-1);
    }

    // Draw laser scan use Bresenham algorithm
    void Laser_Map::DrawLine(Mat &Laser)
    {
        int image_x = x;
        int image_y = MAP.rows-y-1;
        for (int j = 0; j < scan_num; ++j) {
            // line in red, thickness is 2, lineType is 8
            line(Laser,Point2i(image_x,image_y),P[j],Scalar(0,0,255),1);
        }
    }

    // show the laser scan in Map image
    void Laser_Map::show()
    {
        Mat Laser;
        MAP.copyTo(Laser);
        DrawLine(Laser);
        while (waitKey(10) != 27)
        {
            imshow("LASER",Laser);
        }
    }

    void Laser_Map::relax()
    {
        scan.clear();
        scan_theta.clear();
        P.clear();
    }

}
