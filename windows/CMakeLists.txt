cmake_minimum_required(VERSION 3.10)
set(PROJECT_NAME "flutter_smb")
project(${PROJECT_NAME} LANGUAGES CXX)

add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/../src" "${CMAKE_CURRENT_BINARY_DIR}/shared")

set(flutter_smb_bundled_libraries
  "${GO_LIBRARY_OUTPUT}"
  PARENT_SCOPE
)
