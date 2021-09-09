# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.1)

# Set the project name
project (hello_cpp11)

# set the C++ standard to C++ 11
# CMAKE_CXX_STANDARD回落到最接近的适当标准而不会失败
set(CMAKE_CXX_STANDARD 11)

# Add an executable
add_executable(hello_cpp11 main.cpp)
