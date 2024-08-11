#include <bits/stdc++.h>
using namespace std;
int n, m;

int heuristic(int x, int y, int endi, int endj)
{
    // manhatten distance
    return abs(endi - x) + abs(endj - y);
}

void astar(vector<vector<int>> &grid, int srcx, int srcy, int destx, int desty)
{
    //<manhatten , <distance , <src,dest>>>
    priority_queue<pair<int, pair<int, pair<int, int>>>, vector<pair<int, pair<int, pair<int, int>>>>, greater<pair<int, pair<int, pair<int, int>>>>> pq;

    vector<vector<int>> vis(n, vector<int>(m, 0));

    // for maintaining path from source to destination
    vector<vector<pair<int, int>>> parent(n, vector<pair<int, int>>(m, {-1, -1}));

    pq.push({0, {0, {srcx, srcy}}});

    vis[srcx][srcy] = 1;

    int manHatten = 0;
    int distance = 0;
    bool flag = 0;

    int rows[] = {1, -1, 0, 0, 1, 1, -1, -1};
    int cols[] = {0, 0, -1, 1, 1, -1, -1, 1};

    while (!pq.empty())
    {
        auto node = pq.top();
        pq.pop();

        int mdist = node.first;
        int dist = node.second.first;
        int x = node.second.second.first;
        int y = node.second.second.second;

        if (x == destx && y == desty)
        {
            distance = dist;
            manHatten = mdist;
            flag = 1;
            break;
        }

        for (int i = 0; i < 8; i++)
        {
            int nrow = rows[i] + x;
            int ncol = cols[i] + y;

            if (nrow >= 0 && nrow < n && ncol >= 0 && ncol < m && grid[nrow][ncol] == 0 && !vis[nrow][ncol])
            {
                vis[nrow][ncol] = 1;
                int tempd = heuristic(nrow, ncol, destx, desty);
                pq.push({tempd + mdist, {dist + 1, {nrow, ncol}}});
                parent[nrow][ncol] = {x, y};
            }
        }
    }
    if (flag)
    {
        cout << "Distance is:- " << distance + 1 << "\n";
        cout << "Manhatten distance is = " << manHatten << "\n";
        cout << "Reached\n Path is:- ";

        vector<pair<int, int>> path;
        int currX = destx;
        int currY = desty;

        while (currX != srcx || currY != srcy)
        {
            path.push_back({currX, currY});
            pair<int, int> parcord = parent[currX][currY];
            currX = parcord.first;
            currY = parcord.second;
        }
        path.push_back({srcx, srcy});
        reverse(path.begin(), path.end());

        for (auto i : path)
        {
            cout << "(" << i.first << "," << i.second << ")\n";
        }
    }
    else
    {
        cout << "Not able to reach";
    }
}

int main()
{
    cout << "Enter row and columns of matrix:- ";
    cin >> n >> m;
    vector<vector<int>> grid(n, vector<int>(m, 0));
    int blocked;
    cout << "Enter no. of blocked state:- ";
    cin >> blocked;

    for (int i = 0; i < blocked; i++)
    {
        int x, y;
        cout << "\nEnter co-ordinates of blocked state (x,y) " << i + 1 << ":- ";
        cin >> x >> y;

        grid[x][y] = 1;
    }

    int srcx, srcy, destx, desty;
    cout << "Enter src(x,y):- ";
    cin >> srcx >> srcy;
    cout << "\n Enter destination(x,y) :- ";
    cin >> destx >> desty;
    int sum = (n - 1) * 2;
    if (srcx + srcy < 0 || srcx + srcy > sum)
    {
        cout << "You are entered src out of bound\n";
    }
    else if (destx + desty < 0 || destx + desty > sum)
    {
        cout << "You are entered dest out of bound\n";
    }

    if (grid[srcx][srcy] == 1 || grid[destx][desty] == 1)
    {
        cout << "You are entered blocking state as src or destination";
    }

    astar(grid, srcx, srcy, destx, desty);
}