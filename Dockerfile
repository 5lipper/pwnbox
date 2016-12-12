FROM ubuntu:latest
MAINTAINER slipper "slipper@0ops.net"

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/' /etc/apt/sources.list

RUN apt-get update && apt-get install -y build-essential libtool g++ gcc \
    texinfo curl wget automake autoconf python python-dev git subversion \
    unzip
RUN apt-get install -y vim tmux zsh python-pip qemu gdb man

WORKDIR /root/tools/
COPY .git .git
RUN git checkout .
RUN ./install pip oh-my-zsh vundle ipython peda pwntools rp++ unicorn

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
WORKDIR /root/
ENTRYPOINT ["/bin/zsh"]
