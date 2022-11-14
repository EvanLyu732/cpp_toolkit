/**
 * @author EvanLyu732
 * @brief This file wrapped basic std time module for easy to use api.
 */

#pragma once

#include <chrono>
#include <cstdint>
#include <iostream>

namespace ud::tools::times {

/**
 * @brief Get current timestamp
 * @return current unix timestamp
 */
uint64_t timeSinceEpochMillisec() {
  using namespace std::chrono;
  return duration_cast<milliseconds>(system_clock::now().time_since_epoch())
      .count();
}
}  // namespace ud::tools::times
