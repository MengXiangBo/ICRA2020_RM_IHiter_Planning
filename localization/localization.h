#ifndef AMCL_PCL_LOCALIZATION_H
#define AMCL_PCL_LOCALIZATION_H

#include <string.h>
#include <iostream>

#include <pcl/point_types.h>
#include <pcl/io/pcd_io.h>
#include <pcl/registration/icp.h>
#include <pcl/registration/icp_nl.h>
#include <pcl/registration/gicp.h>

#include "laser_map.h"
#include "particle_filter.h"

using namespace std;

namespace hitcrt{
#define random(a,b) (rand()%(b-a)+a)
    typedef pcl::PointXYZRGB PointT;
    typedef pcl::PointCloud<PointT> PointCloudT;

    class Localization{
    public:
        EIGEN_MAKE_ALIGNED_OPERATOR_NEW;
        double initial_x; // initial_car_x
        double initial_y; // initial_car_y
        double initial_theta; // initial_car_theta
        Matrix4f position; // position is Tw_lidar
        Matrix4f position_car; // position_car is Tw_car
        vector<vector<double >> scans; // record scans
        vector<vector<double >> odo; // record odometrys
        bool readfromfile = false;
        const unsigned scan_num = 300;
        unsigned int present = 0;
        unsigned int local_start = 0;
        unsigned int start = 0;
        unsigned int match_count = 1;
        unsigned int local_match_count = 1;
        unsigned int scan_size;
        // string FILE_NAME;
        // string GROUND_TRUTH_NAME;
        // string ODOMETRY_FILE;
        // string PCD_PATH;
        // string MAP_PATH;
        // int interrupt = 10;
        double RESOLUTION; // pixel/meter
        double ALPHA = 270; // Lidar Scan angle
        double ALPHA_RESOLUTION = ALPHA/scan_num;
        int RANG_MAX = 255;
        int RANG_MIN = 0;
        double VALID_MIN = 0.26;
        double VALID_MAX = 15.0;
        vector<double > Cos_theta;
        vector<double > Sin_theta;
        vector<Matrix4f > history_position;
        vector<PointCloudT::Ptr > v_Cache;
        pcl::IterativeClosestPoint<PointT,PointT> icp;
        Matrix4f Tlidar_car = Matrix4f::Identity();
        Matrix4f LOCAL = Matrix4f::Identity(); // record the last local map position
        Matrix3f delta_R = Matrix3f::Identity(); // calc deltaT of present position and last local map position


        Laser_Map map;
        ParticleFilter pf;
        Localization(unsigned int count,double x,double y,double xa ,double ya,double ta, bool readflag):
                pf(count,x,y,xa,ya,ta,readflag),map() {
            readfromfile = readflag;
            RESOLUTION = pf.resolution;
            Tlidar_car(0, 3) = -0.175;

            //for (int i = 0; i < scan_num; ++i) {
            //    Cos_theta.push_back(cos(M_PI / 2 - ALPHA / 2 * M_PI / 180 + i * ALPHA_RESOLUTION * M_PI / 180));
            //    Sin_theta.push_back(sin(M_PI / 2 - ALPHA / 2 * M_PI / 180 + i * ALPHA_RESOLUTION * M_PI / 180));
            //}
        }

		// 定位总函数
        void run(vector<double > &scan,vector<double > &odometry, const float angle_min, const float angle_max);
		// 开机初始化，粒子滤波计算机器人初始坐标
        void initial(vector<double > &odometry, vector<double > &scan,const float angle_min, const float angle_max);

    private:
        void out(vector<double > &scan, vector<float > &angle, vector<double > &cos_theta, vector<double > &sin_theta);
        bool isreloc(vector<double > &scan);
    };
}

#endif //AMCL_PCL_LOCALIZATION_H
