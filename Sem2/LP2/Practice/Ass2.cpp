#include <bits/stdc++.h>
using namespace std;
int n, m;

int heuristic(int x, int y, int destX, int destY)
{
    return abs(destX - x) + abs(destY - y);
}

void astar(vector<vector<int>> &grid, int srcX, int srcY, int destX, int destY)
{
    //manHatten , distancce , src , dest
    priority_queue<pair<int, pair<int, pair<int, int>>>,
                   vector<pair<int, pair<int, pair<int, int>>>>,
                   greater<pair<int, pair<int, pair<int, int>>>>>
        pq;
    pq.push({0, {0, {srcX, srcY}}});
    vector<vector<pair<int, int>>> parent(n, vector<pair<int, int>>(m, {-1, -1}));
    vector<vector<int>> vis(n, vector<int>(m, 0));
    vis[srcX][srcY] = 1;

    int manHatten = 0, distance = 0;
    bool flag = false;
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

        if (x == destX && y == destY)
        {
            manHatten = mdist;
            distance = dist;
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
                int tempd = heuristic(nrow, ncol, destX, destY);
                pq.push({mdist + tempd, {dist + 1, {nrow, ncol}}});
                parent[nrow][ncol] = {x, y};
            }
        }
    }

    if (flag)
    {
        cout << "Distance is = " << distance << "\n";
        cout << "Manhatten distance = " << manHatten << "\n";
        cout << "Path is:- \n";

        vector<pair<int, int>> path;
        int currX = destX, currY = destY;

        while (currX != srcX || currY != srcY)
        {
            path.push_back({currX, currY});
            pair<int, int> par = parent[currX][currY];
            currX = par.first;
            currY = par.second;
        }
        path.push_back({srcX, srcY});

        reverse(path.begin(), path.end());

        for (auto i : path)
        {
            cout << i.first << " " << i.second << "\n";
        }
    }
    else
    {
        cout << "\nDestination not found\n";
    }
}

int main()
{
    cout << "\nEnter row of grid:- ";
    cin >> n;
    cout << "\nEnter column of grid:- ";
    cin >> m;

    vector<vector<int>> grid(n, vector<int>(m, 0));
    int blocked;
    cout << "\nEnter no of blocked state:- ";
    cin >> blocked;
    int x, y;
    for (int i = 0; i < blocked; i++)
    {
        cout << "\nEnter blocked co-ordinates of " << i + 1 << ":- ";
        cin >> x >> y;
        grid[x][y] = 1;
    }
    int srcX, srcY, destX, destY;
    cout << "\nEnter src:- ";
    cin >> srcX >> srcY;
    cout << "\nEnter destination:- ";
    cin >> destX >> destY;

    if (grid[srcX][srcY] == 1 || grid[destX][destY] == 1)
    {
        cout << "\nYou entered blocked cells as src or dest";
        return 0;
    }

    astar(grid, srcX, srcY, destX, destY);
}