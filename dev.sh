#!/bin/bash

usage() { echo "Usage: $0 <arch|deb>"; exit 1; }

if [[ $1 == '-h' || $# -ne 1 ]]; then
  usage
elif [[ $1 == "arch" || $1 == "archlinux" ]]; then
  podman build -t arch-nvim -f arch.dockerfile
  podman run -it --rm -v $(pwd):/root/.config/nvim arch-nvim
elif [[ $1 == "deb" || $1 == "debian" ]]; then
  podman build -t deb-nvim -f deb.dockerfile
  podman run -it --rm -v $(pwd):/root/.config/nvim deb-nvim
else
  usage
fi
