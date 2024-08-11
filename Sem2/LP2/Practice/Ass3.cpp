#include <bits/stdc++.h>
using namespace std;

void printMinimumSpanningTree(vector<pair<int, int>> adj[], int V)
{
    // weight, node , parent
    priority_queue<pair<int, pair<int, int>>, vector<pair<int, pair<int, int>>>, greater<pair<int, pair<int, int>>>> pq;
    vector<int> vis(V, 0);
    vector<vector<int>> path;
    pq.push({0, {0, -1}});

    while (!pq.empty())
    {
        auto it = pq.top();
        pq.pop();
        int node = it.second.first;
        int weight = it.first;
        int parent = it.second.second;

        if (vis[node])
            continue;

        if (parent != -1)
        {
            vector<int> temp(3);
            temp[0] = parent;
            temp[1] = node;
            temp[2] = weight;

            path.push_back(temp);
        }

        vis[node] = 1;

        for (auto i : adj[node])
        {
            int adjNode = i.first;
            int edw = i.second;
            if (!vis[adjNode])
            {
                pq.push({edw, {adjNode, node}});
            }
        }
    }

    cout << "Minimum spanning tree:- \n ";
    int cost = 0;
    for (auto i : path)
    {
        cout << i[0] << " <------> " << i[1] << "   =    " << i[2] << "\n";
        cost += i[2];
    }
    cout << "\nMinimum cost is = " << cost << "\n";
}

int main()
{
    int vertices, edges;
    cout << "\nEnter no of vertices:- ";
    cin >> vertices;
    cout << "\nEnter no of edges:- ";
    cin >> edges;

    vector<pair<int, int>> adj[vertices];
    int src, dest, weight;
    for (int i = 0; i < edges; i++)
    {
        cout << "Enter src dest and weight for edge " << i + 1 << ":- ";
        cin >> src >> dest >> weight;

        adj[src].push_back({dest, weight});
        adj[dest].push_back({src, weight});
    }

    printMinimumSpanningTree(adj, vertices);
}