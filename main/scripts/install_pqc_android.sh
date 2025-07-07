#!/usr/bin/env bash
#
# Copyright (c) 2012-2025 Arne Schwabe
# Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
#

set -e

# point this at your Android NDK root:
NDK_ROOT="$HOME/Android/Sdk/ndk/25.2.9519653"

# where to drop your compiled libraries
OUTDIR="$(pwd)/main/src/main/jniLibs"

# which ABIs to build
ABIS=(arm64-v8a armeabi-v7a x86 x86_64)

# your PQC choices:
LIBOQS_TAG="main"
OQSPROVIDER_TAG="main"
KEM_ALGLIST="kyber768:p384_kyber768"
BUILD_DEPS=(git cmake ninja-build)

# ensure jniLibs exist
rm -rf "$OUTDIR" && mkdir -p "$OUTDIR"

# 1) clone fresh
for repo in liboqs openssl oqs-provider openvpn; do
  rm -rf "$repo"
done
git clone --depth=1 --branch $LIBOQS_TAG https://github.com/open-quantum-safe/liboqs
git clone --depth=1 --branch master        https://github.com/openssl/openssl.git
git clone --depth=1 --branch $OQSPROVIDER_TAG https://github.com/open-quantum-safe/oqs-provider.git
git clone --depth=1                         https://github.com/OpenVPN/openvpn.git

# 2) for each ABI, build everything as static .a and copy .so to jniLibs
for ABI in "${ABIS[@]}"; do
  case "$ABI" in
    arm64-v8a)  TARGET=aarch64-linux-android; API=21 ;;
    armeabi-v7a)TARGET=armv7a-linux-androideabi; API=16 ;;
    x86)        TARGET=i686-linux-android;     API=16 ;;
    x86_64)     TARGET=x86_64-linux-android;   API=21 ;;
  esac

  TOOLCHAIN="${NDK_ROOT}/toolchains/llvm/prebuilt/linux-x86_64"
  export CC="$TOOLCHAIN/bin/${TARGET}${API}-clang"
  export CXX="$TOOLCHAIN/bin/${TARGET}${API}-clang++"
  export AR="$TOOLCHAIN/bin/llvm-ar"
  export RANLIB="$TOOLCHAIN/bin/llvm-ranlib"
  SYSROOT="$TOOLCHAIN/sysroot"
  PREFIX="$(pwd)/android-build/$ABI"

  mkdir -p "$PREFIX"

  # -- build liboqs
  cd liboqs
  rm -rf build && mkdir build && cd build
  cmake -GNinja \
    -DCMAKE_TOOLCHAIN_FILE=$NDK_ROOT/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=$ABI \
    -DANDROID_PLATFORM=android-$API \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -DOQS_DIST_BUILD=ON \
    ..
  ninja install
  cd ../..

  # -- build OpenSSL 3 + oqs-provider
  cd openssl
  ./Configure \
    android-$ABI \
    --prefix="$PREFIX" \
    no-shared no-ssl3 no-comp no-hw \
    -D__ANDROID_API__=$API
  make clean && make && make install_sw
  cd ../oqs-provider
  mkdir -p _build && cd _build
  cmake \
    -DOPENSSL_ROOT_DIR="$PREFIX" \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -DCMAKE_TOOLCHAIN_FILE=$NDK_ROOT/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=$ABI \
    -DANDROID_PLATFORM=android-$API \
    ..
  make && cp liboqsprovider.so "$PREFIX/lib/"
  cd ../../..

  # -- build OpenVPN static into a shared lib
  cd openvpn
  ./configure \
    --host=$TARGET --with-ssl="$PREFIX" \
    --disable-lz4 --disable-shared --enable-static \
    --prefix="$PREFIX"
  make clean && make
  # copy the OpenVPN CLI code into a shared lib
  $CC -shared -o "$PREFIX/lib/libopenvpn.so" \
    client/openvpn.o common/*.o crypto/*.o \
    -L"$PREFIX/lib" -loqsprovider -lcrypto -lssl

  cd ..

  # install result to jniLibs/ABI
  mkdir -p "$OUTDIR/$ABI"
  cp android-build/$ABI/lib/*.so "$OUTDIR/$ABI/"
done

echo "✅  All ABIs built.  JNI libs are in main/src/main/jniLibs/"
