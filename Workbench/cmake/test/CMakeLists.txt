# cmake version
cmake_minimum_required(VERSION 2.6)
project(demo_a)
set(all_code_list main.c common.h select_sort.c select_sort.h)
message(STATUS "***********this is binary_dir" ${PROJECT_BINARY_DIR})
message(STATUS "***********this is source_dir" ${PROJECT_SOURCE_DIR})
add_executable(main ${all_code_list})
set(EXECUTABLE_OUTPUT_PATH "${PROJECT_BINARY_DIR}/bin")
