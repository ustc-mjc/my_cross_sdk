#ifndef STRING_HPP
#define STRING_HPP

#include <string>
#include <iostream>

#ifdef ANDROID_PLATFORM
namespace std {
    template<typename T>
    std::string to_string(const T& n) {
        std::ostringstream stm;
        stm << n;
        return stm.str();
    }
}
#endif 

#endif