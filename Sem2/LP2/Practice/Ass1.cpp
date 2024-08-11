#include <bits/stdc++.h>
using namespace std;

void dfs(vector<int> adj[], int src, vector<bool> &vis)
{
    cout << src << " ";
    vis[src] = 1;

    for (auto i : adj[src])
    {
        if (!vis[i])
            dfs(adj, i, vis);
    }
}

bool dfs1(vector<int> adj[], int src, vector<bool> &vis, int dest)
{
    cout << src << " ";
    vis[src] = 1;

    if (src == dest)
    {
        return true;
    }

    for (auto i : adj[src])
    {
        if (!vis[i])
            if (dfs1(adj, i, vis, dest))
                return true;
    }
    return false;
}

void bfs(vector<int> adj[], queue<int> &q, vector<bool> &vis)
{
    if (q.empty())
    {
        return;
    }
    auto node = q.front();
    q.pop();
    cout << node << " ";
    vis[node] = 1;

    for (auto i : adj[node])
    {
        if (!vis[i])
        {
            vis[i] = 1;
            q.push(i);
        }
    }
    bfs(adj, q, vis);
}

void bfs1(vector<int> adj[], queue<int> &q, vector<bool> &vis, int src, int dest)
{
    if (q.empty())
    {
        return;
    }
    auto node = q.front();
    q.pop();
    cout << node << " ";
    vis[node] = 1;
    if (node == dest)
    {
        return;
    }

    for (auto i : adj[node])
    {
        if (!vis[i])
        {
            vis[i] = 1;
            q.push(i);
        }
    }
    bfs1(adj, q, vis, src, dest);
}
int main()
{
    int vertices, edges;
    cout << "\nEnter no of vertices:- ";
    cin >> vertices;
    cout << "\nEnter no of edges :- ";
    cin >> edges;

    vector<int> adj[vertices];
    int src, dest;
    for (int i = 0; i < edges; i++)
    {
        cout << "\nEnter edge " << i + 1 << ":- ";
        cin >> src >> dest;
        adj[src].push_back(dest);
        adj[dest].push_back(src);
    }

    while (1)
    {
        cout << "\n1.DFS";
        cout << "\n2.BFS";
        cout << "\n3.DFS with start and end";
        cout << "\n4.BFS with start and end";
        cout << "\n0.Exit";
        cout << "\nEnter your choice:- ";
        int ch;
        cin >> ch;

        switch (ch)
        {
        case 1:
        {
            vector<bool> vis(vertices, 0);
            dfs(adj, 0, vis);
            break;
        }
        case 2:
        {
            queue<int> q;
            vector<bool> vis(vertices, 0);
            q.push(0);
            bfs(adj, q, vis);
            break;
        }
        case 3:
        {
            int s, d;
            cout << "\nEnter source:- ";
            cin >> s;
            cout << "\nEnter destination:- ";
            cin >> d;
            vector<bool> vis(vertices, 0);
            dfs1(adj, s, vis, d);
            break;
        }
        case 4:
        {
            queue<int> q;
            int s, d;
            cout << "\nEnter source:- ";
            cin >> s;
            cout << "\nEnter destination:- ";
            cin >> d;
            vector<bool> vis(vertices, 0);
            q.push(s);
            bfs1(adj, q, vis, s, d);
            break;
        }
        case 0:
        {
            exit(0);
            break;
        }
        }
    }
}