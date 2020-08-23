#include "global_planning.h"
namespace hitcrt
{
	void GlobalPlanner::PlannerInit()
	{
		nodes = AddNodeInMap(&dstar);//
		obstacles = GetObstacle(nodes, 0.3);//
	}
	void GlobalPlanner::PlannerDelete()
	{
		dstar.FreeAllNodes();
		nodes = AddNodeInMap(&dstar);//
		
	}
	vector<vector<float>> GlobalPlanner::PlannerStart(vector<float> StartPos, vector<float> EndPos)
	{
		last_endposition = EndPos;
		nodes.push_back(MapSearchNode(StartPos[0], StartPos[1], nodes.size()));
		nodes.push_back(MapSearchNode(EndPos[0], EndPos[1], nodes.size()));

		vector<uint> s = FindNeighbor(nodes[nodes.size() - 2], nodes, obstacles);
		vector<uint> g = FindNeighbor(nodes[nodes.size() - 1], nodes, obstacles);

		//把近邻加入vector中
		dstar.AddToAllNode(nodes[nodes.size() - 2]);
		dstar.AddToAllNode(nodes[nodes.size() - 1]);
		dstar.SetNeighbors(dstar.m_AllNode[dstar.m_AllNode.size() - 2], s);
		for (uint i = 0; i < s.size(); i++)
		{
			dstar.AddNeighbor(dstar.m_AllNode[s[i]], dstar.m_AllNode.size() - 2);
		}
		dstar.SetNeighbors(dstar.m_AllNode[dstar.m_AllNode.size() - 1], g);
		for (uint i = 0; i < g.size(); i++)
		{
			dstar.AddNeighbor(dstar.m_AllNode[g[i]], dstar.m_AllNode.size() - 1);
		}

		dstar.SetStartAndGoalStates(nodes[nodes.size() - 2], nodes[nodes.size() - 1]);
		dstar.SearchStep();

		MapSearchNode* Node = dstar.GetSolutionStart();
		int steps = 0;
		//Node->PrintNodeInfo();
		vector<uint> PathNodes = {};
		PathNodes.push_back(Node->id);
		for (;;)
		{
			Node = dstar.GetSolutionNext();
			if (!Node)
			{
				break;
			}
			steps++;
			PathNodes.push_back(Node->id);
		}
		GetSimplePath(PathNodes, nodes, obstacles);//删除中间点，简化路径
		path_index = PathNodes;
		vector<vector<float>> Path;
		vector<float> PositionX;
		vector<float> PositionY;
		for (uint i = 0; i < PathNodes.size(); i++)
		{
			PositionX.push_back(nodes[PathNodes[i]].x);
			PositionY.push_back(nodes[PathNodes[i]].y);
			printf("%d", PathNodes[i]);
		}
		Path = {PositionX, PositionY};
		
		last_path = Path;
		return Path;
	}

	vector<vector<float>> GlobalPlanner::PlannerStart(vector<float> StartPos, uint EndPoint)
	{
		last_endpoint = EndPoint;
		nodes.push_back(MapSearchNode(StartPos[0], StartPos[1], nodes.size()));

		vector<uint> s = FindNeighbor(nodes[nodes.size() - 1], nodes, obstacles);

		//把近邻加入vector中
		dstar.AddToAllNode(nodes[nodes.size() - 1]);
		dstar.SetNeighbors(dstar.m_AllNode[dstar.m_AllNode.size() - 1], s);
		for (uint i = 0; i < s.size(); i++)
		{
			dstar.AddNeighbor(dstar.m_AllNode[s[i]], dstar.m_AllNode.size() - 1);
		}

		dstar.SetStartAndGoalStates(nodes[nodes.size() - 1], nodes[EndPoint]);
		dstar.SearchStep();

		MapSearchNode* Node = dstar.GetSolutionStart();
		int steps = 0;
		//Node->PrintNodeInfo();
		vector<uint> PathNodes = {};
		PathNodes.push_back(Node->id);
		for (;;)
		{
			Node = dstar.GetSolutionNext();
			if (!Node)
			{
				break;
			}
			steps++;
			PathNodes.push_back(Node->id);
		}
		GetSimplePath(PathNodes, nodes, obstacles);//删除中间点，简化路径
		path_index = PathNodes;
		vector<vector<float>> Path;
		vector<float> PositionX;
		vector<float> PositionY;
		for (uint i = 0; i < PathNodes.size(); i++)
		{
			PositionX.push_back(nodes[PathNodes[i]].x);
			PositionY.push_back(nodes[PathNodes[i]].y);
		}
		Path = {PositionX, PositionY};
		
		last_path = Path;
		return Path;
	}



	vector<vector<float>> GlobalPlanner::CPlannerStart(vector<float> StartPos, vector<float> EndPos, vector<vector<float>> ConstraintPath, float Velocity)
	{
		last_endposition = EndPos;
		nodes.push_back(MapSearchNode(StartPos[0], StartPos[1], nodes.size()));
		nodes.push_back(MapSearchNode(EndPos[0], EndPos[1], nodes.size()));

		vector<uint> s = FindNeighbor(nodes[nodes.size() - 2], nodes, obstacles);
		vector<uint> g = FindNeighbor(nodes[nodes.size() - 1], nodes, obstacles);

		//把近邻加入vector中
		dstar.AddToAllNode(nodes[nodes.size() - 2]);
		dstar.AddToAllNode(nodes[nodes.size() - 1]);
		dstar.SetNeighbors(dstar.m_AllNode[dstar.m_AllNode.size() - 2], s);
		for (uint i = 0; i < s.size(); i++)
		{
			dstar.AddNeighbor(dstar.m_AllNode[s[i]], dstar.m_AllNode.size() - 2);
		}
		dstar.SetNeighbors(dstar.m_AllNode[dstar.m_AllNode.size() - 1], g);
		for (uint i = 0; i < g.size(); i++)
		{
			dstar.AddNeighbor(dstar.m_AllNode[g[i]], dstar.m_AllNode.size() - 1);
		}

		dstar.SetStartAndGoalStates(nodes[nodes.size() - 2], nodes[nodes.size() - 1]);
		int num = -1;
		vector<float> PositionX;
		vector<float> PositionY;
		vector<vector<float>> Path;
		vector<uint> PathNodes = {};
		do
		{
			dstar.SearchStep();
			MapSearchNode* Node = dstar.GetSolutionStart();
			int steps = 0;
			//Node->PrintNodeInfo();
			PathNodes = {};
			PathNodes.push_back(Node->id);
			for (;;)
			{
				Node = dstar.GetSolutionNext();
				if (!Node)
				{
					break;
				}
				steps++;
				PathNodes.push_back(Node->id);
			}
			PositionX = {};
			PositionY = {};
			for (uint i = 0; i < PathNodes.size(); i++)
			{
				PositionX.push_back(nodes[PathNodes[i]].x);
				PositionY.push_back(nodes[PathNodes[i]].y);
			}
			Path = {PositionX, PositionY};
			num = PathBlocked(Path, ConstraintPath);
			if(num != -1)
			{
				PlannerAddObstacle(PathNodes[num], PathNodes[num + 1]);
			}
		}while(num != -1);
		PositionX = {};
		PositionY = {};
		GetSimplePath(PathNodes, nodes, obstacles);//删除中间点，简化路径
		//path_index = PathNodes;
		for (uint i = 0; i < PathNodes.size(); i++)
		{
			PositionX.push_back(nodes[PathNodes[i]].x);
			PositionY.push_back(nodes[PathNodes[i]].y);
		}
		Path = {PositionX, PositionY};
		last_path = Path;
		return Path;
	}



    void GlobalPlanner::PlannerAddObstacle(uint NumberA, uint NumberB)//a->b
    {
        dstar.AddObstacle(NumberA, NumberB);
        dstar.UpdateVertexAnd(dstar.m_AllNode[NumberA]);
    }
	void GlobalPlanner::PlannerAddPunish(uint Area)
	{
		uint n = nodes[Area].neighbors.size();
		for (uint i = 0; i < n; i++)
		{
			uint Neighbor = nodes[Area].neighbors[i]->id;
			dstar.AddObstacle(Area, Neighbor);
		}
	}
	int GlobalPlanner::PathBlocked(vector<vector<float>> Path, vector<vector<float>> ConstraintPath)
	{
		float x1, y1, x2, y2, c_x1, c_y1, c_x2, c_y2, xa, ya, xb, yb, xc, yc, xd, yd, p, q, intersection_x, intersection_y, g, c_g;
		for(uint i = 0; i < Path[0].size() - 1; i++)
		{
			x1 = Path[0][i];
			y1 = Path[1][i];
			x2 = Path[0][i + 1];
			y2 = Path[1][i + 1];
			for(uint j = 0; j < ConstraintPath[0].size() - 1; j++)
			{
				c_x1 = ConstraintPath[0][j];
				c_y1 = ConstraintPath[1][j];
				c_x2 = ConstraintPath[0][j + 1];
				c_y2 = ConstraintPath[1][j + 1];
				xa = c_x1 - x1;
				ya = c_y1 - y1;
				xb = c_x2 - x1;
				yb = c_y2 - y1;
				xc = x2 - x1;
				yc = y2 - y1;
				p = (xc*yb - xb*yc)/(xa*yb - xb*ya);
				q = (xa*yc - xc*ya)/(xa*yb - xb*ya);
				if(p + q >= 0.98)
				{
					xd = xc / (p + q);
					yd = yc / (p + q);
					intersection_x = x1 + xd;
					intersection_y = y1 + yd;
					g = sqrt(pow(xd, 2) + pow(yd, 2));
					c_g = sqrt(pow(intersection_x - c_x1, 2) + pow(intersection_y - c_y1, 2));
					for(uint ii = 0; ii < i; ii++)
					{
						g += sqrt(pow(Path[0][ii] - Path[0][ii + 1], 2) + pow(Path[1][ii] - Path[1][ii + 1], 2));
					}
					for(uint jj = 0; jj < j; jj++)
					{
						c_g += sqrt(pow(ConstraintPath[0][jj] - ConstraintPath[0][jj + 1], 2) + pow(ConstraintPath[1][jj] - ConstraintPath[1][jj + 1], 2));
					}
					if(fabsf(g - c_g) < 1.0)
					{
						return (int)i;
					}
				}
			}
			
		}
		return -1;
	}
}
