TOOL_NAME = gh-get-enterprise-users
VERSION = $(shell git describe --abbrev=0 --tags)

PREFIX = /usr/local
INSTALL_PATH = $(PREFIX)/bin/$(TOOL_NAME)
SHARE_PATH = $(PREFIX)/share/$(TOOL_NAME)
BUILD_PATH = .build/apple/Products/Release/$(TOOL_NAME)
CURRENT_PATH = $(PWD)

build:
	swift build -c release --arch arm64 --arch x86_64
	rm -rf out || true
	mkdir -p Binaries
	cp ${BUILD_PATH} Binaries/${BINARY}

install: build
	mkdir -p $(PREFIX)/bin
	cp -f $(BUILD_PATH) $(INSTALL_PATH)

uninstall:
	rm -f $(INSTALL_PATH)
