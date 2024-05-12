#include <iostream>
#include <algorithm>
#include <vector>
int maxConsecutiveOnes(int n) {
    int half = 0;
    int count = 0;
    int bin = 0;
    int number = n;
    for (int i = 0; number == 1; i++)
    {
        half = number / 2;
        if ((n - 2 * half) == 1) {
            count++;
        }
        if (count == 2)
        {
            bin++;
        }
        number = half;
    }
    return bin;

    // cout<<n/2;
    // string a = "uadh";
    // int a = 3;
    // // a = a/2;
    // if(a/2 == 1){
    // a = 2;
    // }
    // n = 3;

    // Your Solution here
}
int main()
{

}

// cout<<nn;

