cmake_minimum_required(VERSION 3.10)
project(flutter_smb_library VERSION 0.0.1 LANGUAGES C)

set(GO_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/go")
set(GO_LIBRARY_OUTPUT "golib.dylib")

add_subdirectory(go)

add_library(flutter_smb SHARED
  "flutter_smb.c"
)

target_include_directories(flutter_smb PRIVATE "${GO_SOURCE_DIR}")

set_target_properties(flutter_smb PROPERTIES
  PUBLIC_HEADER flutter_smb.h
  OUTPUT_NAME "flutter_smb"
)
target_compile_definitions(flutter_smb PUBLIC DART_SHARED_LIB)

target_link_libraries(flutter_smb PRIVATE go_lib)

add_dependencies(flutter_smb go_lib)
