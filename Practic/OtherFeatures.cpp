#include <iostream>
#include <typeinfo>
#include <exception>


class Test {
public:
    explicit Test(int x): x(x) {}
    int getX() {return x;}
private:
    int x;
};

class A {};
class B {};

void print(Test t) {
    std::cout << t.getX() << std::endl;
}

void increment(int * x) {
    (*x) ++;
    std::cout << *x << std::endl;
}
int main() {

    Test t(10);
    print(t);

    A *a;
    B *b = reinterpret_cast<B*>(a);

    std::cout << a << std::endl;
    std::cout << b << std::endl;


    const int *x = new int(0);
    increment(const_cast<int *>(x));

    delete x;

    std::cout << typeid(a).name() << std::endl;
    std::cout << typeid(b).name() << std::endl;

    std::cout << typeid(x).name() << std::endl;

    try {
        throw true;
    }
    catch (int e) {
        std::cout << e << std::endl;
    } catch (char c) {
        std::cout << c << std::endl;
    }
    catch (...){
        std::cout << "default" << std::endl;
    }


    try {
        int *i = new int[1000000000000000];
    }
    catch (std::exception& e) {
        std::cout << e.what() << std::endl;
    }

    #define  T 10
    std::cout << T << std::endl;
    #undef T

    #ifdef T
    std::cout << T << std::endl;
    #endif

//    #line 10 "Other features"
//    std::cout << T << std::endl;

    #ifndef __cplusplus
    #error C++ Compiler exist
    #endif

    return 0;
}
