FROM archlinux:base-devel
LABEL maintainer="locietta@qq.com"

RUN pacman -Syyu --noconfirm \
    && pacman -S --noconfirm fmt clang cmake git ca-certificates
