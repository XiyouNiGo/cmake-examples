cmake_minimum_required (VERSION 3.5)

# 当使用 project()命令，CMake 会自动创建许多变量
# 通过这些变量我们能访问子项目的各种Dir
project(subprojects)

# 把头文件放到include/projectname/下是一个好习惯，
# 这意味着它们会被安装到/usr/local/include/projectname下
# 有效防止命名冲突
# ├── sublibrary1
# │   ├── CMakeLists.txt
# │   ├── include
# │   │   └── sublib1
# │   │       └── sublib1.h
# │   └── src
# │       └── sublib1.cpp
# Add sub directories
# 直接生成在build目录，因此是全局可见的
add_subdirectory(sublibrary1)
add_subdirectory(sublibrary2)
add_subdirectory(subbinary)
