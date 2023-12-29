cmake_minimum_required(VERSION 3.14)

set(PROJECT_NAME "flutter_smb")
project(${PROJECT_NAME} LANGUAGES CXX)

# Localização do arquivo fonte Go e da biblioteca compilada
set(GO_SOURCE_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../src")
set(GO_SOURCE_FILE "${GO_SOURCE_DIRECTORY}/cmd/shared/shared.go")
set(GO_LIBRARY_OUTPUT "${CMAKE_CURRENT_SOURCE_DIR}/lib${PROJECT_NAME}.dll")

# Comando para construir a biblioteca Go
add_custom_command(
  OUTPUT ${GO_LIBRARY_OUTPUT}
  COMMAND go build -buildmode=c-shared -o  ${GO_LIBRARY_OUTPUT} ${GO_SOURCE_FILE} 
  WORKING_DIRECTORY ${GO_SOURCE_DIRECTORY}
  DEPENDS ${GO_SOURCE_FILE}
  COMMENT "Building Go Library"
)

add_custom_target(
  go_library ALL
  DEPENDS ${GO_LIBRARY_OUTPUT}
)

set(flutter_smb_bundled_libraries
  ${GO_LIBRARY_OUTPUT} 
  PARENT_SCOPE
)
