# This is free and unencumbered software released into the public domain.

# Setup environment variables.
export ARCH=$(uname -m)
export CXX="zig c++ -w"
export DUCKDB="1.3.2"
export LIB="$(dirname $BASH_SOURCE[0])/../lib"
export PATH="/opt/zig:$PATH"
export ZIG="0.15.1"

# Install zig.
mkdir /opt/zig
curl --output /tmp/zig.tar.xz https://ziglang.org/download/$ZIG/zig-$ARCH-linux-$ZIG.tar.xz
tar --directory /opt/zig --extract --file /tmp/zig.tar.xz --strip-components 1 --xz
rm /tmp/zig.tar.xz

# Clone & build duckdb.
git clone --branch v$DUCKDB --depth 1 https://github.com/duckdb/duckdb /opt/duckdb
(cd /opt/duckdb && make bundle-library)

# Copy compile output to 'lib' directory.
mkdir --parents $LIB/bin
cp /opt/duckdb/src/include/duckdb.h $LIB/bin/duckdb.h
cp /opt/duckdb/build/release/libduckdb_bundle.a $LIB/bin/libduckdb.a

# Compress output files.
zip --junk-paths $LIB/duckdb.zip $LIB/bin/*
