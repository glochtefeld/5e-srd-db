cmake_minimum_required(VERSION 3.16)
project(sqlite3 VERSION 3.37.2 LANGUAGES C)

add_library(sqlite3 STATIC
    sqlite3.c
    sqlite3.h
)
