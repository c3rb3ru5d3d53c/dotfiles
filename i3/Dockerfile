FROM ubuntu:22.04

ARG THREADS=1

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q -y update && \
  apt-get install -q -y \
    build-essential \
    cmake \
    make \
    git \
    wget \
    curl \
    meson \
    ninja-build \
    libstartup-notification0-dev \
    libxcb-xkb-dev \
    libxcb-xinerama0-dev \
    libxcb-randr0-dev \
    libxcb-shape0-dev \
    libxcb-util-dev \
    libxcb-cursor-dev \
    libxcb-keysyms1-dev \
    libxcb-icccm4-dev \
    libxcb-xrm-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev \
    libyajl-dev \
    libpcre2-dev \
    libcairo2-dev \
    libpangocairo-1.0-0 \
    libglib2.0-dev \
    librust-pangocairo-dev \
    librust-pangocairo-sys-dev \
    libx11-xcb-perl \
    libanyevent-perl \
    xserver-xephyr \
    libipc-run-perl \
    xvfb \
    libev-dev \
    debhelper \
    asciidoc

