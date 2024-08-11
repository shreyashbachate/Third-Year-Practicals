#include <bits/stdc++.h>
using namespace std;
class chatBot
{
    map<string, string> mp;

public:
    chatBot()
    {
        mp.insert({"hi", "Hello bro"});
        mp.insert({"whoareyou", "I am sam"});
        mp.insert({"whichcricketeryoulike", "I like M.s. Dhoni :)"});
    }
    string valid(string a)
    {
        string newstr = "";
        for (auto c : a)
        {
            if (c == ' ' || c == '?')
                continue;
            else
                newstr.push_back(tolower(c));
        }
        return newstr;
    }
    void train()
    {
        cout << "enter question : " << endl;
        string q, a;
        getline(cin, q);
        cout << "enter Answer" << endl;
        getline(cin, a);
        mp.insert({valid(q), a});
    }
    string getAnswer(string s)
    {
        if (mp.find(s) == mp.end())
            return "Sorry i dont know :(";
        return mp[s];
    }
    bool askme()
    {

        cout << ">>";
        string s;

        getline(cin, s);
        if (s == "bye")
        {
            cout << "bye";
            return true;
        }
        cout << s << endl;
        string ans = getAnswer(valid(s));
        cout << "sam: " << ans << endl;
        return false;
    }
};
int main()
{
    chatBot sam;
    // sam.train();
    bool exit = false;
    while (!exit)
    {
        exit = sam.askme();
    }
}