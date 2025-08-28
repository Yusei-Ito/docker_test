FROM nvcr.io/nvidia/cuda:12.1.1-cudnn8-devel-ubuntu20.04

# Setup proxies if needed
# ENV http_proxy 'hogehoge'
# ENV HTTP_PROXY $http_proxy
# ENV HTTPS_PROXY $http_proxy
# ENV FTP_PROXY $http_proxy

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y software-properties-common apt-utils git wget curl ca-certificates bzip2 cmake tree htop bmon iotop g++ && \
    add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get upgrade -y libstdc++6 && \
    apt-get install -y python3.11 python3.11-venv python3.11-dev && \
    apt-get clean

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1

# Upgrade pip and install Python packages
RUN python3.11 -m ensurepip --upgrade && \
    python3.11 -m pip install --upgrade pip && \
    python3.11 -m pip install --no-cache-dir "numpy>=1,<2" scipy matplotlib && \
    pip install --no-cache-dir pymatgen