#include <iostream>
#include <array>

void printArr(int arr [],int size);
void printPointedFunc(int arr[], int size, void (*callback)(int[], int));

struct Product {
    int id;
    std::string name;

    int func(int x) {
        std::cout << "yes" << std::endl;
    }
};

union Union {
    int id;
    long name;
};



namespace en {
    enum Type {
        one = 1,
        two,
        three,
        four
    };
}

enum struct StructType { // char, int or short
    one = 'l',
    two ,
    three ,
    four

};

int main() {

    int arr [5] = {1,2,3};

    arr[3] = 4;

    for(int i: arr) {
        std::cout << i << std::endl;
    }
    printArr(arr, 5);

    // array lib
    std::array<int, 3> arr1 {1,2,3};

    int size = arr1.size();
    for (int i=0; i < size; i++) {
        std::cout << arr1[i] << std::endl;
    }

    // char array
    char c[5] = {'a','b', '\0'};
    std::cout << c[0] << std::endl;

    // c_string
    char cString[] = "abcde";
    std::string str =  cString;
    std::cout << str.c_str() << std::endl;


    // Pointers
    int a = 10;
    int *aDress = &a;
    std::cout << *aDress << std::endl;

    int arr2[] = {1,2,3,4};
    int *arrPointer = arr2;
    std::cout <<  *arrPointer << std::endl;
    std::cout <<  *(arrPointer+1) << std::endl;


    int x = 10;
    int y = 20;

    int *p1 = &x;
    int *p2 = (p1 + 1);
    *p2 = y ;

    std::cout << *p1++ << std::endl;
    std::cout << *p2 << std::endl;



    // constant pointers
    const int * const pointer = &x;
    // non-constant pointer holds a constant value
    const int * pointer1 = &x;
    std::cout << pointer << std::endl;
    pointer1++;
    pointer1 = &y;
    std::cout << pointer1 << std::endl;

    // pointer to pointer
    int *p = &x;
    int **pp;
    pp = &p;

    std::cout << *pp << std::endl;

    int *nullpointer = nullptr;

//    std::cout << *nullpointer << std::endl;

    // pointed func
    int array[] = {10,20,30,40};
    printPointedFunc(array, 4, printArr);


    // Dynamic allocation
    int *dp = new (std::nothrow) int [5]; // 1_000_000_000_000_000
    if (dp != nullptr) {
        printArr(dp, 5);
    } else {
        std::cout << "Error: memory allocation" << std::endl;
    }


    delete[] dp;


    // Data structures
    Product prod;
    prod.id = 1;
    prod.name = "Product 1";

    Product *prod2 = &prod;

    prod2->name = "Product 2";

    std::cout << prod.name << std::endl;
    prod2->func(10);

    Product product[5];
    Product *prodPointer = new (std::nothrow) Product [5];

    std::cout << prodPointer << " || " << prodPointer+1 << std::endl;
    std::cout << sizeof(*prodPointer) << std::endl;


    delete[] prodPointer;

    // Union
    Union un;
    un.id = 1;
    un.name = 10;

    std::cout << un.id << " | " << un.name << std::endl;

    // enumeration [enums]
    int one = 1;

    en::Type s;
    s = en::Type::one;

    if (s == en::Type::one) {
        std::cout << s << std::endl;
    }

    // class and struct enumeration [enums]
    StructType type;
    type = StructType::one;

    if (type == StructType::one) {
        char typeValue = (char)type;
        std::cout << typeValue << std::endl;
    }


     return 0;
}

void printArr(int arr[], int size) {
    for (int i = 0; i < size; i++) {
        std::cout << arr[i] << std::endl;
    }
}

void printPointedFunc(int arr[], int size, void (*callback)(int[], int)) {
    (*callback)(arr, size);
}