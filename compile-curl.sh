#!/bin/bash
CURL_SRC_FOLDER="${PWD}/../curl-7.73.0"
CURL_DOWNLOAD="https://curl.haxx.se/download/curl-7.73.0.tar.gz"
CURL_TAR="curl-7.73.0.tar.gz"

if [ -d "$CURL_SRC_FOLDER" ] 
then
    if [ -d "$CURL_SRC_FOLDER"/build ] 
    then
        rm -f -r "$CURL_SRC_FOLDER"/build/*
    else
        mkdir "$CURL_SRC_FOLDER"/build
    fi
else
    echo "Error: Directory ${CURL_SRC_FOLDER} does not exists."
    wget $CURL_DOWNLOAD
    tar -C .. -zxf $CURL_TAR
fi

cmake -Wno-dev -DOPENSSL_ROOT_DIR=${PWD}/../_install -DOPENSSL_LIBRARIES=${PWD}/../_install/openssl/lib -DBUILD_DEPENDENCIES=OFF -DCMAKE_TOOLCHAIN_FILE="${PWD}/kenisis.dafang.toolchain" -DBUILD_OPENSSL_PLATFORM=linux-mips32 --debug-output -B ${CURL_SRC_FOLDER}/build -S ${CURL_SRC_FOLDER} 

make --trace -C ${CURL_SRC_FOLDER}/build 

