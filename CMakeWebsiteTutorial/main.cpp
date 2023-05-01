#include <iostream>
#include "CMakeTutorialConfig.h"
#include <cmath>
#ifdef USE_MYMATH
    #include "MathFunctions.h"
#endif

using std::cout;
using std::endl;

int main(int arg, char *arc []) {

    
    cout << "Hello there" << endl;
    cout << CMakeTutorial_VERSION_MAJOR << " " << CMakeTutorial_VERSION_MINOR << endl;

    const double value = std::stod(arc[1]);
    
    #ifdef USE_MYMATH
        cout <<  "value is " << mysqrt(value) << endl;
    #else
        cout << "value is " << sqrt(value) << endl;
    #endif


    return 0;
}