FROM docker.io/archlinux
RUN pacman --noconfirm -Syu && pacman --noconfirm -S sudo
CMD bash
WORKDIR /root/.config/nvim

# vim: filetype=dockerfile
