#!/usr/bin/env bash
set -e

# Instead of sudo, check for required commands:
for cmd in cmake ninja git make openssl; do
  if ! command -v $cmd &>/dev/null; then
    echo "ERROR: $cmd is required but not installed." >&2
    exit 1
  fi
done

# Skip apt-related lines or wrap them in OS detection:
if [[ "$(uname)" == "Linux" ]]; then
  # apt update && apt install -y …
fi


# If not root, ask for sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or as root."
  exit 1
fi

# Determine invoking user's home directory
if [ -n "$SUDO_USER" ] && [ "$SUDO_USER" != "root" ]; then
  USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
else
  USER_HOME="$HOME"
fi

STARTDIR=$(pwd)
INSTALLDIR="/opt/oqssa"
OPENVPNDIR="$USER_HOME/openvpn_demo"
LIBOQS_TAG="main"
OQSPROVIDER_TAG="main"
LIBOQS_BUILD_DEFINES="-DOQS_DIST_BUILD=ON"
MAKE_DEFINES="-j$(nproc)"
KEM_ALGLIST="kyber768:p384_kyber768"
DEBIAN_FRONTEND="noninteractive"

# 1) System update & core packages
apt update && apt -y upgrade
apt install -y \
  libtool automake autoconf cmake ninja-build \
  make git wget vim net-tools \
  openssl libssl-dev pkg-config libcap-ng-dev \
  liblzo2-dev libpam0g-dev python3-docutils \
  libnl-3-dev libnl-genl-3-dev

# 2) Clone fresh repositories
cd /opt

for repo in liboqs openssl oqs-provider openvpn; do
  if [ -d "$repo" ]; then
    echo "Removing existing /opt/$repo ..."
    rm -rf "$repo"
  fi
done

git clone --depth 1 --branch ${LIBOQS_TAG} https://github.com/open-quantum-safe/liboqs
git clone --depth 1 --branch master https://github.com/openssl/openssl.git
git clone --depth 1 --branch ${OQSPROVIDER_TAG} https://github.com/open-quantum-safe/oqs-provider.git
git clone https://github.com/OpenVPN/openvpn.git

# 3) Build & install liboqs
cd /opt/liboqs
mkdir build && cd build
cmake -G Ninja .. ${LIBOQS_BUILD_DEFINES} -DCMAKE_INSTALL_PREFIX=${INSTALLDIR}
ninja install

# 4) Build & install OpenSSL 3
cd /opt/openssl
rm -rf build
LDFLAGS="-Wl,-rpath -Wl,${INSTALLDIR}/lib64" ./config shared --prefix=${INSTALLDIR}
make ${MAKE_DEFINES}
make install_sw install_ssldirs
export PATH="${INSTALLDIR}/bin:${PATH}"

# 5) Build & install oqs-provider
cd /opt/oqs-provider
ln -s ../openssl openssl || true
cmake -DOPENSSL_ROOT_DIR=${INSTALLDIR} \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=${INSTALLDIR} \
      -S . -B _build
cmake --build _build
cp _build/lib/oqsprovider.so ${INSTALLDIR}/lib64/ossl-modules

# 6) Patch OpenSSL config
CONFIG="${INSTALLDIR}/ssl/openssl.cnf"
sed -i "s/default = default_sect/&\noqsprovider = oqsprovider_sect/" "$CONFIG"
sed -i "/\[default_sect\]/a activate = 1\n[oqsprovider_sect]\nactivate = 1" "$CONFIG"
sed -i "s/providers = provider_sect/&\nssl_conf = ssl_sect\n\n[ssl_sect]\nsystem_default = system_default_sect\n\n[system_default_sect]\nGroups = ${KEM_ALGLIST}/" "$CONFIG"

# 7) Build & install OpenVPN
cd /opt/openvpn
if [ ! -f configure ]; then
  libtoolize --force
  aclocal
  autoheader
  automake --force-missing --add-missing
  autoconf
fi
CFLAGS="-I${INSTALLDIR}/include -Wl,-rpath=${INSTALLDIR}/lib64 -L${INSTALLDIR}/lib64" \
  ./configure --prefix=${INSTALLDIR} --disable-lz4
make ${MAKE_DEFINES}
make check || true
make install

# 8) Runtime libraries
apt install -y liblzo2-2 libnl-3-200 libnl-genl-3-200 procps net-tools iputils-ping

# 9) Conditional Docker install
if ! command -v docker >/dev/null 2>&1; then
  echo "Docker not found—installing docker.io..."
  apt update
  apt install -y docker.io
else
  echo "Docker is already installed; skipping."
fi

# 10) Copy VPN scripts & certs into the user's home
cd ${STARTDIR}
mkdir -p ${OPENVPNDIR}
cp -r ./certs        ${OPENVPNDIR}/certs
cp -r ./measurements ${OPENVPNDIR}/measurements
cp ./createcerts_and_config.sh ${OPENVPNDIR}/
cp ./create_new_certificates.sh ${OPENVPNDIR}/
cp ./clientstart.sh          ${OPENVPNDIR}/
cp ./openvpn-openssl.cnf     ${OPENVPNDIR}/
cp ./create_server_cert.sh   ${OPENVPNDIR}/
cp ./serverstart.sh          ${OPENVPNDIR}/
cp ./serverstart_old.sh      ${OPENVPNDIR}/
cp ./generate_mass_clients.sh ${OPENVPNDIR}/
cp ./iperf_throughput.sh      ${OPENVPNDIR}/
cp ./connected.sh            ${OPENVPNDIR}/
cp ./Dockerfile              ${OPENVPNDIR}/
cp ./output.txt              ${OPENVPNDIR}/

# Ensure ownership
chown -R "$SUDO_USER":"$SUDO_USER" "${OPENVPNDIR}" || true

echo "✅ Setup completed successfully. VPN files are in ${OPENVPNDIR}."
