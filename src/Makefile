ANDROID_OUT=../android/src/main/jniLibs
ANDROID_SDK=$(HOME)/Library/Android/sdk
NDK_BIN=$(ANDROID_SDK)/ndk/26.1.10909125/toolchains/llvm/prebuilt/darwin-x86_64/bin
LIB_NAME=libgo
SHARED_LIB_NAME=libflutter_smb

# Verifica o sistema operacional atual
ifeq ($(OS),Windows_NT)
	# Comando para apagar pasta no Windows
	RM = rmdir /s /q
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		# Comando para apagar pasta no MacOS
		RM = rm -rf
	else
		# Comando padrão para apagar pasta em sistemas Unix-like (Linux, etc.)
		RM = rm -rf
	endif
endif

# Verifica o sistema operacional atual
ifeq ($(OS),Windows_NT)
	# Comando para copiar arquivo no Windows
	CP = copy
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		# Comando para copiar arquivo no MacOS
		CP = cp
	else
		# Comando padrão para copiar arquivo em sistemas Unix-like (Linux, etc.)
		CP = cp
	endif
endif

android-armv7a:
	CGO_ENABLED=1 \
	GOOS=android \
	GOARCH=arm \
	GOARM=7 \
	CC=$(NDK_BIN)/armv7a-linux-androideabi21-clang \
	go build -buildmode=c-shared -o $(ANDROID_OUT)/armeabi-v7a/${SHARED_LIB_NAME}.so cmd/shared/shared.go

android-arm64:
	CGO_ENABLED=1 \
	GOOS=android \
	GOARCH=arm64 \
	CC=$(NDK_BIN)/aarch64-linux-android21-clang \
	go build -buildmode=c-shared -o $(ANDROID_OUT)/arm64-v8a/${SHARED_LIB_NAME}.so cmd/shared/shared.go

android-x86:
	CGO_ENABLED=1 \
	GOOS=android \
	GOARCH=386 \
	CC=$(NDK_BIN)/i686-linux-android21-clang \
	go build -buildmode=c-shared -o $(ANDROID_OUT)/x86/${SHARED_LIB_NAME}.so cmd/shared/shared.go

android-x86_64:
	CGO_ENABLED=1 \
	GOOS=android \
	GOARCH=amd64 \
	CC=$(NDK_BIN)/x86_64-linux-android21-clang \
	go build -buildmode=c-shared -o $(ANDROID_OUT)/x86_64/${SHARED_LIB_NAME}.so cmd/shared/shared.go

android: android-armv7a android-arm64 android-x86 android-x86_64

macos-x86_64:
	CGO_ENABLED=1 \
	GOOS=darwin \
	GOARCH=amd64 \
	go build -buildmode=c-archive -o ./macosbuild/${LIB_NAME}_x86.a cmd/static/static.go

macos-arm64:
	CGO_ENABLED=1 \
	GOOS=darwin \
	GOARCH=arm64 \
	go build -buildmode=c-archive -o ./macosbuild/${LIB_NAME}_arm64.a cmd/static/static.go

macos: macos-x86_64 macos-arm64
	lipo -create \
		./macosbuild/${LIB_NAME}_x86.a \
		./macosbuild/${LIB_NAME}_arm64.a \
		-output ./macosbuild/${LIB_NAME}.a

	$(CP) ./macosbuild/${LIB_NAME}.a ../macos/${LIB_NAME}.a
	$(CP) ./macosbuild/${LIB_NAME}_arm64.h ../macos/Classes/go/${LIB_NAME}.h
	$(CP) ./flutter_smb.c ../macos/Classes/flutter_smb.c
	$(CP) ./flutter_smb.h ../macos/Classes/flutter_smb.h
	$(RM) ./macosbuild

windows: 
	CGO_ENABLED=1 \
	GOOS=windows \
	GOARCH=amd64 \
	CC=x86_64-w64-mingw32-gcc \
	go build -buildmode=c-shared -o ../windows/x64/${SHARED_LIB_NAME}.dll cmd/shared/shared.go

linux-x86_64:
	CGO_ENABLED=1 \
	GOOS=linux \
	GOARCH=amd64 \
	go build -buildmode=c-shared -o ../linux/x64/${SHARED_LIB_NAME}.so cmd/shared/shared.go

linux-arm64:
	CGO_ENABLED=1 \
	GOOS=linux \
	GOARCH=arm64 \
	go build -buildmode=c-shared -o ../linux/arm64/${SHARED_LIB_NAME}.so cmd/shared/shared.go

linux: linux-x86_64 linux-arm64