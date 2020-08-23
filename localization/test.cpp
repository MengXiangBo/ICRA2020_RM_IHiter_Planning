#include <sys/time.h>

#include <opencv2/opencv.hpp>

#include "nnmap.h"
#include "particle_filter.h"
#include "localization.h"
using namespace hitcrt;
using namespace cv;
using namespace std;
int scan_num = 300;
vector<vector<double >> scan; // container of simulation scan data
vector<vector<double >> odo; // container of simulation odometry
vector<vector<double >> gro; // container of simulation groundtruth

string path1 = "../Dataset/20191218/"; // dataset folder
std::string map_path = "../map/map810x510_dist.png"; // map
std::string path = "../map/map810x510.png";

// read scan & odometry & groundtruth, save in containers
void read_data() {

    string FILE_NAME = path1+"simul_LASER_SIM.txt";
    string GROUND_TRUTH_NAME = path1+"simul.rawlog.GT.txt";
    string ODOMETRY_FILE = path1+"simul_odometry.txt";

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
        scan.push_back(V);
    }
    data.close();

    ifstream data2(GROUND_TRUTH_NAME);
    string lines_true;
    for (int j = 0; j < scan.size(); ++j) {
        vector<double > V2;
        data2 >> temp;
        for (int i = 0; i < 3; ++i) {
            data2 >> temp;
            V2.push_back(temp);
        }
        gro.push_back(V2);
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
        odo.push_back(V3);
    }
    data3.close();
}
/*
// create nearest map & save
int main(){
    Nmap dis(100,100,true);
    dis.show();
	return 0;
};
 */

// draw arrow
void showmatrix(const Point3i &particale,Mat &showimage)
{
    double radius = 15;
    Point end;
    end.x = particale.x+radius*cos(particale.z*M_PI/180);
    end.y = particale.y-radius*sin(particale.z*M_PI/180);
    arrowedLine(showimage, Point(particale.x,particale.y),
            end,Scalar(0,0,255),2,8,0,0.3);
}


int main() {

    read_data();
    Localization lo(1500, 0.35, 0.2, 0.2, 0.2, 0.4, false);
    lo.initial(odo[0],scan[0],-135,135);
	Mat image = imread(path,0);
    Mat showimage;

    Matrix4f p;
    timespec ststart,stend;
    unsigned long count = 0;
    double d_ft = 0.0;
	Point3d state_temp;
	double error = 0;
	int countn = 0;
	image.copyTo(showimage);
	cvtColor(showimage,showimage,CV_GRAY2RGB);

    for (int j = 1; j < scan.size(); ++j) {
        //image.copyTo(showimage);
        // start = clock();
        clock_gettime(CLOCK_REALTIME,&ststart);
        lo.run(scan[j],odo[j],-135,135);
        clock_gettime(CLOCK_REALTIME,&stend);
        // end = clock();
        p = lo.position_car;
        Point3d state;

		// 从T矩阵数据转成x、y、theta
        double x = p(0,3)*lo.pf.resolution; // x could be [0,MAP.cols], MAP.clos+1 number in total
        double y = lo.pf.map.rows-p(1,3)*lo.pf.resolution; // y could be [0,MAP.rows], MAP.rows+1 number in total
        double p01 = asin(p(0,1));

        // pose is Tw_r which means
        // | cos(alpha)   sin(alpha)  0    dx   |
        // | -sin(alpha)  cos(alpha)  0    dy   |
        // |     0            0       1    1    |
        // |     0            0       0    1    |
        // alpha is delta angle of two coordinate(world and robot),however isn't theta
        // the world actually is INITIAL coordinate
        // clockwise is positive
		// 将坐标变换的角度转化成地图中的角度，地图角度用来画图
		// 坐标角度顺时针为正，地图角度逆时针为正
        if (p(0,0)>=0 && p(0,1)>=0) state.z = -p01*180/M_PI;
        if (p(0,0)<=0 && p(0,1)>=0) state.z = p01*180/M_PI-180;
        if (p(0,0)<=0 && p(0,1)<=0) state.z = p01*180/M_PI+180;
        if (p(0,0)>=0 && p(0,1)<=0) state.z = -p01*180/M_PI;
        // theta = asin(pose(0,0));
        // -180 =< theta <= 180
        state.x = x;
        state.y = y;
		if (j == 1)
		{
			state_temp = state;
			cout << "ground truth : " << gro[j][0]+0.35 << "," << gro[j][1]+0.2 << endl;
			cout << "calc : " << x/100.f << "," << (510-y)/100.f << endl;
			error += pow(gro[j][0]+0.35-x/100.f,2)+pow(gro[j][1]+0.2-(510-y)/100.f,2);
			countn++;
		}
		else
		{
			if (state != state_temp)
			{
				state_temp = state;
				cout << "ground truth : " << gro[j][0]+0.35 << "," << gro[j][1]+0.2 << endl;
				cout << "calc : " << x/100.f << "," << (510-y)/100.f << endl;
				error += pow(gro[j][0]+0.35-x/100.f,2)+pow(gro[j][1]+0.2-(510-y)/100.f,2);
				countn++;
			}
			
		}
		
        showmatrix(state,showimage);
		Point2d g((gro[j][0]+0.35)*100,(5.1-gro[j][1]-0.2)*100);
		circle(showimage, g, 1, Scalar(255, 0, 0));
        waitKey(1);
        imshow("position",showimage);
        if ((stend.tv_nsec-ststart.tv_nsec)/1000000 > 0.5)
        {
            count++;
            d_ft += (stend.tv_nsec-ststart.tv_nsec)/1000000;
#ifdef _DEBUG
            cout<< "consume time : " << double(stend.tv_nsec-ststart.tv_nsec)/1000000 <<endl;
            cout << "average consume time : " << d_ft/count << endl;
            cout << endl;
#endif
        }
    }

	cout << "abs rmse error : " << sqrt(error/countn) << endl;
    return 0;
}
