#include "ros/ros.h"
#include "icra_nav/start_end_srv.h"
#include "icra_nav/c_start_end_srv.h"
#include "icra_nav/path_srv.h"
#include "icra_nav/c_path_srv.h"
#include "icra_nav/punish.h"
#include "icra_nav/add_ob_srv.h"
#include "global_planning.h"
#include "geometry_msgs/Twist.h"
using namespace hitcrt;
GlobalPlanner g_planner;
vector<vector<float>> path_position;
vector<vector<float>> c_path_position;
vector<int> viPunishAreas;// = {9, 18};
float now_x = 0;
float now_y = 0;

bool flag = 1;
bool c_flag = 1;
bool u_flag = 1;

void OdomCallback(const geometry_msgs::Twist::ConstPtr& odom)
{
	now_x = odom->linear.x;
	now_y = odom->linear.y;
}

void punishCallback(const icra_nav::punish::ConstPtr& PunishAreas)
{
	viPunishAreas = PunishAreas->viPunishAreas;
}

bool Planning(icra_nav::start_end_srv::Request  &req, icra_nav::start_end_srv::Response &res)
{
	flag = 0;
    res.boSuccess = true;
	g_planner.PlannerDelete();
	for(uint i = 0; i < viPunishAreas.size(); i++)
	{
		g_planner.PlannerAddPunish(viPunishAreas[i]);
	}
	vector<float> StartPos = {now_x, now_y};
	vector<float> EndPos = {req.flPathEndX, req.flPathEndY};
	path_position = g_planner.PlannerStart(StartPos, EndPos);

    return true;
}

bool C_Planning(icra_nav::c_start_end_srv::Request  &req, icra_nav::c_start_end_srv::Response &res)//带约束的规划（从机器人）
{
	c_flag = 0;
    res.boSuccess = true;
	g_planner.PlannerDelete();
	for(uint i = 0; i < viPunishAreas.size(); i++)
	{
		g_planner.PlannerAddPunish(viPunishAreas[i]);
	}
	vector<float> StartPos = {req.flPathStartX, req.flPathStartY};
	vector<float> EndPos = {req.flPathEndX, req.flPathEndY};

	c_path_position = {req.vfConstraintPositionX, req.vfConstraintPositionY};
	path_position = g_planner.CPlannerStart(StartPos, EndPos, c_path_position, req.flConstraintVelocity);
    return true;
}

bool ChangePath(icra_nav::add_ob_srv::Request  &req, icra_nav::add_ob_srv::Response &res)
{
	flag = 0;
    res.boSuccess = true;
	g_planner.PlannerDelete();
	for(uint i = 0; i < viPunishAreas.size(); i++)
	{
		g_planner.PlannerAddPunish(viPunishAreas[i]);
	}
	vector<float> StartPos = {now_x, now_y};
	vector<float> EndPos = g_planner.last_endposition;
	if(g_planner.obstacles.size()==9)
	{
		vector<MapSearchNode> obstacle = {
			MapSearchNode(req.flObstacleX-0.3, req.flObstacleX-0.3, -4),
			MapSearchNode(req.flObstacleX-0.3, req.flObstacleX+0.3, -5),
			MapSearchNode(req.flObstacleX+0.3, req.flObstacleX-0.3, -6),
			MapSearchNode(req.flObstacleX+0.3, req.flObstacleX+0.3, -7),
		};
		g_planner.obstacles.push_back(obstacle);
	}
	else
	{
		g_planner.obstacles[9][0] = MapSearchNode(req.flObstacleX-0.3, req.flObstacleX-0.3, -4);
		g_planner.obstacles[9][1] = MapSearchNode(req.flObstacleX-0.3, req.flObstacleX+0.3, -5);
		g_planner.obstacles[9][2] = MapSearchNode(req.flObstacleX+0.3, req.flObstacleX-0.3, -6);
		g_planner.obstacles[9][3] = MapSearchNode(req.flObstacleX+0.3, req.flObstacleX+0.3, -7);
	}
	if(req.inFrom < 14)
	{
		for(int i=0;i<g_planner.nodes[req.inFrom].neighbors.size();i++)
		{
			//ROS_INFO("%d", g_planner.nodes[req.inFrom].neighbors[i]->id);
			if(IsBlocked(g_planner.nodes[req.inFrom], *(g_planner.nodes[req.inFrom].neighbors[i]), g_planner.obstacles))
			{
				g_planner.PlannerAddObstacle(g_planner.nodes[req.inFrom].id, g_planner.nodes[req.inFrom].neighbors[i]->id);
				//ROS_INFO("%d", g_planner.nodes[req.inFrom].neighbors[i]->id);
			}
		}
	}
	if(req.inTo < 14)
	{
		for(int i=0;i<g_planner.nodes[req.inTo].neighbors.size();i++)
		{
			//ROS_INFO("%d", g_planner.nodes[req.inTo].neighbors[i]->id);
			if(IsBlocked(g_planner.nodes[req.inTo], *(g_planner.nodes[req.inTo].neighbors[i]), g_planner.obstacles))
			{
				g_planner.PlannerAddObstacle(g_planner.nodes[req.inTo].id, g_planner.nodes[req.inTo].neighbors[i]->id);
				//ROS_INFO("%d", g_planner.nodes[req.inTo].neighbors[i]->id);
			}
		}
	}
	
	path_position = g_planner.PlannerStart(StartPos, EndPos);
	//for(int i=0;i<g_planner.path_index.size();i++)
	//	ROS_INFO("    %d", g_planner.path_index[i]);
    return true;
}

int main(int argc, char *argv[])
{
	ros::init(argc, argv, "path_planning");
	ros::NodeHandle n;
	ros::Subscriber punish_sub = n.subscribe("punish_num", 1, punishCallback);
	ros::ServiceServer service = n.advertiseService("start_end_srv", Planning);
	ros::ServiceServer c_service = n.advertiseService("c_start_end_srv", C_Planning);
	ros::ServiceServer ob_service = n.advertiseService("add_obstacle", ChangePath);
	ros::ServiceClient client = n.serviceClient<icra_nav::path_srv>("path_srv");
	ros::ServiceClient obstacle_client = n.serviceClient<icra_nav::path_srv>("path_srv_obstacle");
	ros::ServiceClient c_client = n.serviceClient<icra_nav::c_path_srv>("c_path_srv");
	ros::Subscriber new_odom_sub = n.subscribe("lidar_odom", 1, OdomCallback);

	ros::Rate loop_rate(1000);
	g_planner.PlannerInit();
	ros::Duration(0.5).sleep();//延时，等另一边初始化
	while (ros::ok())
	{
		loop_rate.sleep();
		ros::spinOnce();
		if(!flag)
		{
			icra_nav::path_srv path;
			for(uint i = 0; i < path_position[0].size(); i++)
			{
				path.request.vfPathPositionX.push_back(path_position[0][i]*1000);
				path.request.vfPathPositionY.push_back(path_position[1][i]*1000);
				
			}
			path.request.viPathIndex = g_planner.path_index;
			//ROS_INFO("L = %d\n", (int)path_position[0].size());
			//pos_pub.publish(path);
			if (path_position[0].size() > 1)
			{
				if (client.call(path))
				{
					ROS_INFO("Successed");
				}
				else
				{
					ROS_ERROR("Failed");
				}
				if (obstacle_client.call(path))
				{
					ROS_INFO("Successed");
				}
				else
				{
					ROS_ERROR("Failed");
				}
			}
			flag = 1;
		}
	}

	return 0;
}