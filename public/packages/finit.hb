#!/usr/bin/env sh


NAME="finit"
DEPENDS=""
BUILD_DEPENDS="gcc libuev libite autoconf automake pkg-conf"
DESC="Fast init for Linux. Cookies included "
LICENSE="CC0"
VERSION="4.14"
SOURCE="https://github.com/finit-project/finit/releases/download/${VERSION}/finit-${VERSION}.tar.gz"
IS_BUILD="false"

build() {
  tar -xvf "${SOURCE_FILE}" -C "${BUILD_DIR}"

  cd "${BUILD_DIR}" &&
    ./autogen.sh &&
    ./configure --enable-static --prefix="$(realpath ${PACKAGE_DIR})" &&
    make -j$(nproc) &&
    make install 
}

package() {
  :
}

pre_inst() {
  :
}

post_inst() {
  :
}

pre_rm() {
  :
}

post_rm() {
  :
}
