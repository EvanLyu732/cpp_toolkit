#pragma once

namespace ud::tools::traits {

// Define singleton traits for this class; Using CRTF for trigger this triats.
template <class T>
class Singleton {
 protected:
  Singleton() = default;

 public:
  Singleton(const Singleton&) = delete;
  Singleton(const Singleton&&) = delete;
  Singleton& operator=(const Singleton&) = delete;

  static T& instance() {
    static T self;
    return self;
  }
};

}  // namespace ud::tools::traits
