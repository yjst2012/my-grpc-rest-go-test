BINARY=gserver
CLIENT_BINARY=gclient

VERSION=1.0.0
BUILD="$(shell git describe --abbrev=8 --dirty --always --tags)"

# ToDo: set verions stuffs in files
# Setup the -ldflags option for go build here, interpolate the variable values
# LDFLAGS=-ldflags "-X main.Version=${VERSION} -X main.Build=${BUILD}"


build:
	cd server && go get -t ./...
	go build -o ${BINARY} server/*.go
	cd client && go get -t ./...
	go build -o ${CLIENT_BINARY} client/*.go


run:
	./${BINARY}

install:
	go install

clean:
	if [ -f ${BINARY} ]; then rm ${BINARY}; fi

.PHONY: build run test install clean
