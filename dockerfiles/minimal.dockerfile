FROM archlinux/archlinux:base-devel as arch
LABEL maintainer="<locietta@qq.com>"

RUN sudo pacman-key --init

RUN pacman -Syu --needed --noconfirm git

# add archlinuxcn repo
RUN echo $'[archlinuxcn]\n\
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch\n\
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf\
    && pacman-key --init \
    && pacman-key --lsign-key "farseerfc@archlinux.org" \
    && pacman -Sy --noconfirm archlinuxcn-keyring \
    && pacman-key --populate archlinuxcn

# create AUR user
ARG user=aur
RUN useradd --create-home $user \
  && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
USER $user
WORKDIR /home/$user

# build pacman-static
COPY ./pacman-static.PKGBUILD /home/$user/PKGBUILD
RUN git clone https://aur.archlinux.org/pacman-static.git --depth 1 \
  && cd pacman-static \
  && mv ../PKGBUILD . \
  && makepkg -si --needed --noconfirm --skippgpcheck\
  && cd

# build gpg
RUN git clone https://github.com/skeeto/lean-static-gpg gnupg --depth 1
RUN cd gnupg && ./build.sh

USER root

FROM debian:unstable-slim as debian

RUN apt-get update && apt-get install -y bash-static

FROM scratch

# copy over everything pacman needs
COPY --from=arch /usr/bin/pacman-static /usr/bin/pacman
COPY --from=arch /etc/pacman.conf /etc/pacman.conf
COPY --from=arch /etc/pacman.d /etc/pacman.d
COPY --from=arch /var/lib/pacman/sync /var/lib/pacman/sync
COPY --from=arch /home/aur/gnupg/gnupg/bin/gpg /usr/bin/gpg
COPY --from=arch /etc/ca-certificates/extracted/tls-ca-bundle.pem \
  /etc/ssl/certs/ca-certificates.crt

# copy over bash-static from debian
COPY --from=debian /bin/bash-static /usr/bin/bash

# set shell path
SHELL ["/usr/bin/bash", "-c"]

CMD ["/usr/bin/bash"]