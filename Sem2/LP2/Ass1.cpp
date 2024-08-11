#include<bits/stdc++.h>

using namespace std;

bool dfs1(int node, vector<int>& vis, vector<int> adj[], int des){
  vis[node] = 1;
  cout << node << " ";
  if(node == des) return true;
  for(auto it : adj[node]){
    if(!vis[it])
        if(dfs1(it,vis,adj,des))
          return true;
  }
  return true;
}

void bfs(vector<int>& vis, vector<int> adj[], queue<int>& q, int des){
  if(q.empty())
      return;
  int node = q.front();
  q.pop();
  cout << node << " ";
  if(node == des)  return;
  for(auto it : adj[node]){
    if(!vis[it]){
      vis[it] = 1;
      q.push(it);
    }
  }

  bfs(vis,adj,q,des);
}

void bfs1(vector<int>& vis, vector<int> adj[], queue<int>& q){
  if(q.empty())
      return;
  int node = q.front();
  q.pop();
  cout << node << " ";
  // if(node == des)  return;
  for(auto it : adj[node]){
    if(!vis[it]){
      vis[it] = 1;
      q.push(it);
    }
  }

  bfs1(vis,adj,q);
}

void dfs(vector<int> &vis,int src,vector<int> adj[])
{
    cout<<src<<" ";
    vis[src] = 1;
    for(auto it: adj[src])
    {
        if(!vis[it])
        {
            dfs(vis,it,adj);
        }
    }

}


int main()
{
    int vertices,edges;
    cout<<"Enter number of vertices :- \n";
    cin>>vertices;
    cout<<"Enter number of edges :- \n";
    cin>>edges;
    int j = 1;
    vector<int> adj[vertices];
    
    vector<int> vis(vertices,0);
    for(int i=0;i<edges;i++)
    {
        cout<<"Enter edge "<<j++<<":- ";
        int u,v;
        cin>>u>>v;
        adj[u].push_back(v);
        adj[v].push_back(u);
    }
    queue<int> q;
    
    bool temp = true;
    int src,dest;
    while(temp)
    {
        int ch;
        cout<<"\n================ MENU =================\n";
        cout<<"\n1.DFS";
        // cout<<"\n2.BFS";
        cout<<"\n2.DFS with starting point";
        cout<<"\n3.BFS with starting point";
        cout<<"\n Enter your choice :- ";
        cin>>ch;

        switch(ch)
        {
            case 1:
                    cout<<"Enter source :- ";
                    cin>>src;
                    dfs(vis,src,adj);
                    for(int i = 0; i < vertices; i++) vis[i] = 0;
                    break;
                    
            
            case 2: cout<<"Enter source :- ";
                    cin>>src;
                    cout<<"Enter destination :- ";
                    cin>>dest;
                    
                    dfs1(src,vis,adj,dest);
                    for(int i = 0; i < vertices; i++) vis[i] = 0;
                    break;

            case 3: 
                    cout<<"Enter source :- ";
                    cin>>src;
                    cout<<"Enter destination :- ";
                    cin>>dest;
                    cout << "\nBFS : ";
                    vis[src] = 1;
                    q.push(src);
                    bfs(vis,adj,q,dest);
                    for(int i = 0; i < vertices; i++) vis[i] = 0;
                    break;
                  
            case 4:
              cout<<"Enter source :- ";
                    cin>>src;
                    cout << "\nBFS : ";
                    vis[src] = 1;
                    q.push(src);
                    bfs1(vis,adj,q);
                    for(int i = 0; i < vertices; i++) vis[i] = 0;
                    break;
             case 5 :
                        temp = false;
                        exit(0);
                        break;
            default : temp = false;
        }
    }
    return 0;

}