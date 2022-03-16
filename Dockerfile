FROM docker.io/archlinux

WORKDIR /root
RUN pacman --noconfirm -Syu && pacman --noconfirm -S neovim ctags

CMD bash
