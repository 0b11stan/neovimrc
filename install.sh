#!/bin/bash

pkgarch='curl neovim ctags python python-pynvim autopep8 go clang git'
pkgdeb='curl neovim universal-ctags python3 python3-pynvim python3-autopep8 golang clang clang-format git'

usage() { echo "Usage: $0 <arch|deb>"; exit 1; }

if [[ $1 == '-h' || $# -ne 1 ]]; then
  usage
elif [[ $1 == "arch" || $1 == "archlinux" ]]; then
  sudo pacman -Syu --noconfirm && sudo pacman --noconfirm -S $pkgarch
  go install github.com/moorereason/mdfmt@latest
elif [[ $1 == "deb" || $1 == "debian" ]]; then
  sudo apt-get update && sudo apt-get install -y $pkgdeb
  fmtpath=$(ls /usr/share/clang/ | grep clang-format- | tail -n 1)
  stat /usr/share/clang/clang-format.py >/dev/null \
    || ln -s $fmtpath/clang-format.py /usr/share/clang/clang-format.py
  stat ~/sources/moorereason/mdfmt > /dev/null || {
    git clone https://github.com/moorereason/mdfmt ~/sources/moorereason/mdfmt
    pushd ~/sources/moorereason/mdfmt
    go build && cp mdfmt /usr/local/bin
    popd
  }
else
  usage
fi

# install rust
stat ~/.cargo > /dev/null || {
  curl -s --proto '=https' --tlsv1.2 -sSf \
    -o /tmp/rust-init.sh https://sh.rustup.rs \
    && chmod +x /tmp/rust-init.sh \
    && /tmp/rust-init.sh -y
}

# install vim plug
curl -sfLo \
  "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ensure that go is in path
echo $PATH | grep go &>/dev/null || echo 'PATH=$PATH:~/go/bin' >> ~/.bashrc

echo
echo '### NOW YOU SHOULD RUN : source ~/.bashrc ###'
