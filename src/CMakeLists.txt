cmake_minimum_required(VERSION 3.10)
project(flutter_smb_library VERSION 0.0.1 LANGUAGES C)

# Caminho para a biblioteca dinâmica do GoLang
set(GO_LIBRARY_PATH "${CMAKE_SOURCE_DIR}/path/to/your/go/library")

# Adiciona a biblioteca flutter_smb
add_library(flutter_smb SHARED
  "flutter_smb.c"
)

# Define propriedades para flutter_smb
set_target_properties(flutter_smb PROPERTIES
  PUBLIC_HEADER flutter_smb.h
  OUTPUT_NAME "flutter_smb"
)

# Adiciona a biblioteca do GoLang
add_library(go_lib SHARED IMPORTED)
set_target_properties(go_lib PROPERTIES
  IMPORTED_LOCATION "${GO_LIBRARY_PATH}/nome_da_biblioteca.so" # Exemplo para Linux
)

# Linka a biblioteca do GoLang com flutter_smb
target_link_libraries(flutter_smb PRIVATE go_lib)

target_compile_definitions(flutter_smb PUBLIC DART_SHARED_LIB)
