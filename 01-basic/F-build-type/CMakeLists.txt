# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set a default build type if none was specified
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message("Setting build type to 'RelWithDebInfo' as none was specified.")
  # FORCE：覆盖之前的变量名
  set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  # 不写也可以的...
  # Debug：关闭代码优化
  # Release：对程序做最大优化
  # MinSizeRel：偏重于最小的执行文件体积
  # RelWithDebInfo：兼顾速度和调试信息
  # set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
  #   "MinSizeRel" "RelWithDebInfo")
endif()

# Set the project name
project (build_type)

# Add an executable
add_executable(cmake_examples_build_type main.cpp)
