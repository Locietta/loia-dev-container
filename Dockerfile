FROM archlinux/archlinux:base-devel
LABEL maintainer="locietta@qq.com"

ENV CLASSPATH=.:/usr/share/java/antlr-complete.jar

RUN pacman -Syy --noconfirm clang cmake git ninja\
    llvm llvm-libs lld python antlr4 antlr4-runtime fmt gdb openssh boost\
    && pacman -Scc --noconfirm && rm -rf /var/cache/pacman/pkg/*
