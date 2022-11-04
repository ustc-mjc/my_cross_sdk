# Disable in-source build to prevent source tree corruption
if("x${CMAKE_SOURCE_DIR}" STREQUAL "x${CMAKE_BINARY_DIR}")
  message(FATAL_ERROR "FATAL: In-source build is not allowed.
		You should create a separate directory for build files.")
endif()

cmake_minimum_required(VERSION 3.10.2)
project(cpp-android-ios-example)
set(CMAKE_CXX_STANDARD 17)
# Set CMAKE_BUILD_TYPE
set(CMAKE_CONFIGURATION_TYPES
    "Debug;Release"
    CACHE STRING "Configs" FORCE)
if(NOT DEFINED CMAKE_BUILD_TYPE)
  message(
    STATUS
      "'Debug' build type is used by default. Use CMAKE_BUILD_TYPE to specify build type (Release or Debug)"
  )
  set(CMAKE_BUILD_TYPE
      "Debug"
      CACHE STRING "Choose the type of build")
endif()

set(PROJECT_ROOT_DIR ${CMAKE_SOURCE_DIR})
set(PROJECT_CMAKE_DIR ${PROJECT_ROOT_DIR}/cmake)

option(BUILD_TEST "build unittest or not" OFF)
option(GEN_ANDROID "generate android gradle project or not" OFF)
option(BUILD_ANDROID "build android sdk or not" OFF)
option(BUILD_IOS "build ios sdk or not" OFF)
option(BUILD_STATIC_LIB "build static lib or not" OFF)

if(BUILD_STATIC_LIB)
  set(LIBRARY_TYPE "STATIC")
else()
  set(LIBRARY_TYPE "SHARED")
endif()

add_subdirectory(third_party/hash)
add_subdirectory(third_party/cxxurl)
add_subdirectory(src/url_signature)

if(BUILD_ANDROID)
  add_subdirectory(sdk/android/src/main/cpp)
endif()
if(BUILD_IOS)
  add_subdirectory(sdk/ios)
endif()
if(GEN_ANDROID)
  include(${PROJECT_CMAKE_DIR}/android/gen_android.cmake)
endif()
if(BUILD_TEST)
  add_subdirectory(test/gtest)
  add_subdirectory(test)
endif()
