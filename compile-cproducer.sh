#!/bin/bash
CPRD_SRC_FOLDER="${PWD}/amazon-kinesis-video-streams-producer-c"
CPRD_GIT_URL="https://github.com/awslabs/amazon-kinesis-video-streams-producer-c.git"

if [ -d "$CPRD_SRC_FOLDER" ] 
then
    if [ -d "$CPRD_SRC_FOLDER"/build ] 
    then
        rm -f -r "$CPRD_SRC_FOLDER"/build/*
    else
        mkdir "$CPRD_SRC_FOLDER"/build
    fi
    if [ -d "$CPRD_SRC_FOLDER"/dependency ] 
    then
        rm -f -r "$CPRD_SRC_FOLDER"/dependency
    fi
else
    echo "Error: Directory ${CPRD_SRC_FOLDER} does not exists."
    git clone ${CPRD_GIT_URL}
fi

export PKG_CONFIG=${PWD}/mips-pkg-config.sh

#TODO set this up to install in ${PWD}/../_install

cmake -Wno-dev -DOPENSSL_ROOT_DIR=${PWD}/../_install -DOPENSSL_LIBRARIES=${PWD}/../_install/openssl/lib -DBUILD_DEPENDENCIES=OFF -DCMAKE_TOOLCHAIN_FILE="${PWD}/kenisis.dafang.toolchain" -DBUILD_OPENSSL_PLATFORM=linux-mips32 --debug-output -B ${CPRD_SRC_FOLDER}/build/ -S ${CPRD_SRC_FOLDER}

make --trace -C ${CPRD_SRC_FOLDER}/build/

