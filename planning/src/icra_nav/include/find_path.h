#ifndef ICRA_FIND_PATH_H
#define ICRA_FIND_PATH_H

#include <iostream>
#include <stdio.h>
#include <math.h>
#include <vector>

namespace hitcrt {
using namespace std;
using uint = unsigned int;
//自定义节点类
class MapSearchNode
{
public:
	int id;//节点ID
    float x;//节点x
    float y;//节点y
	vector<MapSearchNode*> neighbors;//节点邻接节点
	vector<MapSearchNode*> obstacles;//节点阻挡节点

	MapSearchNode() { x = y = 0; id = 0; }
	MapSearchNode(float px, float py, int pid) { x = px; y = py; id = pid; }//节点初始化
	void AddNeighbor(MapSearchNode* NewNeighbor);//添加邻接节点
	void SetNeighbors(vector<MapSearchNode*> NewNeighbors);//设置邻接节点
    float GoalDistanceEstimate( MapSearchNode &NodeGoal );//当前位置到目标位置的估计代价
    bool IsGoal( MapSearchNode &NodeGoal );//判断是否为目标位置
    float GetCost( MapSearchNode &Successor );//获得移动代价（以距离为目标）
	float GetCost(MapSearchNode& LastNode, MapSearchNode& NextNode);//获得移动代价（多目标：距离，转角）
    bool IsSameState( MapSearchNode &Node );//判断是否为同一节点
    void PrintNodeInfo();//打印节点信息
};


}
#endif
