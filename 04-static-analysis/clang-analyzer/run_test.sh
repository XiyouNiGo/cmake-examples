#!/bin/bash
# clang静态分析器
mkdir -p build \
	&& cd build \
	&& scan-build-3.6 -o scanbuildout cmake .. \
	&& scan-build-3.6 -o scanbuildout make
