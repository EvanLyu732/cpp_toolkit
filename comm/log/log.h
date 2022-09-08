//
// Created by ubuntu on 22-9-8.
//

#ifndef CPP_TOOLKITS_LOG_H
#define CPP_TOOLKITS_LOG_H

#include <iostream>
#include <utility>

namespace toolkits {
namespace log {

template <typename... T>
void print(T &&... args) {
  (std::cout << ... << std::forward<T>(args));
}

}  // namespace log
}  // namespace toolkits

#endif  // CPP_TOOLKITS_LOG_H
