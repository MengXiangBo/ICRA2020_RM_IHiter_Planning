#pragma once
#ifndef ICRA_MAP_H
#define ICRA_MAP_H

#include <iostream>
#include <stdio.h>
#include <math.h>
#include <vector>
using std::vector;
namespace hitcrt{
	using uint = unsigned int;
	//自定义地图类
	class Map
	{
	public:
		//            导航节点的x，           导航节点的y
		vector<float> navigation_positionx, navigation_positiony;
		//            加成、惩罚区域x，  加成、惩罚区域y
        vector<float> area_positionx, area_positiony;
		//                    静态障碍物的中心
		vector<vector<float>> obstacles_center;
		//            静态障碍物的x偏移量， 静态障碍物的y偏移量
		vector<float> obstacles_offsetx, obstacles_offsety;
		Map()
		{
			navigation_positionx = {1.25, 2.92, 5.16, 6.83, 1.25f-0.25, 1.25f+0.3, 6.83f-0.3, 6.83f+0.25};
			navigation_positiony = {0.4675, 1.6375, 2.8425, 4.0125};
            area_positionx = {0.5, 1.9, 4.04, 4.04, 6.18, 7.58};
            area_positiony = {2.79, 1.65, 0.445, 4.035, 2.83, 1.69};
            obstacles_center = {
            {0.5, 3.38}, {1.9, 2.24}, {1.6, 0.5}, {4.04, 3.445},
            {4.04, 2.24},
            {4.04, 1.035}, {6.48, 3.98}, {6.18, 2.24}, {7.58, 1.1}};
            obstacles_offsetx = {0.5, 0.4, 0.1, 0.5, 0.177, 0.5, 0.1, 0.4, 0.5};
            obstacles_offsety = {0.1, 0.1, 0.5, 0.1, 0.177, 0.1, 0.5, 0.1, 0.1};
		}
	};

}
#endif