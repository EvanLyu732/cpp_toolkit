#include <chrono>
#include <cpp_toolkits/log/log.h>
#include <thread>
#include <string>
using namespace ud::tools::log;

int main() {
  int x = 2;
  std::string name = "test";

  while (true) {
    LOG_INFO("x is {}", x);
    LOG_INFO("name is {}", name);
    LOG_INFO("this is info msg");
    std::this_thread::sleep_for(std::chrono::milliseconds(50));
  }

  return 0;
}
