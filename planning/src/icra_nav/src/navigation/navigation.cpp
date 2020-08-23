#include "navigation.h"

void NavInfo::RobotNavigation()
{
	if (nav_state == NAV_OFF)
	{
		PIDClear(PID_x);
		PIDClear(PID_y);
		PIDClear(PID_obx);
		PIDClear(PID_oby);

		vel.x = 0;
		vel.y = 0;
		vel.angle = 0;
	}
	else 
	{
		if (nav_state == NAV_LINE)
			NavLine();
		else if (nav_state == NAV_CIRCLE)
			NavCircle();
		else
			NavPID();
		NavRotation();
		CheckPath();
	}
}

void NavInfo::SetPID(vector<float> pidvector, ST_PID& pid)
{
	if (pidvector.size() != 3)
	{
		return;
	}
	pid.P = pidvector[0];
	pid.I = pidvector[1];
	pid.D = pidvector[2];
}

void NavInfo::PIDClear(ST_PID& pid)
{
	pid.E = 0; 
	pid.ESum = 0; 
	pid.preE = 0; 
	pid.prepreE = 0;
}

vector<NavInfo::ST_3V> NavInfo::GetLineCircle(vector<NavInfo::ST_3V> path)
{
	vector<NavInfo::ST_3V> new_path = {};
	path_num = 0;
	new_path.push_back(path[0]);
	vector<float> temp_r;
	for (uint i = 1; i < path.size() - 1; i++)
	{
		float n1, h1, n2, h2, t1, t2, x1, x2, y1, y2, xc, yc, k1, k2, a, b, c, q;
		ST_3V p1 = path[i - 1];
		ST_3V p2 = path[i];
		ST_3V p3 = path[i + 1];
		ST_3V new_p1, new_p2, new_p3;
		float f = 1.5;
		a = sqrtf(pow(p1.x - p2.x,2) + pow(p1.y - p2.y,2));
		b = sqrtf(pow(p3.x - p2.x,2) + pow(p3.y - p2.y,2));
		c = sqrtf(pow(p1.x - p3.x,2) + pow(p1.y - p3.y,2));
		q = acosf((a*a + b*b - c*c)/(2*a*b))/2;
		if (a < b)
		{
			if (a*tanf(q)/f < max_r)
				r = a*tanf(q)/f;
			else
				r = max_r;
		}
		else
		{
			if (b*tanf(q)/f < max_r)
				r = b*tanf(q)/f;
			else
				r = max_r;
		}
		temp_r.push_back(r);
		if (p2.x == p1.x)
		{
			n1 = p3.x - p2.x;
			n1 = n1 / fabsf(n1);
			h1 = fabsf(r);
			k2 = (p3.y - p2.y) / (p3.x - p2.x);
			n2 = p1.y - k2 * (p1.x - p2.x) - p2.y;
			n2 = n2 / fabsf(n2);
			h2 = fabsf(r) * sqrtf(k2 * k2 + 1);
			xc = p2.x + n1 * h1;
			yc = k2 * (xc - p2.x) + p2.y + n2 * h2;
			x1 = p2.x;
			y1 = yc;
			t2 = (k2 * yc + xc - k2 * p2.y - p2.x) / (k2 * k2 + 1);
			x2 = p2.x + t2;
			y2 = p2.y + k2 * t2;
		}
		else if (p2.x == p3.x)
		{
			k1 = (p2.y - p1.y) / (p2.x - p1.x);
			n1 = p3.y - k1 * (p3.x - p2.x) - p2.y;
			n1 = n1 / fabsf(n1);
			h1 = fabsf(r) * sqrtf(k1 * k1 + 1);
			n2 = p1.x - p2.x;
			n2 = n2 / fabsf(n2);
			h2 = fabsf(r);
			xc = p2.x + n2 * h2;
			yc = k1 * (xc - p2.x) + p2.y + n1 * h1;
			t1 = (k1 * yc + xc - k1 * p2.y - p2.x) / (k1 * k1 + 1);
			x1 = p2.x + t1;
			y1 = p2.y + k1 * t1;
			x2 = p2.x;
			y2 = yc;
		}
		else
		{
			k1 = (p2.y - p1.y) / (p2.x - p1.x);
			n1 = p3.y - k1 * (p3.x - p2.x) - p2.y;
			n1 = n1 / fabsf(n1);
			h1 = fabsf(r) * sqrtf(k1 * k1 + 1);
			k2 = (p3.y - p2.y) / (p3.x - p2.x);
			n2 = p1.y - k2 * (p1.x - p2.x) - p2.y;
			n2 = n2 / fabsf(n2);
			h2 = fabsf(r) * sqrtf(k2 * k2 + 1);
			xc = (n2 * h2 - n1 * h1) / (k1 - k2) + p2.x;
			yc = k1 * (xc - p2.x) + p2.y + n1 * h1;
			t1 = (k1 * yc + xc - k1 * p2.y - p2.x) / (k1 * k1 + 1);
			x1 = p2.x + t1;
			y1 = p2.y + k1 * t1;
			t2 = (k2 * yc + xc - k2 * p2.y - p2.x) / (k2 * k2 + 1);
			x2 = p2.x + t2;
			y2 = p2.y + k2 * t2;
		}
		new_p1.x = x1; new_p1.y = y1;
		new_path.push_back(new_p1);
		new_p2.x = xc; new_p2.y = yc;
		new_path.push_back(new_p2);
		new_p3.x = x2; new_p3.y = y2;
		new_path.push_back(new_p3);
	}
	r_list = temp_r;
	r_index = -1;
	new_path.push_back(path[path.size() - 1]);
	return new_path;
}

void NavInfo::NavigationInit()
{
	linecircle_path = GetLineCircle(path_pos);//
	path_num = 0;
	nav_state = NAV_LINE;

	PIDInit();
	PathInit();
}
void NavInfo::PIDInit()
{
	SetPID({ 40,0.01,0 }, PID_x); PIDClear(PID_x);
	SetPID({ 40,0.01,0 }, PID_y); PIDClear(PID_y);
	SetPID({ 6,0.0,0 }, PID_angle); PIDClear(PID_angle);
	SetPID({ 1,0.1,0 }, PID_obx); PIDClear(PID_obx);
	SetPID({ 1,0.1,0 }, PID_oby); PIDClear(PID_oby);
}

void NavInfo::PathInit()
{
	pid_flag = 0;
	if (nav_state == NAV_LINE)
	{
		start = linecircle_path[path_num];
		target = linecircle_path[path_num + 1];

		ST_line.x = target.x - start.x;
		ST_line.y = target.y - start.y;
		ST_line.angle = atan2(ST_line.y, ST_line.x);
		t_path.path_len = sqrtf(ST_line.x * ST_line.x + ST_line.y * ST_line.y);
		if (angle_flag)
		{
			target_angle = ST_line.angle;
		}
			
	}
	else if (nav_state == NAV_CIRCLE)
	{
		r_index++;
		r = r_list[r_index];
		start = linecircle_path[path_num];
		circle_center = linecircle_path[path_num + 1];
		target = linecircle_path[path_num + 2];

		SC_circle.x = start.x - circle_center.x;
		SC_circle.y = start.y - circle_center.y;
		SC_circle.angle = atan2(SC_circle.y, SC_circle.x);

		TC_circle.x = target.x - circle_center.x;
		TC_circle.y = target.y - circle_center.y;
		TC_circle.angle = atan2(TC_circle.y, TC_circle.x);
		float ST_angle = TC_circle.angle - SC_circle.angle;
		if ((ST_angle > 0 && ST_angle < PI) || ST_angle < -PI)
		{
			r = fabs(r);
			if (ST_angle < -PI)
				ST_angle += PI2;
		}
		else
		{
			r = -fabs(r);
			if (ST_angle > PI)
				ST_angle -= PI2;
		}
		t_path.path_len = ST_angle * r;
	}

	if (path_num == 0)
	{
		float v_now = now_vel.x*cosf(ST_line.angle) + now_vel.y*sinf(ST_line.angle);
		if (v_now > start_velocity)
			t_path.start_v = v_now;
		else
			t_path.start_v = start_velocity;
		t_path.end_v = max_velocity;
	}
	else if (path_num == linecircle_path.size() - 2)
	{
		t_path.start_v = t_path.end_v;
		t_path.end_v = end_velocity;
	}
	else
	{
		t_path.start_v = t_path.end_v;
		t_path.end_v = max_velocity;
	}
	t_path.max_v = max_velocity;

	if (t_path.start_v < t_path.max_v)
	{
		t_path.acc_len = ((t_path.max_v * t_path.max_v) - (t_path.start_v * t_path.start_v)) / t_path.acc / 2.0f;
	}
	else
	{
		t_path.acc_len = 0;
	}
	if (t_path.end_v < t_path.max_v)
	{
		t_path.accd_len = ((t_path.max_v * t_path.max_v) - (t_path.end_v * t_path.end_v)) / t_path.accd / 2.0f;
	}
	else
	{
		t_path.accd_len = 0;
	}
	if ((t_path.acc_len + t_path.accd_len) > t_path.path_len)
	{
		t_path.max_v = sqrtf((2 * t_path.acc * t_path.accd * t_path.path_len
			+ (t_path.start_v * t_path.start_v) * t_path.accd
			+ (t_path.end_v * t_path.end_v) * t_path.acc)
			/ (t_path.acc + t_path.accd));

		t_path.acc_len = ((t_path.max_v * t_path.max_v) - (t_path.start_v * t_path.start_v)) / t_path.acc / 2.0f;
		t_path.accd_len = t_path.path_len - t_path.acc_len;
	}
}

void NavInfo::CheckPath()
{
	//if (fabsf(position.x - target.x) < 50 && fabsf(position.y - target.y) < 50)
	if(y_len <= 50)
	{
		if (path_num < linecircle_path.size() - 2)
		{
			if (nav_state == NAV_LINE)
			{
				path_num++;
				nav_state = NAV_CIRCLE;
			}
			else if (nav_state == NAV_CIRCLE)
			{
				path_num += 2;
				nav_state = NAV_LINE;
			}
			PathInit();
		}
		else
		{
			pid_flag = 1;
			if (fabsf(position.x - target.x) < 20 && fabsf(position.y - target.y) < 20)// && fabsf(target_angle - position.angle) < 1 * PI / 180)
			{
				nav_state = NAV_OFF;
			}
		}
	}
}

void NavInfo::NavLine()
{
	//float nav_angle, x_len, y_len;
	PT_line.x = target.x - position.x;
	PT_line.y = target.y - position.y;
	y_len = (PT_line.x * ST_line.x + PT_line.y * ST_line.y) / sqrtf(ST_line.x * ST_line.x + ST_line.y * ST_line.y);//ͶӰ
	x_len = (ST_line.y * PT_line.x - ST_line.x * PT_line.y) / sqrtf(ST_line.x * ST_line.x + ST_line.y * ST_line.y);
	nav_angle = ConvertAngle(PI/2 + position.angle - ST_line.angle);
	
	//Y
	float vx,vy;
	if (pid_flag)
	{
		//PID
		PID_y.E = y_len;
		PIDCalculate(PID_y);
		vy = PID_y.U;
	}
	else
	{

		TPathVel(y_len);
		vy = vel.y;
	}
	//X
	PID_x.E = x_len;
	PIDCalculate(PID_x);
	vx = PID_x.U;

	PID_obx.E = obstacle_fx * sinf(ST_line.angle) - obstacle_fy * cosf(ST_line.angle);
	if (fabsf(PID_obx.E) < 0.0001)
		PIDClear(PID_obx);
	PIDCalculate(PID_obx);
	PID_oby.E = obstacle_fx * cosf(ST_line.angle) + obstacle_fy * sinf(ST_line.angle);
	if (fabsf(PID_oby.E) < 0.0001)
		PIDClear(PID_oby);
	PIDCalculate(PID_oby);
	vx += PID_obx.U;
	vy += PID_oby.U;

	vel.x = vy * sinf(nav_angle) + vx * cosf(nav_angle);
	vel.y = vy * cosf(nav_angle) - vx * sinf(nav_angle);

	vel.y = ClipFloat(vel.y, -Y_limit, Y_limit);
	vel.x = ClipFloat(vel.x, -X_limit, X_limit);
}

void NavInfo::NavCircle()
{
	//float nav_angle, angle, x_len, y_len;
	float angle;

	PC_circle.x = position.x - circle_center.x;
	PC_circle.y = position.y - circle_center.y;
	PC_circle.angle = atan2(PC_circle.y, PC_circle.x);

	if (r < 0)
	{
		if (PC_circle.angle < TC_circle.angle - PI / 2)
		{
			PC_circle.angle += PI2;
		}
		angle = PC_circle.angle - PI / 2;
		x_len = sqrtf(PC_circle.x * PC_circle.x + PC_circle.y * PC_circle.y) - fabsf(r);
	}
	else
	{
		if (PC_circle.angle > TC_circle.angle  + PI / 2)
		{
			PC_circle.angle -= PI2;
		}
		angle = PC_circle.angle + PI / 2;
		x_len = fabsf(r) - sqrtf(PC_circle.x * PC_circle.x + PC_circle.y * PC_circle.y);
	}
	y_len = (TC_circle.angle - PC_circle.angle) * r;
	nav_angle = ConvertAngle(PI/2 + position.angle - angle);
	if (angle_flag)
	{
		target_angle = angle;
	}
		
	//Y
	float vx,vy;
	if (pid_flag)
	{
		//PID
		PID_y.E = y_len;
		PIDCalculate(PID_y);
		vy = PID_y.U;
	}
	else
	{

		TPathVel(y_len);
		vy = vel.y;
	}

	PID_x.E = x_len;
	PIDCalculate(PID_x);
	vx = PID_x.U;

	PID_obx.E = obstacle_fx * sinf(angle) - obstacle_fy * cosf(angle);
	if (fabsf(PID_obx.E) < 0.0001-5)
		PIDClear(PID_obx);
	PIDCalculate(PID_obx);
	PID_oby.E = obstacle_fx * cosf(angle) + obstacle_fy * sinf(angle);
	if (fabsf(PID_oby.E) < 0.0001-5)
		PIDClear(PID_oby);
	PIDCalculate(PID_oby);
	vx += PID_obx.U;
	vy += PID_oby.U;

	vel.x = vy * sinf(nav_angle) + vx * cosf(nav_angle);
	vel.y = vy * cosf(nav_angle) - vx * sinf(nav_angle);

	vel.y = ClipFloat(vel.y, -Y_limit, Y_limit);
	vel.x = ClipFloat(vel.x, -X_limit, X_limit);
}

void NavInfo::NavPID()
{
	nav_angle = ConvertAngle(position.angle);

	PID_y.E = target.y - position.y;
	PIDCalculate(PID_y);
	float vy = PID_y.U;

	PID_x.E = target.x - position.x;
	PIDCalculate(PID_x);
	float vx = PID_x.U;

	vel.x = vy * sinf(nav_angle) + vx * cosf(nav_angle);
	vel.y = vy * cosf(nav_angle) - vx * sinf(nav_angle);

	vel.y = ClipFloat(vel.y, -Y_limit, Y_limit);
	vel.x = ClipFloat(vel.x, -X_limit, X_limit);
}

void NavInfo::NavRotation()
{
	PID_angle.E = target_angle - position.angle;
	while(PID_angle.E > PI)
		PID_angle.E -= PI2;
	while(PID_angle.E < -PI)
		PID_angle.E += PI2;
	PIDCalculate(PID_angle);
	vel.angle = ClipFloat(PID_angle.U, -W_limit, W_limit);
}

void NavInfo::TPathVel(float len)
{
	if (len > t_path.path_len - t_path.acc_len)
	{
		if (len > t_path.path_len)
		{
			vel.y = t_path.start_v;
		}
		else
		{
			vel.y = sqrtf(2.0f * t_path.acc * (t_path.path_len - len) + (t_path.start_v * t_path.start_v));
			vel.y += t_path.ffacc;
		}
	}
	else if ((len <= t_path.path_len - t_path.acc_len) && (len >= t_path.accd_len))
	{
		vel.y = t_path.max_v;
	}
	else if (len < t_path.accd_len)
	{
		if (len < 0)
		{
			vel.y = -t_path.end_v;
		}
		else
		{
			vel.y = sqrtf(2.0f * t_path.accd * len + (t_path.end_v * t_path.end_v));
			vel.y -= t_path.ffaccd;
		}
	}
}

float NavInfo::ConvertAngle(float a)
{
	do
	{
		if (a >= PI)
		{
			a -= PI2;
		}
		else if (a < -PI)
		{
			a += PI2;
		}
	} while (a >= PI || a < -PI);
	return a;
}

float NavInfo::ClipFloat(float Value, float Min, float Max)
{
	if (Value < Min)
	{
		return Min;
	}
	else if (Value > Max)
	{
		return Max;
	}
	else
	{
		return Value;
	}
}

void NavInfo::PIDCalculate(NavInfo::ST_PID &pid)
{
	uint uck = 0;

	if (fabsf(pid.E) < pid.Edead)
	{
		pid.E = 0;
		pid.preE = 0;
		pid.ESum = 0;
	}

	pid.ESum += pid.E;
	if (fabsf(pid.E) > pid.Elimit)
	{
		uck = 0;
		pid.ESum -= pid.E;
	}
	else
	{
		uck = 1;
	}

	pid.U = pid.P * pid.E + pid.I * pid.ESum * uck + pid.D * (pid.E - pid.E);
	pid.preE = pid.E;

}
