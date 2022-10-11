//
// Created by ubuntu on 22-9-16.
//

#pragma once

#include <iostream>
#include <utility>

namespace toolkits::log {

template <typename... T>
void print(T &&... args) {
  (std::cout << ... << std::forward<T>(args));
}

}  // namespace toolkits::log
