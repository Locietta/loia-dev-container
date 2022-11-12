FROM greyltc/archlinux-aur:paru
LABEL maintainer="locietta@qq.com"

RUN echo $'[archlinuxcn]\n\
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch\n\
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf\
    && pacman -Syy --noconfirm archlinuxcn-keyring \
    && pacman-key --init && pacman-key --populate archlinuxcn\
    && pacman -Syy --noconfirm ninja git python\
    && paru -Sccd --noconfirm && rm -rf /var/cache/pacman/pkg/*