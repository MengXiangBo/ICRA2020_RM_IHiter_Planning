#ifndef DSTARLITE_H
#define DSTARLITE_H

#include <iostream>
#include <stdio.h>
#include <assert.h>

#include <algorithm>
#include <set>
#include <vector>
#include <cfloat>

#define inf 10000
using namespace std;

template <class UserState> class DStarliteSearch
{
public: // data
	using uint = unsigned int;
	
	enum
	{
		SEARCH_STATE_NOT_INITIALISED,
		SEARCH_STATE_SEARCHING,
		SEARCH_STATE_SUCCEEDED,
		SEARCH_STATE_FAILED,
		SEARCH_STATE_OUT_OF_MEMORY,
		SEARCH_STATE_INVALID
	};


public:

	class Node
	{
	public:

		Node* parent; // used during the search to record the parent of successor nodes
		Node* child; // used after the search for the application to view the search in reverse
		vector<Node*> neighbors;
		float g; // cost of this node + it's predecessors
		float h; // heuristic estimate of distance to goal
		float f; // sum of cumulative cost of predecessors and self and heuristic
		float rhs;
		vector<float> key;

		Node() :
			parent(0),
			child(0),
			g(inf),
			rhs(inf),
			h(0.0f),
			f(0.0f),
			key({0.0f,0.0f})
		{
		}

		UserState m_UserState;
	};


	class HeapCompare_f
	{
	public:

		bool operator() (const Node* x, const Node* y) const
		{
			if (x->key[0] == y->key[0])
			{
				return x->key[1] > y->key[1];
			}
			return x->key[0] > y->key[0];
		}
	};
public: // methods
	DStarliteSearch() :
		m_State(SEARCH_STATE_NOT_INITIALISED),
		m_CurrentSolutionNode(NULL),
		m_AllocateNodeCount(0),
		m_CancelRequest(false)
	{
	}

	void CaculateKeys(Node* state)
	{
		state->key[0] = min(state->g, state->rhs) + state->h;
		state->key[1] = min(state->g, state->rhs);
	}

	void UpdateVertex(Node* state)
	{
		Node* child_state = NULL;

		state->rhs = inf;
		if (state->m_UserState.id == 16)
            int a = 0;
        if (state->m_UserState.id == 17)
            int a = 0;
		for (typename vector<Node*>::iterator neighbor = state->neighbors.begin(); neighbor != state->neighbors.end(); neighbor++)
		{
			if ((*neighbor)->child != state)
			{
				float new_rhs;
				int b = (*neighbor)->m_UserState.id;
				
				if ((*neighbor)->child == NULL)
					new_rhs = (*neighbor)->g + (*neighbor)->m_UserState.GetCost(state->m_UserState);
				else
				{
					int c = (*neighbor)->child->m_UserState.id;
					new_rhs = (*neighbor)->g + (*neighbor)->m_UserState.GetCost(state->m_UserState, (*neighbor)->child->m_UserState);
				}
					
				if (new_rhs < state->rhs)
				{
					state->rhs = new_rhs;
					child_state = (*neighbor);
				}
			}
		}
		if(child_state != NULL)
		{
			state->child = child_state;
			//child_state->parent = state;
		}
		state->h = state->m_UserState.GoalDistanceEstimate(m_Start->m_UserState);

		typename vector< Node* >::iterator Ulist_result;
		for (Ulist_result = m_UList.begin(); Ulist_result != m_UList.end(); Ulist_result++)//在Ulist里遍历寻找，找到就break
		{
			if (*Ulist_result == state)
			{
				break;
			}
		}

		if (Ulist_result != m_UList.end())
		{
			m_UList.erase(Ulist_result);
			make_heap(m_UList.begin(), m_UList.end(), HeapCompare_f());
		}
		if (state->g != state->rhs)
		{
			CaculateKeys(state);
			m_UList.push_back(state);
			make_heap(m_UList.begin(), m_UList.end(), HeapCompare_f());
		}
	}

	void UpdateVertexAnd(Node* state)
	{
		Node* child_state = NULL;

		state->rhs = inf;
		state->g = inf;
		for (typename vector<Node*>::iterator neighbor = state->neighbors.begin(); neighbor != state->neighbors.end(); neighbor++)
		{
			if ((*neighbor)->child != state)
			{
				float new_rhs;
				if(state->child == NULL)
					new_rhs = (*neighbor)->g + (*neighbor)->m_UserState.GetCost(state->m_UserState);
				else
					new_rhs = (*neighbor)->g + state->m_UserState.GetCost((*neighbor)->m_UserState, state->child->m_UserState);
				if (new_rhs < state->rhs)
				{
					state->rhs = new_rhs;
					child_state = (*neighbor);
				}
			}
		}
		if (child_state != NULL)
		{
			state->child = child_state;
			//child_state->parent = state;
		}
		state->h = state->m_UserState.GoalDistanceEstimate(m_Start->m_UserState);

		typename vector< Node* >::iterator Ulist_result;
		for (Ulist_result = m_UList.begin(); Ulist_result != m_UList.end(); Ulist_result++)//在Ulist里遍历寻找，找到就break
		{
			if (*Ulist_result == state)
			{
				break;
			}
		}

		if (Ulist_result != m_UList.end())
		{
			m_UList.erase(Ulist_result);
			make_heap(m_UList.begin(), m_UList.end(), HeapCompare_f());
		}
		if (state->g != state->rhs)
		{
			CaculateKeys(state);
			m_UList.push_back(state);
			make_heap(m_UList.begin(), m_UList.end(), HeapCompare_f());
		}

		for (typename vector<Node*>::iterator neighbor = state->neighbors.begin(); neighbor != state->neighbors.end(); neighbor++)
		{
			if ((*neighbor)->child == state)
			{
				UpdateVertexAnd((*neighbor));
			}
		}
	}


	void SetStartAndGoalStates(UserState& Start, UserState& Goal)
	{
		m_CancelRequest = false;


		for (uint i = 0; i < m_AllNode.size(); i++)
		{
			if (m_AllNode[i]->m_UserState.id == Start.id)
			{
				m_Start = m_AllNode[i];
			}
			if (m_AllNode[i]->m_UserState.id == Goal.id)
			{
				m_Goal = m_AllNode[i];
			}
		}

		m_State = SEARCH_STATE_SEARCHING;

		m_Goal->rhs = 0;

		m_UList.push_back(m_Goal); 
		CaculateKeys(m_Goal);

		push_heap(m_UList.begin(), m_UList.end(), HeapCompare_f());

		m_Steps = 0;
	}

	unsigned int SearchStep()
	{
		CaculateKeys(m_Start);
		while (1)
		{
			if (m_UList.size() == 0)
				break;
			if (!(m_UList.front()->key[0] < m_Start->key[0] || m_Start->rhs != m_Start->g))
				break;
			m_Steps++;


			Node* n = m_UList.front(); // get pointer to the node
			pop_heap(m_UList.begin(), m_UList.end(), HeapCompare_f());
			m_UList.pop_back();



			if (n->m_UserState.IsGoal(m_Start->m_UserState))
			{
				m_Start->child = n->child;
				m_Start->g = n->g;

				if (false == n->m_UserState.IsSameState(m_Goal->m_UserState))
				{

					Node* nodeChild = m_Start->child;
					Node* nodeParent = m_Start;

					while (nodeChild != m_Goal)
					{
						nodeChild->parent = nodeParent;

						nodeParent = nodeChild;
						nodeChild = nodeChild->child;

					}  // Start is always the first node by definition

				}

				m_State = SEARCH_STATE_SUCCEEDED;

				return m_State;
			}



			vector<float> k_old = n->key;
			CaculateKeys(n);
			if ((k_old[0] < n->key[0]) || (k_old[0] == n->key[0] && k_old[1] < n->key[1]))
			{
				m_UList.push_back(n);
				push_heap(m_UList.begin(), m_UList.end(), HeapCompare_f());
			}
			else if (n->g > n->rhs)
			{
				n->g = n->rhs;
				for (typename vector<Node*>::iterator neighbor = n->neighbors.begin(); neighbor != n->neighbors.end(); neighbor++)
				{
					if ((*neighbor) != n->child && (*neighbor) != m_Goal)
					{
						UpdateVertex((*neighbor));
					}
				}
			}
			else
			{
				n->g = inf;
				for (typename vector<Node*>::iterator neighbor = n->neighbors.begin(); neighbor != n->neighbors.end(); neighbor++)
				{
					if ((*neighbor) != n->child && (*neighbor) != m_Goal)
					{
						UpdateVertex((*neighbor));
					}
				}
			}
			CaculateKeys(m_Start);
		}
		
		return m_State;
	}

	void AddObstacle(uint a, uint b)
	{
		m_AllNode[a]->m_UserState.obstacles.push_back(&(m_AllNode[b]->m_UserState));
		m_AllNode[b]->m_UserState.obstacles.push_back(&(m_AllNode[a]->m_UserState));
		
	}
	void Updateh(uint a)
	{
		m_Start = m_AllNode[a];
		for (uint i = 0; i < m_UList.size(); i++)
		{
			m_UList[i]->h = m_UList[i]->m_UserState.GoalDistanceEstimate(m_Start->m_UserState);
			CaculateKeys(m_UList[i]);
		}
		make_heap(m_UList.begin(), m_UList.end(), HeapCompare_f());

	}

	void AddToAllNode(UserState &n)
	{
		Node* onenode = AllocateNode();
		onenode->m_UserState = n;
		m_AllNode.push_back(onenode);
	}

	void AddNeighbor(Node* n, uint uiNeighborIndex)
	{
		n->neighbors.push_back(m_AllNode[uiNeighborIndex]);
	}


	void SetNeighbors(Node* n, vector<uint> vuNeighborIndex)
	{
		for (uint j = 0; j < vuNeighborIndex.size(); j++)
		{
			n->neighbors.push_back(m_AllNode[vuNeighborIndex[j]]);
		}
	}

	void FreeAllNodes()
	{
		// iterate open list and delete all nodes
		typename vector< Node* >::iterator iterOpen = m_AllNode.begin();

		while (iterOpen != m_AllNode.end())
		{
			Node* n = (*iterOpen);
			FreeNode(n);

			iterOpen++;
		}

		m_AllNode.clear();
		m_UList.clear();
	}


	// Get start node
	UserState* GetSolutionStart()
	{
		m_CurrentSolutionNode = m_Start;
		if (m_Start)
		{
			return &m_Start->m_UserState;
		}
		else
		{
			return NULL;
		}
	}

	// Get next node
	UserState* GetSolutionNext()
	{
		if (m_CurrentSolutionNode)
		{
			if (m_CurrentSolutionNode->child)
			{

				Node* child = m_CurrentSolutionNode->child;

				m_CurrentSolutionNode = m_CurrentSolutionNode->child;

				return &child->m_UserState;
			}
		}

		return NULL;
	}

	// Get end node
	UserState* GetSolutionEnd()
	{
		m_CurrentSolutionNode = m_Goal;
		if (m_Goal)
		{
			return &m_Goal->m_UserState;
		}
		else
		{
			return NULL;
		}
	}
	vector< Node* > m_AllNode;
	vector< Node*> m_UList;
private: // methods


	Node* AllocateNode()
	{
		Node* p = new Node;
		return p;
	}

	void FreeNode(Node* node)
	{

		m_AllocateNodeCount--;

		delete node;
	}
	

private: // data

	vector< Node* > m_Successors;

	
	// State
	unsigned int m_State;

	int m_Steps;

	Node* m_Start;
	Node* m_Goal;

	Node* m_CurrentSolutionNode;

	int m_AllocateNodeCount;

	bool m_CancelRequest;
};

#endif


