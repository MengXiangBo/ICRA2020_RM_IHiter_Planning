#include "find_path.h"
namespace hitcrt
{
    // Definitions
	void MapSearchNode::AddNeighbor(MapSearchNode* NewNeighbor)
	{
		neighbors.push_back(NewNeighbor);
	}

	void MapSearchNode::SetNeighbors(vector<MapSearchNode*> NewNeighbors)
	{
		neighbors = NewNeighbors;
	}

    bool MapSearchNode::IsSameState( MapSearchNode &Node )
    {
		// same state in a maze search is simply when id are the same
        if(id == Node.id)
        {
            return true;
        }
        return false;
    }

    void MapSearchNode::PrintNodeInfo()
    {
        char str[100];
		sprintf(str, "Node position : (%f,%f)\n", x, y);

		std::cout << str << endl;
    }

// Here's the heuristic function that estimates the distance from a Node
// to the Goal.

    float MapSearchNode::GoalDistanceEstimate( MapSearchNode &NodeGoal )
    {
        return (fabsf(x - NodeGoal.x) + fabsf(y - NodeGoal.y))*1;
    }

    bool MapSearchNode::IsGoal( MapSearchNode &NodeGoal )
    {
        if(id == NodeGoal.id)
        {
            return true;
        }
        return false;
    }

    float MapSearchNode::GetCost( MapSearchNode &Successor )
    {
		for (uint i = 0; i < obstacles.size(); i++)
		{
			if (Successor.id == (obstacles[i])->id)
				return 10000;
		}
		return sqrt(pow(x - Successor.x,2) + pow(y - Successor.y, 2));
    }

	float MapSearchNode::GetCost(MapSearchNode& LastNode, MapSearchNode& NextNode)
	{
		for (uint i = 0; i < obstacles.size(); i++)
		{
			if (LastNode.id == (obstacles[i])->id)
				return 10000;
		}
		float w = .8;
		float l1 = sqrt(pow(x - LastNode.x, 2) + pow(y - LastNode.y, 2));
		float l2 = sqrt(pow(x - NextNode.x, 2) + pow(y - NextNode.y, 2));
		float l3 = sqrt(pow(LastNode.x - NextNode.x, 2) + pow(LastNode.y - NextNode.y, 2));
		float PI = 3.14159265357;
		float costheta = (l1*l1+l2*l2-l3*l3)/(2*l1*l2);
		if(costheta < -1)
			w = 0;
		else if(costheta > 1)
			w = w * PI;
		else
			w = w * (PI - acos((l1*l1+l2*l2-l3*l3)/(2*l1*l2)));//余弦定理算角度
		return sqrt(pow(x - LastNode.x, 2) + pow(y - LastNode.y, 2)) + w;
	}

}






