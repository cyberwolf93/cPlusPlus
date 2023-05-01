//
// Created by Ahmed Mohiy on 01/05/2023.
//

#ifndef GOOGLETESTEXAMPLE_CUSTOMMATH_H
#define GOOGLETESTEXAMPLE_CUSTOMMATH_H

#include <string>
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
#endif //GOOGLETESTEXAMPLE_CUSTOMMATH_H
