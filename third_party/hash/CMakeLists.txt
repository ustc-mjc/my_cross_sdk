cmake_minimum_required(VERSION 3.10.2)
project(hash)
aux_source_directory(./src source)
add_library(${PROJECT_NAME} ${source})
target_include_directories(${PROJECT_NAME} 
    PUBLIC ${PROJECT_SOURCE_DIR}/include
    PRIVATE .)