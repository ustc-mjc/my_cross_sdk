cmake_minimum_required(VERSION 3.10.2)
project("cross")
file(GLOB IOS_SRC ${PROJECT_ROOT_DIR}/sdk/ios/Classes)

add_library(${PROJECT_NAME} ${LIBRARY_TYPE} ${IOS_SRC})

target_link_libraries(${PROJECT_NAME} PUBLIC url_signature)
target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_ROOT_DIR}/sdk/ios/Classes)

