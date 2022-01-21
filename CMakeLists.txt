cmake_minimum_required(VERSION 3.16)
project(5e-srd-db VERSION 0.1.0 LANGUAGES C CXX)

add_subdirectory(external)
target_compile_features(argparse INTERFACE cxx_std_17)

add_executable(srd5 src/main.cpp)
target_link_libraries(srd5 PRIVATE argparse)
target_link_libraries(srd5 PRIVATE sqlite3)
