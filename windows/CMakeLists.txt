cmake_minimum_required(VERSION 3.14)

set(PROJECT_NAME "flutter_smb")
project(${PROJECT_NAME} LANGUAGES CXX)

set(DYNAMIC_LIBRARY "${CMAKE_CURRENT_SOURCE_DIR}/x64/lib${PROJECT_NAME}.dll")

set(flutter_smb_bundled_libraries
  ${DYNAMIC_LIBRARY}
  PARENT_SCOPE
)