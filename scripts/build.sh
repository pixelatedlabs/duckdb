# This is free and unencumbered software released into the public domain.

# Setup environment variables.
export ARCH=$(uname -m)
export CXX="zig c++ -w"
export PATH="/opt/zig:$PATH"
export ZIG="0.15.1"

# Install zig.
mkdir /opt/zig
curl --output /tmp/zig.tar.xz https://ziglang.org/download/$ZIG/zig-$ARCH-linux-$ZIG.tar.xz
tar --directory /opt/zig --extract --file /tmp/zig.tar.xz --strip-components 1 --xz
rm /tmp/zig.tar.xz

# Clone & build duckdb.
git clone --branch v1.3.2 --single-branch https://github.com/duckdb/duckdb /opt/duckdb
(cd /opt/duckdb && make bundle-library)
