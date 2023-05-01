#include <iostream>
#include <cstdlib>

int func();
void funcByReference(int &a);
void defaultFunc(int x);
int recursive(int n);

namespace math {
    template <class T, class F>
    T sum(T, F);
}




int main() {

    std::string str = "hello world";
    for (char c: str) {
        std::cout << c << std::endl;
    }


    int x = func();
    std::cout << x << std::endl;

    int y = 10;
    funcByReference(y);
    std::cout << y << std::endl;

    defaultFunc(1);

    std::cout << recursive(5) << std::endl;

    // generic type
    std::cout << math::sum<int>(1, 1.2) << std::endl;
    std::cout << math::sum<double,int>(1.1, 1) << std::endl;

    // return 0
    return EXIT_SUCCESS;
}

int func() {
    std::cout << "yes" << std::endl;
    return 9;
}

void funcByReference(int &a) {
    a++;
}

void defaultFunc(int x=1) {

}

int recursive(int n) {
    return n == 1 ? 1 : n * recursive(n - 1);
}

template <class T, class F>
T math::sum(T x, F y) {
    return x + (T) y;
}

