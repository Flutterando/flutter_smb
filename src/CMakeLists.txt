cmake_minimum_required(VERSION 3.10)

project(libflutter_smb VERSION 0.0.1)

set(GO_SOURCE_FILE "${CMAKE_CURRENT_SOURCE_DIR}/cmd/shared/shared.go")

if (CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(GO_LIBRARY_OUTPUT "${CMAKE_BINARY_DIR}/${PROJECT_NAME}.dll" PARENT_SCOPE)
    set(GO_LIBRARY_OUTPUT "${CMAKE_BINARY_DIR}/${PROJECT_NAME}.dll")
elseif (CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(GO_LIBRARY_OUTPUT "${CMAKE_BINARY_DIR}/${PROJECT_NAME}.so" PARENT_SCOPE)
    set(GO_LIBRARY_OUTPUT "${CMAKE_BINARY_DIR}/${PROJECT_NAME}.so")
else()
    message(FATAL_ERROR "Platform not supported")
endif()

add_custom_command(
  OUTPUT ${GO_LIBRARY_OUTPUT}
  COMMAND go build -buildmode=c-shared -o ${GO_LIBRARY_OUTPUT} ${GO_SOURCE_FILE}
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  DEPENDS ${GO_SOURCE_FILE}
  COMMENT "Building Go Library"
)

add_custom_target(
  go_library ALL
  DEPENDS ${GO_LIBRARY_OUTPUT}
)
