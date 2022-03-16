podman build -t nvim .
podman run -it --rm -v $(pwd)/nvim:/root/.config/nvim nvim
