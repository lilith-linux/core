#!/usr/bin/env sh
NAME="hclos"
DEPENDS=""
BUILD_DEPENDS="curl busybox"
DESC="Package Manager for Lilith Linux"
LICENSE="CC0"
VERSION="0.1.0-alpha"
SOURCE="https://github.com/lilith-linux/hclos/archive/refs/tags/${VERSION}.tar.gz"
IS_BUILD="false"

build() {
  mkdir -p "${BUILD_DIR}/src"
  mkdir -p "${BUILD_DIR}/zig"
  tar -xvf "${SOURCE_FILE}" -C "${BUILD_DIR}"

  curl -SfL https://ziglang.org/download/0.15.2/zig-x86_64-linux-0.15.2.tar.xz -o "${BUILD_DIR}/zig.tar.xz"
    tar -xvf "${BUILD_DIR}/zig.tar.xz" -C "${BUILD_DIR}/zig"

    cd "${BUILD_DIR}/hclos-${VERSION}" && PATH="${BUILD_DIR}/zig/zig-x86_64-linux-0.15.2:$PATH" make
}

package() {
  cd "${BUILD_DIR}/hclos-${VERSION}" && PREFIX="${PACKAGE_DIR}" make install
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
