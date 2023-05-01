#include <iostream>
#include <concepts>

using std::cout;
using std::endl;

template <typename T>
requires std::integral<T> || std::floating_point<T>
T arg(const T& x) {
    return x + 10;
}


// Create new concept
template<typename U>
concept Numeric = std::integral<U> || std::floating_point<U>;


template<typename U>
requires Numeric<U>
U arg2(const U& x) {
    return x + 1;
}

template<Numeric B> // template and requires in line
B arg3(const B& x) {
    return x + 1;
}

enum Test: int {
    a = 1,
    b,
    c
};



int main() {

    auto x = 10.2;
    cout << arg(x) << endl;

    Test en = Test::a;
    //cout << arg(en) << endl;// does not work

    return 0;
}