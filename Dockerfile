FROM archlinux/archlinux:base-devel
LABEL maintainer="locietta@qq.com"

RUN pacman -Syy --noconfirm clang cmake ninja git\
    llvm llvm-libs lld python\
    && pacman -Scc --noconfirm && rm -rf /var/cache/pacman/pkg/*
