/*
    Name :- Shreyash Ramchandra Bachate
    Roll No:- 31303
*/
#include <bits/stdc++.h>
using namespace std;

void printSpanningTree(vector<pair<int,int>> adj[], int V){
  priority_queue<pair<int, pair<int,int>>,
              vector<pair<int, pair<int,int>> >, greater<pair<int, pair<int,int>>>> pq;
  vector<int> vis(V,0);
  vector<vector<int>> path;
  pq.push({0,{0,-1}});

  while(!pq.empty()){
    auto it = pq.top();
    pq.pop();
    int node = it.second.first;
    int wt = it.first;
    int parent = it.second.second;

    if(vis[node]) continue;

    if(parent != -1){  
      vector<int> tmp(3);
      tmp[0] = parent;
      tmp[1] = node;
      tmp[2] = wt;

      path.push_back(tmp);
    }
    vis[node] = 1;
    for(auto it : adj[node]){
      int adjNode = it.first;
      int edw = it.second;

      if(!vis[adjNode]){
        pq.push({edw,{adjNode,node}});
      }
    }
  }
  cout << "\nPrim's Algorithm \n";
  cout<<"src\tdest\tweight:\n";
  int cost = 0;
  for(auto it : path)
  {
      cout << it[0] << " <--->  " << it[1] << " \t  " << it[2] << endl;
      cost+=it[2];
  }
  cout<<"Minimum weight of spanning tree is = "<<cost<<"\n";
}

int main() {
  int v,e;
  cout << "Enter number of vertices : ";
  cin >> v;
  cout << "\nEnter number of edges : ";
  cin >> e;
  int j=1;
  vector<pair<int,int>> adj[v];
  
  for(int i = 0; i < e; i++){
    cout << "\nEnter src dest and weight for edge" <<j++<<": ";
    int u,v,w;
    cin >> u >> v >> w;
    adj[u].push_back({v,w});
    adj[v].push_back({u,w});
   
  }

  printSpanningTree(adj,v);
   
}