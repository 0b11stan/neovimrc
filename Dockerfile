FROM docker.io/archlinux

WORKDIR /root

RUN pacman --noconfirm -Syu && pacman --noconfirm -S \
  neovim ctags python python-pynvim autopep8 go clang git

RUN go install github.com/moorereason/mdfmt@latest

RUN curl -fLo \
  "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN echo 'PATH=$PATH:~/go/bin' >> ~/.bashrc

CMD bash
