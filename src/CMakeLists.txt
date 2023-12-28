cmake_minimum_required(VERSION 3.10)
project(flutter_smb_library VERSION 0.0.1 LANGUAGES C)

set(GO_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/go")
set(GO_LIBRARY_OUTPUT "libgo")

set(GO_LIBRARY_EXT "a")


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

# Adiciona e configura a biblioteca estática do GoLang
add_library(go_lib_imported STATIC IMPORTED)
set_target_properties(go_lib_imported PROPERTIES
  IMPORTED_LOCATION "${GO_SOURCE_DIR}/${GO_LIBRARY_OUTPUT}.${GO_LIBRARY_EXT}"
)

target_link_libraries(flutter_smb PRIVATE go_lib_imported)

add_dependencies(flutter_smb go_lib)
