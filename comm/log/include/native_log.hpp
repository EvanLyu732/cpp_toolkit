/**
 * @author EvanLyu732
 * @brief This file is a collection of wrapped function using native std
 * library.
 */

#pragma once

#include <iostream>
#include <utility>

namespace ud::tools::log {

    /**
 * Varidic template based cout function template
 * @tparam T basic type
 * @param args arguments for output
 */
    template<typename... T>
    void print(T &&...args) {
        (std::cout << ... << std::forward<T>(args));
        (std::cout << std::endl);
    }

}// namespace ud::tools::log
