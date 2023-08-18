FROM archlinux/archlinux:base-devel
LABEL maintainer="locietta@qq.com"

RUN echo $'[archlinuxcn]\n\
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch\n\
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf\
    && pacman -Syy --noconfirm archlinuxcn-keyring \
    && pacman-key --init && pacman-key --populate archlinuxcn\
    && pacman -Syyu --noconfirm clang-git cmake ninja git\
    llvm-git llvm-libs-git lld-git python pnpm\
    && pacman -Scc --noconfirm && rm -rf /var/cache/pacman/pkg/*
