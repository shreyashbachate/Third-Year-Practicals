#include <bits/stdc++.h>
using namespace std;
int n;
class Solution
{
public:
    // Backtracking
    bool isSafe(int row, int col, int n, vector<string> &board)
    {
        int duprow = row;
        int dupcol = col;

        while (row >= 0 && col >= 0)
        {
            if (board[row][col] == 'Q')
                return false;
            row--;
            col--;
        }

        row = duprow;
        col = dupcol;
        while (col >= 0)
        {
            if (board[row][col] == 'Q')
                return false;
            col--;
        }

        row = duprow;
        col = dupcol;
        while (row < n && col >= 0)
        {
            if (board[row][col] == 'Q')
                return false;
            row++;
            col--;
        }
    }

    void solve(vector<vector<string>> &ans, vector<string> &board, int n, int col)
    {
        if (col >= n)
        {
            ans.push_back(board);
            return;
        }

        for (int row = 0; row < n; row++)
        {
            if (isSafe(row, col, n, board))
            {
                board[row][col] = 'Q';
                solve(ans, board, n, col + 1);
                board[row][col] = '.';
            }
        }
    }
    vector<vector<string>> solveNQueens(int n)
    {
        vector<vector<string>> ans;
        vector<string> board(n);
        string s(n, '.');
        for (int i = 0; i < n; i++)
        {
            board[i] = s;
        }
        solve(ans, board, n, 0);
        return ans;
    }

    // branch and bound

    bool isSafe2(int row, int col, vector<bool> &rows, vector<bool> &left, vector<bool> &right)
    {
        if (rows[row] == 1 || left[col + row] == 1 || right[col - row + n - 1] == 1)
        {
            return false;
        }
        return true;
    }

    bool safe(vector<vector<int>> &board, vector<bool> &rows, vector<bool> &left, vector<bool> &right, int col)
    {
        if (col >= n)
        {
            return true;
        }

        for (int row = 0; row < n; row++)
        {
            if (isSafe2(row, col, rows, left, right))
            {
                rows[row] = 1;
                left[col + row] = 1;
                right[col - row + n - 1] = 1;
                board[row][col] = 1;

                if (safe(board, rows, left, right, col + 1))
                    return true;

                rows[row] = 0;
                left[col + row] = 0;
                right[col - row + n - 1] = 0;
                board[row][col] = 0;
            }
        }
        return false;
    }
};

int main()
{
    Solution obj;
    cout << "\nEnter your size of matrix:- ";
    cin >> n;

    while (1)
    {
        cout << "\n1.BackTracking";
        cout << "\n2.Branch and bound";
        cout << "\n0.Exit";
        cout << "\nEnter your choice:- ";
        int ch;
        cin >> ch;

        switch (ch)
        {
        case 1:
        {
            vector<vector<string>> ans = obj.solveNQueens(n);

            if (ans.size() == 0)
            {
                cout << "\nNo arrangement possible\n";
            }
            else
            {
                cout << "Total Arrangements = " << ans.size() << "\n";

                for (int i = 0; i < ans.size(); i++)
                {
                    cout << "Arrangement " << i + 1 << ":-\n";
                    for (int j = 0; j < ans[i].size(); j++)
                    {
                        cout << ans[i][j] << "\n";
                    }
                    cout << "\n\n";
                }
            }
            break;
        }
        case 2:
        {
            vector<vector<int>> board(n, vector<int>(n, 0));
            vector<bool> rows(n), left(2 * n - 1), right(2 * n - 1);
            bool ans = obj.safe(board, rows, left, right, 0);
            if (ans)
            {
                for (int i = 0; i < n; i++)
                {
                    for (int j = 0; j < n; j++)
                    {
                        if (board[i][j])
                            cout << 'Q';
                        else
                            cout << '.';
                    }
                    cout << "\n";
                }
            }
            else
            {
                cout << "\nNo arrangement possible\n";
            }
            break;
        }
        case 0:
        {
            exit(0);
            break;
        }
        default:
        {
            cout << "\nEnter correct choice\n";
            break;
        }
        }
    }
}