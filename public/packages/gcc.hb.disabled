#!/usr/bin/env sh
set -e

NAME="gcc"
DEPENDS=""
BUILD_DEPENDS="make curl"
DESC="GNU C Compiler Collection (C/C++)"
LICENSE="GNU General Public License version 3"
VERSION="15.2.0"
SOURCE="https://github.com/gcc-mirror/gcc/archive/refs/tags/releases/gcc-15.2.0.tar.gz"
IS_BUILD="false"

build() {
  curl -SfL \
    "https://github.com/lilith-linux/builed-gcc-musl/releases/download/1.0.0/gcc-musl-bin-15.2.0.tar.bz2" \
    -o "$BUILD_DIR/bootstrap_gcc.tar.bz2"

  mkdir -p "$BUILD_DIR/bootstrap_gcc"
  tar -xvf "$BUILD_DIR/bootstrap_gcc.tar.bz2" -C "$BUILD_DIR/bootstrap_gcc"
  tar -xvf "$SOURCE_FILE" -C "$BUILD_DIR"

  BIN="$BUILD_DIR/bootstrap_gcc/bin"
  cd "$BUILD_DIR/gcc-releases-gcc-${VERSION}" 
  mkdir build; cd build

  ../configure \
    --prefix="$PACKAGE_DIR/usr" \
    --enable-languages=c,c++ \
    --disable-multilib \
    --target=x86_64-lilith-linux-musl \
    --disable-bootstrap \
    CC="$BIN/gcc" \
    CXX="$BIN/g++" \
    AR="$BIN/gcc-ar" \
    RANLIB="$BIN/gcc-ranlib" &&
  make -j$(nproc)

}

package() {
  cd "$BUILD_DIR/gcc-${VERSION}" &&
    make install
}

pre_inst() {
  :
}

post_inst() {
  ln -s /usr/lib/libc.so /usr/lib/ld-musl-x86_64.so.1 &&
  ln -s /usr/lib/ld-musl-x86_64.so.1 /usr/bin/ldd
}

pre_rm() {
  :
}

post_rm() {
  :
}
