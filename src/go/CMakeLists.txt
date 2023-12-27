add_custom_command(
    OUTPUT "${GO_SOURCE_DIR}/${GO_LIBRARY_OUTPUT}"
    COMMAND go build -o ${GO_LIBRARY_OUTPUT} -buildmode=c-shared
    COMMAND echo "Listagem de Arquivos Após Build:" && ls -la
    WORKING_DIRECTORY ${GO_SOURCE_DIR}
    DEPENDS "${GO_SOURCE_DIR}/flutter_smb.go"
    COMMENT "Building GoLang code"
)

add_custom_target(
    go_lib ALL
    DEPENDS "${GO_SOURCE_DIR}/${GO_LIBRARY_OUTPUT}"
)
