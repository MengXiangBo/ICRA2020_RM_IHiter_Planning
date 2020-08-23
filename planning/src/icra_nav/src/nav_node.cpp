#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "nav_msgs/Odometry.h"
#include "tf/transform_listener.h"
#include "icra_nav/path_srv.h"
#include "icra_nav/c_path_srv.h"
#include "navigation.h"
#include <opencv2/opencv.hpp>
#include <image_transport/image_transport.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
using namespace cv;
using namespace std;

double PI = 3.14159265357;

NavInfo nav_info, nav_info_slave;
Mat image0, image, image_p;
sensor_msgs::ImagePtr image_msg;
void DrawPath(Mat& src, vector<NavInfo::ST_3V> linecircle_path, Scalar color);//可视化
void DrawPos(Mat& src, Point2i point, float angle, Scalar color);//可视化

bool PathInit(icra_nav::path_srv::Request  &req, icra_nav::path_srv::Response &res)
{
    uint num = req.vfPathPositionX.size();
	vector<NavInfo::ST_3V> path;
	NavInfo::ST_3V point;

	for(uint i = 0; i < num; i++)
	{
		point.x = req.vfPathPositionX[i];
		point.y = req.vfPathPositionY[i];
		path.push_back(point);

	}
	nav_info.path_pos = path;
	nav_info.nav_state = NavInfo::NAV_LINE;
	nav_info.NavigationInit();
	image = image0.clone();
	DrawPath(image, nav_info.linecircle_path, Scalar(0, 255, 0));
	image_p = image.clone();
	return true;
}
bool CPathInit(icra_nav::c_path_srv::Request  &req, icra_nav::c_path_srv::Response &res)
{

	vector<NavInfo::ST_3V> path;
	vector<NavInfo::ST_3V> c_path;
	NavInfo::ST_3V point;

	for(uint i = 0; i < req.vfConstraintPositionX.size(); i++)
	{
		point.x = req.vfConstraintPositionX[i];
		point.y = req.vfConstraintPositionY[i];
		c_path.push_back(point);
		ROS_INFO("\n%f\n%f", c_path[i].x, c_path[i].y);
	}
	nav_info.path_pos = c_path;
	nav_info.nav_state = NavInfo::NAV_LINE;
	nav_info.NavigationInit();
	image = image0.clone();
	DrawPath(image, nav_info.linecircle_path, Scalar(0, 255, 255));
	for(uint i = 0; i < req.vfPathPositionX.size(); i++)
	{
		point.x = req.vfPathPositionX[i];
		point.y = req.vfPathPositionY[i];
		path.push_back(point);
		ROS_INFO("\n%f\n%f", path[i].x, path[i].y);
	}
	nav_info.path_pos = path;
	nav_info.nav_state = NavInfo::NAV_LINE;
	nav_info.NavigationInit();

	DrawPath(image, nav_info.linecircle_path, Scalar(0, 255, 0));
	return true;
}

void OdomCallback(const geometry_msgs::Twist::ConstPtr& odom)
{
	nav_info.position.x = 1000*odom->linear.x;
	nav_info.position.y = 1000*odom->linear.y;
	nav_info.position.angle = odom->angular.z;;
	DrawPos(image, Point2i((int)(nav_info.position.x)/10, 448 - (int)(nav_info.position.y)/10), nav_info.position.angle / PI * 180.0, Scalar(0, 255, 255));
}


void TargetPosCallback(const geometry_msgs::Twist::ConstPtr& pos)
{
	nav_info.target.x = 1000*pos->linear.x;
	nav_info.target.y = 1000*pos->linear.y;
	nav_info.target.angle = pos->angular.z;
	nav_info.nav_state = NavInfo::NAV_PID;
}


void ObCallback(const geometry_msgs::Twist::ConstPtr& twist)
{
	nav_info.obstacle_fx = twist->linear.x * cosf(nav_info.position.angle) - twist->linear.y * sinf(nav_info.position.angle);
	nav_info.obstacle_fy = twist->linear.y * cosf(nav_info.position.angle) + twist->linear.x * sinf(nav_info.position.angle);
}

int main(int argc, char *argv[])
{
	
	ros::init(argc, argv, "nav_node");

	ros::NodeHandle n;
	image_transport::ImageTransport it(n);
  	image_transport::Publisher image_pub = it.advertise("camera/image", 1);

 	image0 = imread("../icra2020/src/icra_nav/map.png" , 1) ;//"/home/dengxin/icra2020/src/icra_nav/map.png"
	image = image0.clone();
	image_p = image.clone();
	sensor_msgs::ImagePtr image_msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();

	ros::Publisher cmd_pub = n.advertise<geometry_msgs::Twist>("cmd_vel", 1);
	ros::Publisher pathnum_pub = n.advertise<geometry_msgs::Twist>("path_number", 1);
	ros::ServiceServer server = n.advertiseService("path_srv", PathInit);
	ros::ServiceServer c_server = n.advertiseService("c_path_srv", CPathInit);
	ros::Subscriber odom_sub = n.subscribe("lidar_odom", 1, OdomCallback);
	ros::Subscriber targetpos_sub = n.subscribe("target_pos", 1, TargetPosCallback);
	ros::Subscriber ob_sub = n.subscribe("obf", 1, ObCallback);
	
	geometry_msgs::Twist velocity, path_number;

	nav_info.PIDInit();nav_info.target_angle = PI;
	nav_info_slave.PIDInit();
	ros::Rate loop_rate(100);
	while (ros::ok())
	{
		ros::spinOnce();//接收路径
		loop_rate.sleep();
		image_msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();
		image_pub.publish(image_msg);
	
		nav_info.RobotNavigation();
		velocity.linear.x = nav_info.vel.x/1000;
		velocity.linear.y = nav_info.vel.y/1000;
		velocity.angular.z = nav_info.vel.angle;
	
		cmd_pub.publish(velocity);
		if(nav_info.nav_state != NavInfo::NAV_OFF)
		{
			path_number.linear.x = nav_info.path_num;
			pathnum_pub.publish(path_number);
		}
	}

	return 0;
}


//可视化
void DrawPath(Mat& src, vector<NavInfo::ST_3V> linecircle_path, Scalar color)
{
	bool line_flag = 1;
	int h = 448;
	int r_index = -1; 
	for(uint i = 0; i < linecircle_path.size() - 1; i++)
	{
		if(line_flag)
		{
			int sx = (int)(linecircle_path[i].x / 10);
			int sy = h - (int)(linecircle_path[i].y / 10);
			int gx = (int)(linecircle_path[i + 1].x / 10);
			int gy = h - (int)(linecircle_path[i + 1].y / 10);
			line(src, Point(sx, sy), Point(gx, gy), color, 2);
		}
		else
		{
			r_index++;
			int sx = (int)(linecircle_path[i].x / 10);
			int sy = h - (int)(linecircle_path[i].y / 10);
			int cx = (int)(linecircle_path[i + 1].x / 10);
			int cy = h - (int)(linecircle_path[i + 1].y / 10);//圆心
			int gx = (int)(linecircle_path[i + 2].x / 10);
			int gy = h - (int)(linecircle_path[i + 2].y / 10);
			int r = (int)nav_info.r_list[r_index]/10;
			ROS_INFO("%d",r);
			double startangle, endangle, pi;
			pi = 3.1415926535;
			startangle = atan2(linecircle_path[i + 1].y - linecircle_path[i].y, linecircle_path[i].x - linecircle_path[i + 1].x);
			endangle = atan2(linecircle_path[i + 1].y - linecircle_path[i + 2].y, linecircle_path[i + 2].x - linecircle_path[i + 1].x);
			if(startangle - endangle > pi)
				endangle += pi * 2;
			else if(startangle - endangle < -pi)
				endangle -= pi * 2;
			ellipse(src, Point(cx, cy), Size(fabsf(r), fabsf(r)), 0, startangle/pi*180, endangle/pi*180, color, 2);
			i++;
		}
		line_flag = !line_flag;
	}
	//ellipse(image,Point(100, 100),Size(90, 60), 0, 0,360,Scalar(0, 255, 0));
}
void DrawPos(Mat& src, Point2i point, float angle, Scalar color)//可视化
{
	image = image_p.clone();
	circle(src, point, 4, Scalar(128, 128, 128), -1);
    RotatedRect rRect = RotatedRect(point, Size2f(60,45), -angle);
    Point2f vertices[4];
    rRect.points(vertices);
    for (int i = 0; i < 4; i++)
        line(src, vertices[i], vertices[(i+1)%4], color, 2);
}
