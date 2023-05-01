#include <string>
#ifndef BOOSTTESTEXAMPLE_MATH_H
#define BOOSTTESTEXAMPLE_MATH_H

class CustomMath {
private:
    double x,y;
public:
    CustomMath();
    void setX(double x);
    void setY(double y);
    double add();
    double sub();
    double mult();
    std::string desc();
};

#endif //BOOSTTESTEXAMPLE_MATH_H
