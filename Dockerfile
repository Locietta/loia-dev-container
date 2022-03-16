FROM archlinux/archlinux:base-devel
LABEL maintainer="locietta@qq.com"

RUN pacman -Syy --noconfirm fmt clang cmake git ca-certificates llvm llvm-libs lld \
    && pacman -Scc --noconfirm && rm -rf /var/cache/pacman/pkg/*
