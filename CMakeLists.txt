cmake_minimum_required(VERSION "3.22.0")

project(Calculator)

add_library(lib calculator.h calculator.cpp)

add_executable(calculator main.cpp)

target_link_libraries(calculator PRIVATE lib)