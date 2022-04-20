FROM docker.io/debian

WORKDIR /root

RUN apt-get update -y && apt-get install -y \
  curl neovim universal-ctags python3 python3-pynvim python3-autopep8 golang clang-format git

RUN ln -s /usr/share/clang/clang-format-11/clang-format.py /usr/share/clang/clang-format.py

RUN git clone https://github.com/moorereason/mdfmt ~/sources/moorereason/mdfmt \
  && cd ~/sources/moorereason/mdfmt \
  && go build \
  && cp mdfmt /usr/local/bin

RUN curl -fLo \
  "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN echo 'PATH=$PATH:~/go/bin' >> ~/.bashrc

CMD bash

# vim: filetype=dockerfile
