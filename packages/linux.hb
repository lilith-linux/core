#!/usr/bin/env sh
set -e

NAME="linux"
DEPENDS="base"
BUILD_DEPENDS="gcc make bc bison perl python3 xz-utils"
DESC="Linux kernel for Lilith Linux"
LICENSE="GPL-2.0"
VERSION="6.17.5"
SOURCE="https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.17.5.tar.xz"
IS_BUILD="false"

build() {
  tar -xf "$SOURCE_FILE" -C "$BUILD_DIR"

  cd "$BUILD_DIR/linux-${VERSION}" && 
    cp /boot/old-config ./.config &&
    make -j$(nproc)
}

package() {
  cd "$BUILD_DIR/linux-${VERSION}" &&
    mkdir -p "$PACKAGE_DIR/usr/src/linux-${VERSION}" "$PACKAGE_DIR/boot" &&
    cp ./.config "$PACKAGE_DIR/boot/old-config" &&
    cp ./arch/x86/boot/bzImage "$PACKAGE_DIR/boot/vmlinuz" &&
    make modules_install INSTALL_MOD_PATH="$PACKAGE_DIR/usr" &&
    make INSTALL_HDR_PATH="$PACKAGE_DIR/usr" headers_install &&
    make distclean &&
    cp -rv . "$PACKAGE_DIR/usr/src/linux-${VERSION}" &&
    ln -s "/usr/src/linux-${VERSION}" "$PACKAGE_DIR/usr/lib/modules/$(VERSION)/build" 
}

pre_inst() {
  :
}

post_inst() {
  ln -s /boot/vmlinuz /boot/vmlinuz-${VERSION}
  ln -s /usr/src/linux-${VERSION} /usr/src/linux
}

pre_rm() {
  :
}

post_rm() {
  :
}
