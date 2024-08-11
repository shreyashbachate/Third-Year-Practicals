#include<bits/stdc++.h>
using namespace std;
void allot(int a[],int b[],int n)
{
    for(int i=0;i<n;i++)
        a[i] = b[i];
}
void bestFit(int b[],int m,int p[],int n)
{
    int blockSize[m],processSize[n];
    allot(blockSize,b,m);
    allot(processSize,p,n);
    int allocation[n];
    memset(allocation , -1 , sizeof(allocation));

    for(int i=0;i<n;i++)
    {
        int bestIdx = -1;
        for(int j=0;j<m;j++)
        {
            if(blockSize[j] >= processSize [i])
            {
                if(bestIdx == -1) bestIdx = j;

                else if(blockSize[bestIdx] > blockSize[j])
                    bestIdx = j;
            }
        }
        if(bestIdx != -1)
        {
            allocation[i] = bestIdx;
            blockSize[bestIdx] -= processSize[i];
        }
    }
    cout<<"\nProcess No.\tProcess Size \tBlock No\n";
    for(int i=0;i<n;i++)
    {
        cout<<" "<<i+1<<"\t\t"<<processSize[i]<<"\t\t";
        if(allocation[i] != -1)
            cout<<allocation[i]+1<<"\n";
        else
            cout<<"Not alloted\n";
    }
}
void worstFit(int b[],int m,int p[],int n)
{
     int blockSize[m],processSize[n];
    allot(blockSize,b,m);
    allot(processSize,p,n);
    int allocation[n];
    memset(allocation, -1 , sizeof(allocation));

    for(int i=0;i<n;i++)
    {
        int worstIdx = -1;
        for(int j=0;j<m;j++)
        {
            if(blockSize[j] >= processSize[i])
            {
                if(worstIdx == -1) worstIdx = j;

                else if(blockSize[worstIdx] < blockSize[j])
                    worstIdx = j;
            }
        }
        if(worstIdx != -1)
        {
            allocation[i] = worstIdx;
            blockSize[worstIdx] -= processSize[i];
        }
    }
    cout<<"\nProcess No.\tProcess Size \tBlock No\n";
    for(int i=0;i<n;i++)
    {
        cout<<" "<<i+1<<"\t\t"<<processSize[i]<<"\t\t";
         if(allocation[i] != -1)
            cout<<allocation[i]+1<<"\n";
        else
            cout<<"Not alloted\n";
    }
}
void firstFit(int b[],int m,int p[],int n)
{
     int blockSize[m],processSize[n];
    allot(blockSize,b,m);
    allot(processSize,p,n);
    int allocation[n];
    memset(allocation,-1,sizeof(allocation));

    for(int i=0;i<n;i++)
    {
        for(int j=0;j<m;j++)
        {
            if(blockSize[j] >= processSize[i])
            {
                allocation[i] = j;
                blockSize[j] -= processSize[i];
                break;
            }
        }
    }
    cout<<"\nProcess No.\tProcess Size \tBlock No\n";
    for(int i=0;i<n;i++)
    {
        cout<<" "<<i+1<<"\t\t"<<processSize[i]<<"\t\t";
        if(allocation[i] != -1)
            cout<<allocation[i]+1<<"\n";
        else
            cout<<"Not alloted\n";
    }
}
void nextFit(int b[],int m,int p[],int n)
{
     int blockSize[m],processSize[n];
    allot(blockSize,b,m);
    allot(processSize,p,n);
    int allocation[n];
    int j=0;
    memset(allocation , -1, sizeof(allocation));

    for(int i=0;i<n;i++)
    {
        int count = 0;
        while(count < m)
        {
            if(blockSize[j] >= processSize[i])
            {
                allocation[i] = j;
                blockSize[j] -= processSize[i];
                break;
            }
            j = (j+1) % m;
            count++;
        }
    }
    cout<<"\nProcess No.\tProcess Size \tBlock No\n";
    for(int i=0;i<n;i++)
    {
        cout<<" "<<i+1<<"\t\t"<<processSize[i]<<"\t\t";
         if(allocation[i] != -1)
            cout<<allocation[i]+1<<"\n";
        else
            cout<<"Not alloted\n";
    }

}

int main()
{
    bool se = true;

   
        
    
        int m,n;
        cout<<"\nEnter no. of blocks : ";
        cin>>m;
        int a[m];
        for(int i=0;i<m;i++)
        {
            cout<<"\n Enter size of "<<i+1<<"block :- ";
            cin>>a[i];
        }

        cout<<"\n Enter no. of processes : ";
        cin>>n;
        int b[n];
        for(int i=0;i<n;i++)
        {
            cout<<"\n Enter size of "<<i+1<<" process:- ";
            cin>>b[i];
        }
    while(se)
    {
        cout<<"\n=============MENU==============";
        cout<<"\n1.Best Fit";
        cout<<"\n2.Worst Fit";
        cout<<"\n3.First Fit";
        cout<<"\n4.Next Fit";
        cout<<"\n5.Exit";
        cout<<"\n Enter your choice :- ";
        int ch;
        cin>>ch;

        switch(ch)
        {
            case 1: bestFit(a,m,b,n);
                    break;
            case 2: worstFit(a,m,b,n);
                    break;
            case 3: firstFit(a,m,b,n);
                    break;
            case 4: nextFit(a,m,b,n);
                    break;
            case 5: se = false;
                    break;
            default: cout<<"\n Enter valid choice\n";
                    break;
        }
    }

}