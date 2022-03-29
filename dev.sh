#!/bin/bash

if [[ $1 == '-h' || $# -ne 1 ]]; then
  echo "Usage: $0 <arch|deb>"
  exit 1
elif [[ $1 == "arch" ]]; then
  podman build -t arch-nvim -f arch.dockerfile
  podman run -it --rm -v $(pwd):/root/.config/nvim arch-nvim
elif [[ $1 == "deb" ]]; then
  podman build -t deb-nvim -f deb.dockerfile
  podman run -it --rm -v $(pwd):/root/.config/nvim deb-nvim
fi
