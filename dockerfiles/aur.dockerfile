FROM greyltc/archlinux-aur:paru
LABEL maintainer="locietta@qq.com"

RUN echo $'[archlinuxcn]\n\
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch\n\
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf\
    && pacman-key --init \
    && pacman-key --lsign-key "farseerfc@archlinux.org" \
    && pacman -Syy --noconfirm archlinuxcn-keyring \
    && pacman-key --populate archlinuxcn\
    && pacman -Syyu --noconfirm ninja git python\
    && paru -Sccd --noconfirm && rm -rf /var/cache/pacman/pkg/*