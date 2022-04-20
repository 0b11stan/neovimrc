#!/bin/bash

pkgarch='curl neovim ctags python python-pynvim autopep8 go clang git'
pkgdeb='curl neovim universal-ctags python3 python3-pynvim python3-autopep8 golang clang git'

usage() { echo "Usage: $0 <arch|deb>"; exit 1; }

if [[ $1 == '-h' || $# -ne 1 ]]; then
  usage
elif [[ $1 == "arch" || $1 == "archlinux" ]]; then
  sudo pacman -Syu --noconfirm && sudo pacman --noconfirm -S $pkgarch
  go install github.com/moorereason/mdfmt@latest
elif [[ $1 == "deb" || $1 == "debian" ]]; then
  sudo apt-get update && sudo apt-get install -y $pkgdeb
  # fix clang-format install
  fmtpath=$(ls /usr/share/clang/ | grep clang-format- | tail -n 1)
  ln -s $fmtpath/clang-format.py /usr/share/clang/clang-format.py
  # install mdfmt on debian
  git clone https://github.com/moorereason/mdfmt ~/sources/moorereason/mdfmt
  pushd ~/sources/moorereason/mdfmt
  go build
  cp mdfmt /usr/local/bin
  popd
else
  usage
fi

curl -fLo \
  "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo $PATH | grep test &>/dev/null || echo 'PATH=$PATH:~/go/bin' >> ~/.bashrc

exec $1
