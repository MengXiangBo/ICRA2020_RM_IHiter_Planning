#ifndef _NAVIGATION_H
#define _NAVIGATION_H

#include <math.h>
#include <cstring>
#include <vector>
using namespace std;
class NavInfo
{
	using uint = unsigned int;
public:
	NavInfo():
		r(500.0),
		max_r(500),
		start_velocity(1000.0),
		end_velocity(0.0),
		max_velocity(2000.0),
		target_angle(0.0),
		path_num(0),
		pid_flag(0),
		obstacle_fx(0.0),
		obstacle_fy(0.0),
		path_pos({}),
		linecircle_path({}),
		nav_state(NAV_OFF)
	{}
	//常量定义
	const float PI = 3.14159265357;
	const float PI2 = 6.28318530714;
	const float D_TO_R = 0.174533125198;
	const float X_limit = 4000;// mm/s
	const float Y_limit = 4000;
	const float W_limit = 4*PI;// rad/s
	//PID结构体
	struct ST_PID
	{
		float P;
		float I;
		float D;
		float E;
		float preE;
		float prepreE;
		float ESum;
		float U;
		float Elimit;//偏差上限
		float Ulimit;//输出上限
		float Edead;//死区
		ST_PID()//初始化为0
		{
			memset(this, 0, sizeof(ST_PID));
			Elimit = 250;
			Edead = 0;
		}
	};
	//三维向量结构体
	struct ST_3V
	{
		float x;
		float y;
		float angle;
		ST_3V()
		{
			memset(this, 0, sizeof(ST_3V));
		}
	};
	//路径结构体
	struct Tpath
	{
		//长度
		float path_len;//路径长度
		float acc_len;//加速长度
		float accd_len;//减速长度
		//速度
		float max_v;//最大速度
		float start_v;//开始速度
		float end_v;//最终速度
		//加速度
		float acc;//加速度
		float accd;//减速度
		//前馈速度
		float ffacc;//前馈加速度
		float ffaccd;//前馈减速度
		Tpath()
		{
			memset(this, 0, sizeof(Tpath));
			acc = 3000;
			accd = 3000;
		}
	};
	//    当前位置，  开始位置， 目标位置， 目标速度， 当前速度，  P到T的向量， S到T的向量， S到C的向量， P到C的向量，  T到C的向量， 圆弧起点，      圆弧终点，    圆弧圆心
	ST_3V position, start,    target,  vel,      now_vel,  PT_line,   ST_line,   SC_circle,  PC_circle,  TC_circle,  circle_start, circle_end, circle_center;
	//    圆弧半径， 最大半径， 起始速度，        终止速度，      最大速度，     目标角度，      横向距离， 纵向距离， 导航角，     检测障碍物的横向偏移量， 检测障碍物的纵向偏移量
	float r,        max_r,   start_velocity, end_velocity, max_velocity, target_angle, x_len,   y_len,    nav_angle, obstacle_fx,         obstacle_fy;
	//    半径列表
	vector<float> r_list;
	//    半径索引
	int r_index;
	//    路径编号， PID标志
	uint path_num, pid_flag;//指示路径的位置
	//    角度跟随标志位---0表示不跟随，1表示跟随
	uint angle_flag = 1;
	//	  PID相关
	ST_PID PID_x, PID_y, PID_angle, PID_obx, PID_oby;
	//    路径结构体
	Tpath t_path;
	//            路径位置数组， 直线圆弧位置数组
	vector<ST_3V> path_pos,    linecircle_path;
	//    导航状态
	uint nav_state;
	enum
	{
		NAV_OFF = 0,//结束
		NAV_LINE,//直线
		NAV_CIRCLE,//圆弧
		NAV_PID,//PID
	};
	void SetPID(vector<float> pidvector, ST_PID& pid);//设置PID
	void PIDClear(ST_PID& pid);//清除PID
	vector<ST_3V> GetLineCircle(vector<ST_3V> path);//获取直线圆弧路径
	void NavigationInit();//导航初始化
	void PIDInit();//PID初始化
	void RobotNavigation();//导航总函数
	void PathInit();//路径初始化
	void NavLine();//直线导航
	void NavCircle();//圆弧导航
	void NavPID();//全PID运行
	void NavRotation();//旋转导航
	void TPathVel(float len);//T规划
	void CheckPath();//检查路径是否结束
	float ConvertAngle(float a);//角度转换
	float ClipFloat(float Value, float Min, float Max);//削波函数
	void PIDCalculate(NavInfo::ST_PID& pid);//计算PID
};




#endif // !_NAVIGATION_H
