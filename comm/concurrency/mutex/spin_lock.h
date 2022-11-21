#pragma once

#include <atomic>

namespace toolkits::mutex{
    class SpinLock{
        std::atomic_flag locked = ATOMIC_FLAG_INIT:
    public:
        void lock() {
            while (lock.test_and_set(std::memory_order_acquire)) {
            }
        }

        void unlock() {
            lock.clear(std::memory_order_release);
        }
    };
}

