FROM archlinux/archlinux:base-devel
LABEL maintainer="locietta@qq.com"

ENV CLASSPATH=.:/usr/share/java/antlr-complete.jar

RUN pacman -Syy --noconfirm clang cmake git ninja graphviz\
    llvm llvm-libs lld python antlr4 antlr4-runtime fmt lldb openssh boost\
    && pacman -Scc --noconfirm && rm -rf /var/cache/pacman/pkg/*
