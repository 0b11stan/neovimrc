podman build -t nvim .
podman run -it --rm -v $(pwd):/root/.config/nvim nvim
