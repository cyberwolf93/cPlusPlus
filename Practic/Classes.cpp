#include <iostream>

struct StructTest {
    static int y;
private:
    int x;
};

class Rectangle {
    int width, height;
public:
    Rectangle();
    Rectangle(int w, int h) {
        width = w;
        height = h;
    }
    Rectangle(int w, int h, int y) : width(w) , height(h) {} // member initialization
    void set_values(int,int);
    int area() {
        return width * height;
    }

    Rectangle operator +(const Rectangle &rect) {
        Rectangle tmp;
        tmp.width = this->width + rect.width;
        tmp.height = this->height + rect.height;
        return tmp;
    }
};


void Rectangle::set_values(int w, int h) {
    width = w;
    height = h;
}
Rectangle::Rectangle() {

}


class Test {
    public:
    Rectangle *rect;
    Rectangle rect2;
    Test(): rect2(4, 5) {
        rect = new Rectangle(15,20);
    }

    Test(int w, int h): rect2(4, 5) {
        rect = new Rectangle(w,h);
    }


    // Copy constructor
    Test(const Test& copy) {
        rect = new Rectangle(15,20);
        std::cout << "copy" << std::endl;
    }

    // Move constructor
    Test(Test&& move) {
        std::cout << "move" << std::endl;
    }

    // Copy assignment
    Test& operator= (const Test& copy) {
        std::cout << "copy assignment" << std::endl;
        return *this;
    }

    // Move assignment
    Test& operator= (Test&& move) {
        std::cout << "move assignment" << std::endl;
        return *this;
    }



    void changeRectValues() const{

    }

    const Rectangle& getRect() {
        return *rect;
    }

    ~Test() {
        delete rect;
    }

};

class A {
private:
    int x;
protected:
    int y;
public:
    A() {
        x = 20;
        y = 10;
    }

    virtual void func() {
        std::cout << "func A" << std::endl;
    }

    virtual void pureFunc() = 0;
};


class B: public A {
public:
    void print() {
        std::cout << y << std::endl;
    }

    void func() {
        std::cout << "func B" << std::endl;
    }

    void pureFunc() override {
        std::cout << "pureFunc B" << std::endl;
    }
};


int main() {

    Rectangle r;
    Rectangle r2(10,20);
    r.set_values(2,4);
    std::cout << r.area() << " | " << r2.area() << std::endl;

    // all possible ways to construct a class object
    Rectangle rect (10, 20);
    //Rectangle rect1 = 10; //it should have only one property
    Rectangle rect2 {10, 20};
    Rectangle rect3 = {10, 20};


    Test t;
    std::cout << t.rect->area() << std::endl;

    Rectangle rect4 = r + r2;
    std::cout << rect4.area() << std::endl;

    const Test t1;
    t1.changeRectValues();
    std::cout << t1.rect->area() << std::endl;

    Rectangle rTest = t.getRect();
    rTest.set_values(10,50);
    std::cout << rTest.area() << std::endl;

    Test tCopy (t1);
    Test tMove = Test(2,3);
    tMove = Test(2,3);
    tCopy = tMove;
    std::cout << tMove.rect->area() << std::endl;

    // Inheritance
    B b;
    b.print();
    b.func();
    b.pureFunc();

    A* a = &b;
    a->func();
    a->pureFunc();

    //A a1; // Variable type 'A' is an abstract class

    return 0;
}
