FROM greyltc/archlinux-aur:paru
LABEL maintainer="locietta@qq.com"

RUN pacman -Syy --noconfirm cmake ninja git python lldb\
    && aur-install llvm-git\
    && paru -Sccd --noconfirm && rm -rf /var/cache/pacman/pkg/*