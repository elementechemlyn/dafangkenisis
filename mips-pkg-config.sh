#!/bin/sh

SYSROOT=${PWD}/../_install

export PKG_CONFIG_PATH=${SYSROOT}/usr/local/lib/pkgconfig
export PKG_CONFIG_LIBDIR=${SYSROOT}/usr/lib/pkgconfig:${PWD}/../toolchain/mips-linux-gnu/libc/usr/share/pkgconfig
export PKG_CONFIG_SYSROOT_DIR=${SYSROOT}

exec pkg-config "$@"