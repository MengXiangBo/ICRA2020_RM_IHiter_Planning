#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "tf/transform_listener.h"
#include "icra_nav/start_end_srv.h"
#define TWO_ROBOTS 0
using namespace std;
/*
测试用
*/
int flag = 0;
float endx = 0;
float endy = 0;
void TransGoal(const geometry_msgs::Twist::ConstPtr& goalxy)
{
	endx = goalxy->linear.x;
	endy = goalxy->linear.y;
	flag = 1;
	
}


int main(int argc, char *argv[])
{
	ros::init(argc, argv, "trans_odom");
	ros::NodeHandle n;
	ros::Publisher pos_pub = n.advertise<geometry_msgs::Twist>("lidar_odom", 1);
	ros::Publisher pos_pub1 = n.advertise<geometry_msgs::Twist>("obstacle_position", 1);
	ros::ServiceClient client = n.serviceClient<icra_nav::start_end_srv>("start_end_srv");
	ros::Subscriber goal_sub = n.subscribe("goal", 1, TransGoal);//可视化鼠标点击的部分

	geometry_msgs::Twist twist;
	geometry_msgs::Twist twist1;
	tf::TransformListener listener;
	tf::TransformListener listener1;
	tf::StampedTransform transform;
	tf::StampedTransform transform1;

	double last_theta = 3.14159265357;
	double last_theta1 = 0;
	double PI = 3.14159265357;
	
	ros::Rate loop_rate(1000);
	while (ros::ok())
	{
		//
		if(flag)
		{
			icra_nav::start_end_srv goal;
			goal.request.flPathEndX = endx;
			goal.request.flPathEndY = endy;
			if (client.call(goal))
			{
				ROS_INFO("Successed");
			}
			else
			{
				ROS_ERROR("Failed");
			}
			
			flag = 0;
		}

		try//获取定位信息
		{
			listener.lookupTransform("odom", "base_footprint0", ros::Time(0), transform);
#if TWO_ROBOTS
			listener1.lookupTransform("odom", "base_footprint2", ros::Time(0), transform1);
#endif
		}
		catch (tf::TransformException &ex)
		{
			ROS_ERROR("%s", ex.what());
			continue;
		}

		twist.linear.x = transform.getOrigin().x();
		twist.linear.y = transform.getOrigin().y();
		twist.angular.z = tf::getYaw(transform.getRotation());
		if (last_theta - twist.angular.z > PI)
			twist.angular.z += PI*2;
		else if(last_theta - twist.angular.z < -PI)
			twist.angular.z -= PI*2;
		last_theta = twist.angular.z;
		//ROS_INFO("00");
		pos_pub.publish(twist);
#if TWO_ROBOTS
		twist1.linear.x = transform1.getOrigin().x();
		twist1.linear.y = transform1.getOrigin().y();
		twist1.angular.z = tf::getYaw(transform1.getRotation());
		if (last_theta1 - twist1.angular.z > PI)
			twist1.angular.z += PI*2;
		else if(last_theta1 - twist1.angular.z < -PI)
			twist1.angular.z -= PI*2;
		last_theta1 = twist1.angular.z;
		//ROS_INFO("01");
		pos_pub1.publish(twist1);
#endif
		ros::spinOnce();

		loop_rate.sleep();
	}

	return 0;
}