cmake_minimum_required(VERSION 3.5)

# Set the project name
project (third_party_include)


# find a boost install with the libraries filesystem and system
# 查找结果存放于变量<PackageName>_FOUND中
find_package(Boost 1.46.1 REQUIRED COMPONENTS filesystem system)

# check if boost was found
if(Boost_FOUND)
    message ("boost found")
else()
    message (FATAL_ERROR "Cannot find Boost")
endif()

# Add an executable
add_executable(third_party_include main.cpp)

# link against the boost libraries
target_link_libraries( third_party_include
    PRIVATE
        # 类似ALIAS（系统自动生成，用于引入特定模块）
        Boost::filesystem
        # 也可以用非别名
        # ${Boost_FILESYSTEM_LIBRARY} 
)
