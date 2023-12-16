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
    python3-sphinxcontrib.apidoc \
    pkg-config \
    libcairo2-dev \
    libuv1-dev \
    libasound2-dev \
    libcurlpp-dev \
    libmpdclient-dev \
    libiw-dev \
    libinotifytools0-dev \
    libpulse-dev \
    libxcb-xkb-dev \
    libnl-genl-3-dev \
    libxcb-randr0-dev \
    libxcb-composite0-dev \
    xcb-proto \
    libxcb-icccm4-dev \
    libxcb-ewmh-dev \
    libxcb-util-dev \
    libxcb-image0-dev \
    python3-xcbgen \
    libjsoncpp-dev \
    i3-wm \
    libxcb-cursor-dev

