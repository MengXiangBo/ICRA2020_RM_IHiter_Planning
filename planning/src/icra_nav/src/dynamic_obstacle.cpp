#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "icra_nav/path_srv.h"
#include "icra_nav/add_ob_srv.h"
#include "navigation.h"
/*
发布动态障碍物的信息，例如阻挡某条路径
*/
vector<NavInfo::ST_3V> path, last_path;
vector<uint> path_index_list;
int path_number = -1;
float obstacle_x = 10000, obstacle_y = 10000;
bool PathInit(icra_nav::path_srv::Request  &req, icra_nav::path_srv::Response &res)
{
    uint num = req.vfPathPositionX.size();
	
	NavInfo::ST_3V point;
	path = {};
	for(uint i = 0; i < num; i++)
	{
		point.x = req.vfPathPositionX[i];
		point.y = req.vfPathPositionY[i];
		path.push_back(point);
	}
	path_index_list = req.viPathIndex;
	return true;
}
void GetPosition(const geometry_msgs::Twist::ConstPtr& odom)
{
	obstacle_x = 1000*odom->linear.x;
	obstacle_y = 1000*odom->linear.y;
}

void GetPathNumber(const geometry_msgs::Twist::ConstPtr& twist)
{
	path_number = (int)(twist->linear.x);
	//ROS_INFO("%d",path_number);
}

int main(int argc, char *argv[])
{

	ros::init(argc, argv, "dynamic_obstacle");

	ros::NodeHandle n;

	ros::ServiceServer path_server = n.advertiseService("path_srv_obstacle", PathInit);

	ros::Subscriber obposition_sub = n.subscribe("obstacle_position", 1, GetPosition);
	ros::Subscriber pathnum_sub = n.subscribe("path_number", 1, GetPathNumber);

	
	ros::Publisher obf_pub = n.advertise<geometry_msgs::Twist>("obf", 1);
	ros::ServiceClient addobstacle_client = n.serviceClient<icra_nav::add_ob_srv>("add_obstacle");

	ros::Rate loop_rate(100);
	geometry_msgs::Twist msg;
	icra_nav::add_ob_srv obstacle_msg;
	while (ros::ok())
	{
		
		ros::spinOnce();
		loop_rate.sleep();

		//判断是否阻挡
		if(path_number != -1 && path_number <= 3*path.size()-6 && path.size() != 0)
		{
			if(last_path.size() != 0)
			{
				if(last_path[0].y == path[0].y && last_path[1].y == path[1].y)
				{
					continue;
				}
			}
			int path_index = (int)((path_number+2)/3);
			float x1,x2,y1,y2;
			int i=0;
			do{
				x1 = path[path_index].x;
				x2 = path[path_index+1].x;
				y1 = path[path_index].y;
				y2 = path[path_index+1].y;
				float w = ((obstacle_x-x1)*(x2-x1)+(obstacle_y-y1)*(y2-y1))/((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
				float d = fabsf((obstacle_x-x1)*(y2-y1)-(x2-x1)*(obstacle_y-y1))/sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
				//ROS_INFO("x1=%f, y1=%f",x1,y1);
				//ROS_INFO("x2=%f, y2=%f",x2,y2);
				//ROS_INFO("x0=%f, y0=%f",obstacle_x,obstacle_y);
				//ROS_INFO("w=%f, d=%f, path_index=%d, path_number=%d",w,d,path_index,path_number);
				if(w>=-0.00 && w<=1.00 && d<=400)
				{
					//ROS_INFO("w=%f, d=%f, path_index=%d, path_number=%d",w,d,path_index,path_number);
					obstacle_msg.request.inFrom = path_index_list[path_index];
					obstacle_msg.request.inTo = path_index_list[path_index+1];
					//ROS_INFO("From=%d, To=%d",path_index_list[path_index],path_index_list[path_index+1]);
					obstacle_msg.request.flObstacleX = obstacle_x/1000;
					obstacle_msg.request.flObstacleY = obstacle_y/1000;
					if (addobstacle_client.call(obstacle_msg))
					{
						ROS_INFO("Successed");
					}
					else
					{
						ROS_ERROR("Failed");
					}
					last_path = path;
					break;
				}
				path_index++;
				i++;
				//ROS_INFO("i=%d",i);
			}while(path_index<path.size()-1 && i<1);
			
		}
		//obf_pub.publish(msg);
	}

	return 0;
}