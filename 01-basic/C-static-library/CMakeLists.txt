cmake_minimum_required(VERSION 3.5)

project(hello_library)

############################################################
# Create a library
############################################################

#Generate the static library from the library sources
# 静态库
add_library(hello_library STATIC 
    src/Hello.cpp
)

# PRIVATE“目录被添加到这个目标的包含目录
# INTERFACE：该目录被添加到链接该库的任何目标的包含目录中。
# PUBLIC：包含在此库以及链接此库的任何目标中。
# include_directory会在所有编译单元加上-I，方便但笨重，性能较低
# target_include_directories能有效防止冲突
target_include_directories(hello_library
    PUBLIC 
        ${PROJECT_SOURCE_DIR}/include
)

############################################################
# Create an executable
############################################################

# Add an executable with the above sources
add_executable(hello_binary 
    src/main.cpp
)

# link the new hello_library target with the hello_binary target
target_link_libraries(hello_binary
    PRIVATE 
        hello_library
)
