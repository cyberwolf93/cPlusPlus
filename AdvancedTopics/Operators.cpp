#include <iostream>
#include <string>

using std::cout;
using std::endl;
using std::string;

class Shape {
    int h, w;
public:
    Shape(int h = 1, int w = 1): h{h}, w{w} {}
    string str() {
         return "height: " + std::to_string(h) + " width: " + std::to_string(w);
    }

    Shape& operator +(const Shape& rhs);
    Shape& operator =(const Shape& rhs);
    operator string() {return this->str();};
};

Shape& Shape::operator+(const Shape &rhs) {
    Shape p {this->h + rhs.h, this->w + rhs.w};
    return p;
}

Shape& Shape::operator=(const Shape &rhs) {
    this->h = rhs.h;
    this->w = rhs.w;

    return *this;
}

void print(string s) {
    cout << s << endl;
}


class Num {
    int value{};
public:
    Num(int v): value{v}{}
    Num& operator ++(); // prefix ++
    Num operator ++(int); // postfix ++
    Num operator --();
    Num operator --(int);
    operator string() {return std::to_string(value);}
    int operator ()(int x) {
        return value + x;
    };
};

// prefix
Num& Num::operator++() {
    value += 1;
    return *this;
}
// post fix
Num Num::operator++(int) {

    Num tmp = *this;
    value += 1;
    return tmp;
}




int main() {
    Shape a {2};
    Shape b {3, 5};

    Shape c = a + b;
    Shape d = a;

    print(a);
    print(b);
    print(c);
    print(d);

    Num v{10};
    print(v++);
    print(v);
    print(++v);
    print(v);

    print(std::to_string(v(10)));

    return 0;
}
