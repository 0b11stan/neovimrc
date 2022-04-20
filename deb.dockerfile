FROM docker.io/debian
RUN apt-get update -y && apt-get install -y sudo
CMD bash
WORKDIR /root/.config/nvim

# vim: filetype=dockerfile
