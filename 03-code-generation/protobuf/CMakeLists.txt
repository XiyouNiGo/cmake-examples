cmake_minimum_required(VERSION 3.5)

# Set the project name
project (protobuf_example)

# find the protobuf compiler and libraries
find_package(Protobuf REQUIRED)

# check if protobuf was found
if(PROTOBUF_FOUND)
    message ("protobuf found")
else()
    message (FATAL_ERROR "Cannot find Protobuf")
endif()

# Generate the .h and .cxx files
# 自动生成protobuf-cpp文件
PROTOBUF_GENERATE_CPP(PROTO_SRCS PROTO_HDRS AddressBook.proto)

# Print path to generated files
message ("PROTO_SRCS = ${PROTO_SRCS}")
message ("PROTO_HDRS = ${PROTO_HDRS}")
message ("PROTOBUF_INCLUDE_DIRS = ${PROTOBUF_INCLUDE_DIRS}")

# Add an executable
add_executable(protobuf_example
    main.cpp
    ${PROTO_SRCS})
    # add_executable一个头文件本来就不太合理
    # ${PROTO_HDRS})

target_include_directories(protobuf_example
    PUBLIC
    # 源文件没有引用到，这句实际没用
    # ${PROTOBUF_INCLUDE_DIRS}
    # CMAKE_CURRENT_BINARY_DIR居然不自动包含
    # 不太了解为什么这句也要加上，不加的会报AddressBook.pb.h找不到
    # 但是PROTO_HDRS打印出来是一个绝对路径
    # 实际上不需要加的是PROTO_HDRS
    ${CMAKE_CURRENT_BINARY_DIR}
)

# link the exe against the libraries
target_link_libraries(protobuf_example
    PUBLIC
    # protobuf使用到动态库
    ${PROTOBUF_LIBRARIES}
)
