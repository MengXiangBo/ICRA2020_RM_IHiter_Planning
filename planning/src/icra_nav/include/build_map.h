#ifndef BUILD_MAP_H_
#define BUILD_MAP_H_

#include "find_path.h"
#include "fsa.h"
#include "Map.h"
#include "dstarlite.h"

using namespace std;
namespace hitcrt
{
	vector<MapSearchNode> AddNodeInMap(DStarliteSearch<MapSearchNode>* DStar);//将节点加入地图
	void AddStartAndEnd(DStarliteSearch<MapSearchNode>* DStar, vector<MapSearchNode>& Nodes);//将起始点和终止点加入地图
	vector<uint> FindNeighbor(MapSearchNode& Node, vector<MapSearchNode>& Nodes, vector<vector<MapSearchNode>>& Obstacles);//寻找起始点和终止点的邻接节点
	bool Compare(const vector<float>& a, const vector<float>& b);//排序比较函数
	bool IsBlocked(MapSearchNode& NodeA, MapSearchNode& NodeB, vector<vector<MapSearchNode>>& Obstacles);//判断两节点是否被阻挡
	vector<vector<MapSearchNode>> GetObstacle(vector<MapSearchNode>& Nodes, float Offset);//获取地图中的障碍物
	void GetSimplePath(vector<uint>& Path, vector<MapSearchNode>& Nodes, vector<vector<MapSearchNode>>& Obstacles);//简化最终路径
}

#endif // !BUILD_MAP_H_

