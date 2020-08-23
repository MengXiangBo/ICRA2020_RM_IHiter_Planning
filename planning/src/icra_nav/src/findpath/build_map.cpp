#include "build_map.h"

namespace hitcrt
{
	//初始化各个节点
	vector<MapSearchNode> AddNodeInMap(DStarliteSearch<MapSearchNode>* DStar)
	{
		Map IcraMap;
		vector<uint> IndexX =
				{
						1, 2, 6,
						4, 1, 2, 3,
						0, 1, 2, 7,
						5, 1, 2
				};
		vector<uint> IndexY =
				{
						0, 0, 0,
						1, 1, 1, 1,
						2, 2, 2, 2,
						3, 3, 3
				};
		vector<vector<uint>> NeighborIndex =
				{
						{1,4},			//0
						{0,2,5,6},		//1
						{1,5,6},		//2
						{4,7},			//3
						{0,3,5,8},		//4
						{1,2,4,6,9},	//5
						{1,2,5,10},		//6
						{3,8,11,12},	//7
						{4,7,9,11,12},	//8
						{5,8,10,13},	//9
						{6,9},			//10
						{7,8,12},		//11
						{7,8,11,13},	//12
						{9,12},			//13
				};

		vector<MapSearchNode> Nodes = {};

		for (uint i = 0; i < IndexX.size(); i++)
		{
			MapSearchNode OneNode(IcraMap.navigation_positionx[IndexX[i]], IcraMap.navigation_positiony[IndexY[i]], i);
			Nodes.push_back(OneNode);
			DStar->AddToAllNode(OneNode);
		}

		for (uint i = 0; i < IndexX.size(); i++)
		{
			vector<MapSearchNode*> NewNeighbors = {};
			for (uint j = 0; j < NeighborIndex[i].size(); j++)
			{
				NewNeighbors.push_back(&Nodes[NeighborIndex[i][j]]);
			}
			Nodes[i].SetNeighbors(NewNeighbors);
			DStar->SetNeighbors(DStar->m_AllNode[i], NeighborIndex[i]);
		}
		return Nodes;
	}

	vector<uint> FindNeighbor(MapSearchNode& Node, vector<MapSearchNode>& Nodes, vector<vector<MapSearchNode>>& Obstacles)
	{
		uint Number = 4;//找4个最近的点
		vector<vector<float>> SearchTable;
		vector<uint> NeighborIndex = {};
		for (uint i = 0; i < Nodes.size(); i++)
		{
			float Distance = sqrt(pow(Nodes[i].x - Node.x, 2) + pow(Nodes[i].y - Node.y, 2));
			if (Nodes[i].id != Node.id)
				SearchTable.push_back({ Distance, (float)i });
		}
		sort(SearchTable.begin(), SearchTable.end(), Compare);
		for (uint i = 0; i < Number; i++)
		{
			if (!IsBlocked(Node, Nodes[SearchTable[i][1]], Obstacles))//没有被阻挡
			{
				
				Node.AddNeighbor(&Nodes[SearchTable[i][1]]);
				Nodes[SearchTable[i][1]].AddNeighbor(&Node);
				NeighborIndex.push_back((uint)SearchTable[i][1]);
			}
		}
		return NeighborIndex;
	}

	bool IsBlocked(MapSearchNode& NodeA, MapSearchNode& NodeB, vector<vector<MapSearchNode>>& Obstacles)
	{
		float MinX = min(NodeA.x, NodeB.x);
		float MinY = min(NodeA.y, NodeB.y);
		float MaxX = max(NodeA.x, NodeB.x);
		float MaxY = max(NodeA.y, NodeB.y);
		vector<MapSearchNode> Obstacle;
		vector<vector<MapSearchNode>> PreObstacle;
		bool Hit = false;
		for (uint i = 0; i < Obstacles.size(); i++)
		{
			Obstacle = Obstacles[i];
			if (i == 4)
			{
				if (Obstacle[2].x < MaxX && Obstacle[3].x > MinX&& Obstacle[0].y < MaxY && Obstacle[1].y > MinY)//说明可能碰撞
				{
					if (NodeA.x == NodeB.x)
					{
						if (NodeA.x > Obstacle[0].x&& NodeA.x < Obstacle[1].x && Obstacle[0].y < MaxY && Obstacle[0].y > MinY)
						{
							//printf("Hit with 4!");
							return true;
						}
					}
					else if (NodeA.y == NodeB.y)
					{
						if (NodeA.y > Obstacle[2].y&& NodeA.y < Obstacle[3].y && Obstacle[0].x < MaxX && Obstacle[0].x > MinX)
						{
							//printf("Hit with 4!");
							return true;
						}
					}
					else
					{
						float ny = (NodeB.y - NodeA.y) / (NodeB.x - NodeA.x) * (Obstacle[2].x - NodeA.x) + NodeA.y;
						float nx = (NodeB.x - NodeA.x) / (NodeB.y - NodeA.y) * (Obstacle[0].y - NodeA.y) + NodeA.x;
						if ((ny > Obstacle[2].y&& ny < Obstacle[3].y) || (nx > Obstacle[0].x&& nx < Obstacle[1].x))
						{
							//printf("Hit with 4!");
							return true;
						}
					}
				}
				continue;
			}
			if (Obstacle[0].x < MaxX && Obstacle[3].x > MinX&& Obstacle[0].y < MaxY && Obstacle[3].y > MinY)//说明可能碰撞
			{
				PreObstacle.push_back(Obstacle);
				Hit = true;
			}
		}
		if (Hit)
		{
			for(uint j = 0; j < PreObstacle.size(); j++)
			{
				Obstacle = PreObstacle[j];
				if (NodeA.x == NodeB.x)
				{
					if (NodeA.x > Obstacle[0].x&& NodeA.x < Obstacle[3].x && Obstacle[0].y < MaxY && Obstacle[0].y > MinY)
					{
						//printf("Node %d, Node %d, Hit with %d!\n", NodeA.id, NodeB.id, Obstacle[0].id / 4);
						return true;
					}
				}
				else if (NodeA.y == NodeB.y)
				{
					if (NodeA.y > Obstacle[0].y&& NodeA.y < Obstacle[3].y && Obstacle[0].x < MaxX && Obstacle[0].x > MinX)
					{
						//printf("Node %d, Node %d, Hit with %d!\n", NodeA.id, NodeB.id, Obstacle[0].id / 4);
						return true;
					}
				}
				else
				{
					float ny1 = (NodeB.y - NodeA.y) / (NodeB.x - NodeA.x) * (Obstacle[0].x - NodeA.x) + NodeA.y;
					float ny2 = (NodeB.y - NodeA.y) / (NodeB.x - NodeA.x) * (Obstacle[2].x - NodeA.x) + NodeA.y;
					float nx1 = (NodeB.x - NodeA.x) / (NodeB.y - NodeA.y) * (Obstacle[0].y - NodeA.y) + NodeA.x;
					float nx2 = (NodeB.x - NodeA.x) / (NodeB.y - NodeA.y) * (Obstacle[1].y - NodeA.y) + NodeA.x;
					if ((ny1 > Obstacle[0].y&& ny1 < Obstacle[1].y) || (ny2 > Obstacle[2].y&& ny2 < Obstacle[3].y) || (nx1 > Obstacle[0].x&& nx1 < Obstacle[2].x) || (nx2 > Obstacle[1].x&& nx2 < Obstacle[3].x))
					{
						//printf("Node %d, Node %d, Hit with %d!\n", NodeA.id, NodeB.id, Obstacle[0].id / 4);
						return true;
					}
				}
			}
		}
		return false;
	}

	bool Compare(const vector<float>& a, const vector<float>& b)
	{
		return a[0] < b[0];
	}

	vector<vector<MapSearchNode>> GetObstacle(vector<MapSearchNode>& Nodes, float Offset)
	{
		Map IcraMap;
		vector<vector<MapSearchNode>> Obstacles;
		for (uint n = 0; n < IcraMap.obstacles_center.size(); n++)
		{
			vector<MapSearchNode> Obstacle;
			for (uint i = 0; i < 4; i++)
			{
				float x = IcraMap.obstacles_center[n][0];
				float y = IcraMap.obstacles_center[n][1];
				if(n != 4)
				{
					switch (i)
					{
						case 0:
							x -= Offset + IcraMap.obstacles_offsetx[n];
							y -= Offset + IcraMap.obstacles_offsety[n];
							break;
						case 1:
							x -= Offset + IcraMap.obstacles_offsetx[n];
							y += Offset + IcraMap.obstacles_offsety[n];
							break;
						case 2:
							x += Offset + IcraMap.obstacles_offsetx[n];
							y -= Offset + IcraMap.obstacles_offsety[n];
							break;
						case 3:
							x += Offset + IcraMap.obstacles_offsetx[n];
							y += Offset + IcraMap.obstacles_offsety[n];
							break;
					}
				}
				else
				{
					switch (i)
					{
						case 0:
							x -= Offset + IcraMap.obstacles_offsetx[n];
							break;
						case 1:
							x += Offset + IcraMap.obstacles_offsetx[n];
							break;
						case 2:
							y -= Offset + IcraMap.obstacles_offsety[n];
							break;
						case 3:
							y += Offset + IcraMap.obstacles_offsety[n];
							break;
					}
				}

				MapSearchNode OneNode(x, y, i + n * 4);
				Obstacle.push_back(OneNode);
			}
			Obstacles.push_back(Obstacle);
		}
		return Obstacles;
	}

	void GetSimplePath(vector<uint>& Path, vector<MapSearchNode>& Nodes, vector<vector<MapSearchNode>>& Obstacles)
	{
		//return;
		if (Path.size() <= 2)
			return;
		for (uint i = 1; i < Path.size() - 1; i++)
		{
			MapSearchNode LastNode = Nodes[Path[i - 1]];
			MapSearchNode NowNode = Nodes[Path[i]];
			MapSearchNode NextNode = Nodes[Path[i + 1]];
			if (fabsf((NowNode.x - LastNode.x) * (NextNode.y - NowNode.y) - (NextNode.x - NowNode.x) * (NowNode.y - LastNode.y)) <= 0.001)//共线
			{
				Path.erase(Path.begin() + i);
				i--;
			}
		}
	}
}


