#include <stdlib.h>
#include <math.h>
#include <random>
#include <ctime>

#include "particle_filter.h"

using namespace std;
using namespace cv;
using namespace Eigen;

namespace hitcrt{

    default_random_engine generator(static_cast<unsigned int>(time(nullptr)));

    /**
     * @brief standard normal distribution integral
     */
    double ParticleFilter::normalCFD(double value)
    {
        return 0.5*erfc(-value * sqrt(0.5));
    }

    /**
     * @brief generate a gaussian random num
     * @return gaussian random num with E=0,V=sigma^2=1.0
     * X = X*V+E could form gaussian random num with E=E sigma=sigma variance=sigma^2
     */
    double ParticleFilter::gaussrand(double E,double sigma)
    {
        static double V1, V2, S;
        static int phase = 0;
        double X;

        if ( phase == 0 ) {
            do {
                double U1 =(double)rand()/RAND_MAX;
                double U2 =(double)rand()/RAND_MAX;
                V1 = 2*U1-1;
                V2 = 2*U2-1;
                S = V1*V1 + V2*V2;
            } while(S >= 1 || S == 0);

            X = V1*sqrt(-2*log(S)/S);
        } else
            X = V2*sqrt(-2*log(S)/S);

        phase = 1-phase;

        return X*sigma+E;
    }

    /**
     * @brief read scans & groundtruth & odometry from files
     */
    void ParticleFilter::read_data() {

        string FILE_NAME = file_path+"simul_LASER_SIM.txt";
        string GROUND_TRUTH_NAME = file_path+"simul.rawlog.GT.txt";
        string ODOMETRY_FILE = file_path+"simul_odometry.txt";
        // PCD_PATH = "/home/mrm/ICRA/Dataset/201910242/pcd/";
        // MAP_PATH = "/home/mrm/ICRA/map/map810x510_gray.png";

        ifstream data(FILE_NAME);
        double temp;
        string lines;
        stringstream iss;
        while (getline(data,lines))
        {
            vector<double > V;
            iss << lines;
            for (int i = 0; i < scan_num; ++i) {
                iss >> temp;
                V.push_back(temp);
            }
            readscans.push_back(V);
        }
        data.close();

        ifstream data2(GROUND_TRUTH_NAME);
        string lines_true;
        for (int j = 0; j < readscans.size(); ++j) {
            vector<double > V2;
            data2 >> temp;
            for (int i = 0; i < 3; ++i) {
                data2 >> temp;
                V2.push_back(temp);
            }
            groundtruth.push_back(V2);
        }
        data2.close();

        ifstream data3(ODOMETRY_FILE);
        getline(data3,lines);
        while (!data3.eof())
        {
            vector<double > V3;
            for (int i = 0; i < 4; ++i) {
                data3 >> temp;
                V3.push_back(temp);
            }
            getline(data3,lines);
            odometry.push_back(V3);
        }
        data3.close();
    }

    /**
     * @brief create a uniform distribution between (min,max)
     */

    int ParticleFilter::uniformint(int min,int max){
        uniform_int_distribution<int> distribution(min,max);
        return distribution(generator);
    }

    double ParticleFilter::uniformreal(double min,double max){
        // default_random_engine generator(static_cast<unsigned int>(time(nullptr)));
        uniform_real_distribution<double> distribution(min,max);
        return distribution(generator);
    }

    /**
     * @brief centered with point p, generate a random pose within a rectangle area(width & height)
     */
    Point3i ParticleFilter::arearand(const cv::Point &pt,int width,int height){
        assert(pt.x >= 0 && pt.x < map.cols && pt.y >= 0 && pt.y < map.rows);
        int cols = map.cols;
        int rows = map.rows;
        int x_min = (pt.x-width/2)>=0?(pt.x-width/2):0;
        int y_min = (pt.y-height/2)>=0?(pt.y-height/2):0;
        int x_max = (pt.x+width/2)<cols?(pt.x+width/2):(cols-1);
        int y_max = (pt.y+height/2)<rows?(pt.y+height/2):(rows-1);
        return Point3i(uniformint(x_min,x_max),uniformint(y_min,y_max),uniformint(-179,180));
    }

    /**
     * @brief sampling initialized points
     */
    void ParticleFilter::initialize() {
        Point pt(int(x_guess*resolution),int(map.rows-y_guess*resolution));
        int width = int(0.3*resolution); // +-15cm
        int height = int(0.3*resolution); // +-15cm
        for (int i = 0; i < sample_count; ++i) {
            particles.push_back(arearand(pt,width,height));
            weights.push_back(1.0/sample_count);
        }
    }

    /**
     * @brief 初始化撒点
     */
    void ParticleFilter::sample(float x,float y) {
        assert(x<8.1 && x >0 && y>0 && y<5.1);
        particles.clear();
        weights.clear();
        Point pt(int(x*resolution),int(map.rows-y*resolution));
        int width = int(0.5*resolution); // +-15cm
        int height = int(0.5*resolution); // +-15cm
        for (int i = 0; i < sample_count; ++i) {
            particles.push_back(arearand(pt,width,height));
            weights.push_back(1.0/sample_count);
        }
    }

    /**
     * @brief motion model
     */
    void ParticleFilter::motion_model(){
        for (int i = 0; i < particles.size(); ++i) {
            particles[i].x = particles[i].x+input(0,0)+gaussrand(0,x_alpha*input(0,0)*resolution+5.0);
            particles[i].y = particles[i].y+input(1,0)+gaussrand(0,y_alpha*input(1,0)*resolution+5.0);
            particles[i].z = particles[i].z+input(2,0)+gaussrand(0,theta_alpha*input(2,0)+1.0);
            if (particles[i].z > 180)
                particles[i].z -= 360;
            if (particles[i].z < -180)
                particles[i].z += 360;
        }
    }

    /**
     * @brief calc average & covirance of particle points
     */
    void ParticleFilter::static_estimation(){
        state = Vector3d::Zero();
        cov = Vector3d::Zero();
        for (const auto &l:particles) {
            state(0,0) += l.x;
            state(1,0) += l.y;
            state(2,0) += l.z;
        }
        state(0,0) = state(0,0)/sample_count;
        state(1,0) = state(1,0)/sample_count;
        state(2,0) = state(2,0)/sample_count;
        for (const auto &l:particles) {
            cov(0,0) += pow(l.x-state(0,0),2);
            cov(1,0) += pow(l.y-state(1,0),2);
            cov(2,0) += pow(l.z-state(2,0),2);
        }
        cov(0,0) = cov(0,0)/sample_count;
        cov(1,0) = cov(1,0)/sample_count;
        cov(2,0) = cov(2,0)/sample_count;
    }

    // return the point coordinate in dist_map coordinate
    vector<Point > ParticleFilter::pointfscan(const Point3i &pt){
        vector<double > laser_angle;
        vector<Point > ps;
        for (int i = 0; i < scan.size(); ++i) {
            laser_angle.push_back(pt.z+angles[i]);
        }
        for (int j = 0; j < scan.size(); ++j) {
            if (scan[j] > 0){

                Point temp;
                temp.x = int(pt.x+scan[j]*resolution*cos(laser_angle[j]*M_PI/180)+expand_x);
                temp.y = int(pt.y-scan[j]*resolution*sin(laser_angle[j]*M_PI/180)+expand_y);
                ps.push_back(temp);
            }
        }
        return ps;
    }

    /**
     * @brief update weights
     */
    void ParticleFilter::weight_update(){
        max_weight = 0;
        for (int i = 0; i < sample_count; ++i) {
            vector<Point > covpoints = pointfscan(particles[i]);
            double pz_x = 1.0;
            //cout << "weights before : " << weights[i] << endl;
            for (const auto& p:covpoints) {
                if (p.x<0 || p.x>=dis_map.cols || p.y<0 || p.y >=dis_map.rows){
                    pz_x=0.0;
                    break;
                }
                int dist = dis_map.ptr<uchar >(p.y)[p.x];
                double weight_gain = 2*(1-normalCFD(dist/pz_x_cov));
                pz_x *= weight_gain; // w_t = w_t-1*pz_x
            }

            weights[i] *= pz_x;

        }

        // normalize
        double norm = 0.0;
        for (const auto &l:weights) {
            norm += pow(l,2);
        }
        norm = sqrt(norm);
        for (auto &l:weights) {
            l = l/norm;
            if (l > max_weight)
                max_weight = l;
        }
        // cout << "max_weight : " << max_weight << endl;
    }

    /**
     * @brief low covirance sampling
     */
    void ParticleFilter::low_variance_resample(){
        vector<Point3i > new_particles;
        double r = uniformreal(0.0,1.0/double(sample_count));
        double c = weights[0];
        unsigned int j = 1;
        for (int i = 1; i <= sample_count; ++i) {
            double U = r+(i-1)/double(sample_count);
            while (U > c)
            {
                j++;
                c += weights[j-1];
            }
            new_particles.push_back(particles[j-1]);
        }
        for (int l = 0; l < sample_count; ++l) {
            particles[l] = new_particles[l];
        }
        for (int k = 0; k < sample_count; ++k) {
            weights[k] = 1.0/double(sample_count);
        }
    }

    /**
     * @brief forward
     */
    void ParticleFilter::forward(const vector<double > &sn,const Vector3d &in, const float angle_min, const float angle_max){
        scan = sn;
        input = in;
        float angle_increment = (angle_max-angle_min)/(scan.size()-1);
        vector<double > angle;
        scan_num = static_cast<unsigned int>(scan.size());
        for (int i = 0; i < scan_num; ++i)
            angle.push_back(angle_min+i*angle_increment);
        angles = angle;
        motion_model();
        weight_update();
        static_estimation();
        low_variance_resample();
        isreloc();
        history.push_back(state);
    }

    void ParticleFilter::isreloc() {
        if (max_weight<0.05 && history.size()>=2)
            relocalization();
        /*
        if (history.size() >= 2)
        {
            velocity = sqrt(pow(history[history.size()-1](0,0)-history[history.size()-2](0,0),2)+
                                   pow(history[history.size()-1](1,0)-history[history.size()-2](1,0),2));
            oumega = sqrt(pow(history[history.size()-1](2,0)-history[history.size()-2](2,0),2));
        }
         */
    }

    void ParticleFilter::relocalization(double area){
        particles.clear();
        weights.clear();
        Vector3d final_pose = history[history.size()-1];
        // pose is in map camera coordinate
        int x = int(final_pose(0,0));
        int y = int(final_pose(1,0));
        int theta = int(final_pose(2,0));
        Point pt(x,y);
        // int sample_count_temp = sample_count;
        int width = int(area*resolution); // +-1.5m
        int height = int(area*resolution); // +-1.5m
        for (int i = 0; i < sample_count; ++i) {
            particles.push_back(arearand(pt,width,height));
            weights.push_back(1.0/sample_count);
        }
    }

}
