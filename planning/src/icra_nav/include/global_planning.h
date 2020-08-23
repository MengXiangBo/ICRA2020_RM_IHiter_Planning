#include "build_map.h"
namespace hitcrt
{
	//自定义规划类
	class GlobalPlanner
	{
	public:
		DStarliteSearch<MapSearchNode> dstar;//多目标 D*Lite 搜索类
		vector<MapSearchNode> nodes;//节点列表
		vector<vector<MapSearchNode>> obstacles;//障碍物列表
		vector<vector<float>> c_path;//约束路径
		vector<float> last_endposition;//上次规划的目标位置
		uint last_endpoint;//上次规划的目标点
		vector<uint> path_index;//路径的节点索引列表
		vector<vector<float>> last_path;//上次规划的路径

		void PlannerInit();//规划器初始化
		void PlannerDelete();//删除节点信息
		vector<vector<float>> PlannerStart(vector<float> StartPos, vector<float> EndPos);//开始规划，起始位置到目标位置
        vector<vector<float>> PlannerStart(vector<float> StartPos, uint EndPoint);//开始规划，起始位置到目标区域
		void PlannerAddObstacle(uint NumberA, uint NumberB);//规划器添加被阻挡的节点对
		void PlannerAddPunish(uint Area);//规划器添加惩罚区域（不可通过）
		vector<vector<float>> CPlannerStart(vector<float> StartPos, vector<float> EndPos, vector<vector<float>> ConstraintPath, float Velocity);//开始规划（约束路径）
		int PathBlocked(vector<vector<float>> Path, vector<vector<float>> ConstraintPath);//有约束路径时，预测在哪一段路径会碰撞
	};
}


