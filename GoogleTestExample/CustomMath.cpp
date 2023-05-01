#include "CustomMath.h"

CustomMath::CustomMath() {};

void CustomMath::setX(double x) {
    this->x = x;
}

void CustomMath::setY(double y) {
    this->y = y;
}

double CustomMath::add() {
    return x + y;
}

double CustomMath::sub() {
    return x - y;
}

double CustomMath::mult() {
    return x*y;
}

std::string CustomMath::desc() {
    return "This is the desc of " + std::to_string(int(x)) + " and " + std::to_string(int(y));
}

