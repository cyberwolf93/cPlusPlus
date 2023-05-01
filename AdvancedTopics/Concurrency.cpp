#include <iostream>
#include <chrono>
#include <thread>
#include <mutex>

using std::chrono::steady_clock;
using std::chrono::duration;
using std::this_thread::sleep_for;
using std::this_thread::sleep_until;
using std::cout, std::endl;

using std::thread;
std::mutex lock{};

using namespace std::chrono_literals;

void print(int n) {
    for (int i=0;i < 10; i++) {
        sleep_for(100ms);
        std::lock_guard<std::mutex> l {lock};
        cout << "t: " << n << " | i: " << i << endl;
    }
}

int globalCount = 10;
void count() {
    std::lock_guard<std::mutex> k {lock};
    cout << globalCount << endl;
    globalCount ++;
}

int main() {

    // sleeping
    cout << "lets start ..." << endl;
    auto t1 = steady_clock::now();
    cout << "sleep for 2.5s" << endl;
    sleep_for(2s + 500ms);

    cout << "sleep until 3 seconds from now" << endl;
    sleep_until(steady_clock::now() + 3s);

    duration<double> d = steady_clock::now() - t1;
    cout << "total sleeping: " << d.count() << endl;

    // Threads
    thread th1(print, 1);
    thread th2(print, 2);

    th1.detach();
    th2.detach(); // detach works async with main so main does not wait
//    th2.join(); // join works sync with main so main have to wait for it

    cout << "main after thread" << endl;
    sleep_for(3s);

    thread c(count);
    thread c1(count);

    c.join();
    c1.join();

    cout << globalCount << endl;

    return 0;
}
