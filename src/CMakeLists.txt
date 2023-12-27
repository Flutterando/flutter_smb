cmake_minimum_required(VERSION 3.10)
project(flutter_smb_library VERSION 0.0.1 LANGUAGES C)

# Define o diretório onde seu código Go está localizado
set(GO_SOURCE_DIR "${CMAKE_SOURCE_DIR}")

# Nome do arquivo de saída da biblioteca compartilhada do Go (ajuste para cada plataforma se necessário)
set(GO_LIBRARY_OUTPUT "golib.dylib")

# Comando para construir o código GoLang
add_custom_command(
    OUTPUT "${GO_SOURCE_DIR}/${GO_LIBRARY_OUTPUT}"
    COMMAND go build -o ${GO_LIBRARY_OUTPUT} -buildmode=c-shared
    WORKING_DIRECTORY ${GO_SOURCE_DIR}
    DEPENDS "${GO_SOURCE_DIR}/flutter_smb.go"
    COMMENT "Building GoLang code"
)

# Adiciona a biblioteca flutter_smb
add_library(flutter_smb SHARED
  "flutter_smb.c"
)

# Adiciona e configura a biblioteca compartilhada do GoLang
add_library(go_lib SHARED IMPORTED)
set_target_properties(go_lib PROPERTIES
  IMPORTED_LOCATION "${GO_SOURCE_DIR}/${GO_LIBRARY_OUTPUT}"
)

# Linka a biblioteca do GoLang com flutter_smb
target_link_libraries(flutter_smb PRIVATE go_lib)

set_target_properties(flutter_smb PROPERTIES
  PUBLIC_HEADER flutter_smb.h
  OUTPUT_NAME "flutter_smb"
)

target_compile_definitions(flutter_smb PUBLIC DART_SHARED_LIB)
