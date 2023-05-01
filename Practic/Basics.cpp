#include <iostream>
#include <string>
#include <sstream>
#define PI  3.14

int main() {
    std::cout << "Hello, World!" << std::endl;

    int a;
    int p {5};
    int c (5);
    a = 10;
    int sum = a + p + c;

    std::cout << sum << std::endl;

    decltype(a) bar {11};
    std::cout << bar << std::endl;

    auto v {10};
    auto _v = 10;

    int unsignedLiteral = 100u;
    double exponintial = 1.2e-2;

    std::cout << unsignedLiteral << std::endl;
    std::cout << exponintial << std::endl;
    std::cout << v << " " << _v << std::endl;

    // Strings
    std::string t = "This is a string";
    std::string _t  {"This is another string"};
    std::cout << t << std::endl;
    std::cout << _t << std::endl;

    std::string  str = "This is the first line \
This is the second line ";
    std::cout << str << std::endl;

    // Raw string
    std::string rawStr = R"(string with \slash)";
    std::cout << rawStr << std::endl;

    const double pi = 3.1415;
    //pi += 1; // does not work
    std::cout << pi << std::endl;

    // #define variable
    std::cout << PI << std::endl;

    int x = 10;
    int x1 = x++;
    int x2 = ++x;
    std::cout << x1 << std::endl;
    std::cout << x2 << std::endl;
    std::cout << x << std::endl;

    char s = '1';
    int strToInt = (int) s;

    std::cout << strToInt << std::endl;

    // Inputs
    int i;
//    std::cin >> i;

    std::cout << i << std::endl;


    std::string mystr;

    getline(std::cin, mystr);
    std::cout << mystr << std::endl;


    std::stringstream(mystr) >> i;
    std::cout << i << std::endl;


    return 0;
}


