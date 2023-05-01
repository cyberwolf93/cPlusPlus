#include <iostream>

using std::cout;
using std::endl;

void print(std::function<int(int, int)> callback) {
    cout << callback(10, 20) << endl;
}


int main() {

    auto x = [](int x, int y) -> int{
        cout << x + y << endl;
        return 1;
    };

    std::function<std::string(int,int)> func = [](int x, int y)  {
        cout << x + y << endl;
        return "end";
    };

    cout << "start" << endl;
    print(x);

    cout << func(10,20) << endl;
    return 0;
}