FROM docker.io/debian

WORKDIR /root

RUN apt-get update -y && apt-get install -y \
  neovim universal-ctags python3 python3-pynvim python3-autopep8 golang clang git

RUN go install github.com/moorereason/mdfmt@latest

RUN curl -fLo \
  "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN echo 'PATH=$PATH:~/go/bin' >> ~/.bashrc

CMD bash

# vim: filetype=dockerfile
