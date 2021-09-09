#!/bin/bash
# Travis-ci cmake version doesn't support ninja, so first check if it's supported
ninja_supported=`cmake --help | grep Ninja`

if [ -z $ninja_supported ]; then
    echo "Ninja not supported"
    exit
fi

# 使用ninja构建（而不是make）
mkdir -p build.ninja && cd build.ninja && \
    cmake .. -G Ninja && ninja
