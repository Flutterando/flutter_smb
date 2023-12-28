cmake_minimum_required(VERSION 3.10)

set(PROJECT_NAME "flutter_smb")
project(${PROJECT_NAME} LANGUAGES CXX)

if(CMAKE_SYSTEM_PROCESSOR MATCHES "amd64|AMD64|x86_64|x86|x64")
  # Arquitetura x86/x64
  set(DYNAMIC_LIBRARY "${CMAKE_CURRENT_SOURCE_DIR}/x64/lib${PROJECT_NAME}.so")
elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "arm64|ARM64|aarch64|AARCH64")
  # Arquitetura ARM 64 bits
  set(DYNAMIC_LIBRARY "${CMAKE_CURRENT_SOURCE_DIR}/arm64/lib${PROJECT_NAME}.so")
endif()

set(flutter_smb_bundled_libraries
  ${DYNAMIC_LIBRARY}
  PARENT_SCOPE
)
