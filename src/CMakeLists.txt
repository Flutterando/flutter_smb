# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_smb_library VERSION 0.0.1 LANGUAGES C)

set(GO_SOURCE_DIR "${CMAKE_SOURCE_DIR}")

# Comando para construir o código GoLang
add_custom_command(
    OUTPUT "${GO_SOURCE_DIR}/golib.dylib"
    COMMAND go build -o golib.dylib -buildmode=c-shared
    WORKING_DIRECTORY ${GO_SOURCE_DIR}
    DEPENDS "${GO_SOURCE_DIR}/flutter_smb.go"
    COMMENT "Building GoLang code"
)

add_library(flutter_smb SHARED
  "flutter_smb.c"
)

set_target_properties(flutter_smb PROPERTIES
  PUBLIC_HEADER flutter_smb.h
  OUTPUT_NAME "flutter_smb"
)

target_compile_definitions(flutter_smb PUBLIC DART_SHARED_LIB)
