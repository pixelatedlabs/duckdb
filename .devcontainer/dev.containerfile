# This is free and unencumbered software released into the public domain.

FROM quay.io/fedora/fedora:42

RUN <<EOF
	dnf --assumeyes --setopt=install_weak_deps=false group install development-tools

	dnf --assumeyes --setopt=install_weak_deps=false install cmake git python3
EOF
