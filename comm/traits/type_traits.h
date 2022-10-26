//
// Created by ubuntu on 22-9-8.
//

#ifndef CPP_TOOLKITS_TYPE_TRAITS_H
#define CPP_TOOLKITS_TYPE_TRAITS_H

#ifdef @FOUND_BOOST @
#include <boost/core/demangle.hpp>
#endif

#include <string>

namespace ud::tools::traits {
#ifdef @FOUND_BOOST @
    template<typename T>
    decltype(auto) getType(T t) {
        return ::boost::core::demangle(typeid(t).name());
    }
#endif

}// namespace toolkits::traits
}// namespace toolkits

#endif// CPP_TOOLKITS_TYPE_TRAITS_H
