#ifndef AMCL_PCL_LASER_MAP_H
#define AMCL_PCL_LASER_MAP_H

#include <string.h>
#include <math.h>
#include <iostream>

#include <opencv2/opencv.hpp>
#include <Eigen/Core>
#include <pcl/point_types.h>
#include <pcl/io/pcd_io.h>
#include <pcl/registration/icp.h>
#include <pcl/registration/icp_nl.h>
#include <pcl/registration/gicp.h>

using namespace std;
using namespace cv;
using namespace Eigen;
typedef pcl::PointXYZRGB PointT;
typedef pcl::PointCloud<PointT> PointCloudT;

namespace hitcrt{
    class Laser_Map
    {
    public:
        EIGEN_MAKE_ALIGNED_OPERATOR_NEW
        Mat MAP; // raw map image, map is 8.1x5.1m(only for ICRA2020 map)
        Mat dist_map; // dist_map to accelerate scan_range calc
        uchar** map; // convert Mat_MAP to ARRAY_MAP
        string FILE = "../map/map_gray810x510.png"; // Map file path
        Matrix4f INITIAL; // Robot initial pose Tw_r at time 0
        vector<double > scan; // distance of each laser
        vector<double > scan_theta; // angle of each laser
        vector<Point2i > P; // store every laser end point image coordination
        unsigned int scan_num = 300; // how many lasers per scan
        double angle = 270.; // scan angle
        int x = 0;
        int y = 0;
        int expand_x = 100;
        int expand_y = 100;
        double z = 1.;
        double theta = 0.;
        double RESOLUTION; // **pixel/meter

        Laser_Map();
        // in PCL_ICP test and mrpt envirnment ,out INITIAL is
        // | 1  0  0  0.2 |
        // | 0  1  0  0.2 |
        // | 0  0  1   1  |
        // | 0  0  0   1  |
        Laser_Map(const string filename,const Matrix4f pose):FILE(filename),INITIAL(pose){
            MAP = imread(FILE,0);
            dist_map = imread("../map/map810x510_dist.png",IMREAD_GRAYSCALE);
            cout << "Image read" << endl;
            RESOLUTION = MAP.cols/8.1;
            map = Mat2Vec(MAP);
        };

        uchar** Mat2Vec(Mat &mat);
        // show the laser scan in Map image
        void show();
        // Draw laser scan use Bresenham algorithm
        void DrawLine(Mat &Laser);
        // calc scan
        void calc_scan();
        // input Tw_r and return optimized pose
        // input pose is relative to INITIAL, Tw_r is Tinitial_r
        Matrix4f run(Matrix4f pose, PointCloudT::Ptr align_scan,int num);
        // calc one laser value from laser theta and x,y
        Point2i calc_range(double &theta_now);
        // clear all the varialble
        void relax();
    };
}
#endif //AMCL_PCL_LASER_MAP_H
