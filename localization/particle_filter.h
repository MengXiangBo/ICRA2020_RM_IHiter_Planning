#ifndef AMCL_PCL_PARTICLE_FILTER_H
#define AMCL_PCL_PARTICLE_FILTER_H

#include <random>
#include <iostream>
#include <string.h>
#include <vector>

#include <opencv2/opencv.hpp>
#include <Eigen/Core>
#include <Eigen/Dense>
#include <libfreenect_audio.h>


namespace hitcrt{
    class ParticleFilter{
    public:
        EIGEN_MAKE_ALIGNED_OPERATOR_NEW;
        std::string map_path = "../map/map810x510_dist.png";
        std::string file_path = "../Dataset/20191218/";
        int expand_x = 100;
        int expand_y = 100;
        unsigned int sample_count = 1000;
        double pz_x_cov = 10; // 4pixel(means 4cm) is covariance of pz_x, pz_x~N(0,16)
        std::vector<std::vector<double >> readscans;
        std::vector<std::vector<double >> groundtruth;
        std::vector<std::vector<double >> odometry;
        std::vector<cv::Point3i > particles; // particles in camera coordinate
        std::vector<Eigen::Vector3d > history;
        std::vector<double > scan;
        std::vector<double > angles;
        Eigen::Vector3d state; // x,y,theta at t time
        Eigen::Vector3d cov; // covariance of state
        cv::Mat dis_map;
        cv::Mat map;
        double resolution;

        ParticleFilter(){}
        ParticleFilter(unsigned int count,double x,double y,double xa ,double ya,double ta,bool readflag):
        sample_count(count),x_guess(x),y_guess(y),x_alpha(xa),y_alpha(ya),theta_alpha(ta),read_flag(readflag)
        {
            dis_map = cv::imread(map_path,0);
            cv::Rect rect(expand_x,expand_y,dis_map.cols-2*expand_x,dis_map.rows-2*expand_y);
            dis_map(rect).copyTo(map);
            resolution = map.cols/8.1; // pixels/meter
            initialize();
            if (read_flag)
                read_data();
            // from right to left
            //for (int i = 0; i < scan_num; ++i)
            //    angles.push_back(-scan_range/2+i*scan_range/scan_num);
        };
        ~ParticleFilter()= default;

        void forward(const std::vector<double > &scan,const Eigen::Vector3d &in,const float angle_min,const float angle_max);
        void relocalization(double area=1.5); // reloc when miss the target
        bool data_reader(); // read from real sensor : scan and odometry
        double normalCFD(double value);
        void initialize();
        void sample(float x,float y);

    private:
        unsigned int scan_num = 300;
        double scan_range = 270;
        std::vector<double > weights;
        Eigen::Vector3d input; // dx,dy,dtheta
        cv::Point3d Ex; // expectation
        bool read_flag = false;
        double x_guess = 0.35; // start position x guess
        double y_guess = 0.2; // start position y guess
        double x_alpha = 0.06; // 0.06m/m sigma x
        double y_alpha = 0.06; // 0.06m/m sigma y
        double theta_alpha = 0.1; // 0.1degrad/degrad sigma theta
        double max_weight = 1.0;
        double velocity; // velocity
        double oumega; // angle velocity

        void read_data(); // read from files
        std::vector<cv::Point > pointfscan(const cv::Point3i &pt);
        void motion_model();
        void weight_update();
        void low_variance_resample();
        void static_estimation();
        void isreloc(); // reloc conditions
        double gaussrand(double E=0.0,double sigma=1.0);
        int uniformint(int min,int max); // generate a uniform distribution between [min,max]
        double uniformreal(double min,double max); // generate a uniform distribution between [min,max]
        cv::Point3i arearand(const cv::Point &pt,int width,int height); // only used when initialize and reloc
    };
}

#endif //AMCL_PCL_PARTICLE_FILTER_H
