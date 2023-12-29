# Localização do arquivo fonte Go e da biblioteca compilada
set(GO_SOURCE_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../src")
set(GO_SOURCE_FILE "${GO_SOURCE_DIRECTORY}/cmd/shared/shared.go")

# Comando para construir a biblioteca Go
add_custom_command(
  OUTPUT ${GO_LIBRARY_OUTPUT}
  COMMAND go build -buildmode=c-shared -o ${GO_LIBRARY_OUTPUT} ${GO_SOURCE_FILE}
  WORKING_DIRECTORY ${GO_SOURCE_DIRECTORY}
  DEPENDS ${GO_SOURCE_FILE}
  COMMENT "Building Go Library"
)

add_custom_target(
  go_library ALL
  DEPENDS ${GO_LIBRARY_OUTPUT}
)
