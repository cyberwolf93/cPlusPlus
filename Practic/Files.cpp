#include <iostream>
#include <fstream>
#include <string>

int main() {

    std::fstream file;

    file.open("a.txt", std::ios::app);
    if (file.is_open()) {
//        file << "second text to add\n";
        std::cout << "file opened" <<std::endl;
        file.close();

        file.open("a.txt", std::ios::in);
        file.seekg(13);

        std::string line;
//        while(getline(file, line)) {
//            std::cout << file.tellg() << std::endl;
//            std::cout << line << std::endl;
//        }

        file.seekg(-200, std::ios::end);
        std::cout << file.tellg() << " | " << file.tellp() << std::endl;

        std::cout << file.eof() << std::endl;


        file.close();


        unsigned int a = 1;
        unsigned char b = 'l';
        unsigned int c =  ~a  ;
        unsigned char b1 =  ~b  ;
        std::cout << c << std::endl ;
        std::cout << int(b) << std::endl ;
        std::cout << b1 << std::endl ;
    }




    return 0;
}