FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-runtime

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && apt-get -y install --no-install-recommends software-properties-common libgl1-mesa-dev wget libssl-dev

RUN pip3 install -U pip distlib setuptools wheel

WORKDIR /workspace

WORKDIR /workspace
COPY src/ src/
COPY pyproject.toml .
RUN pip3 install -e .[dev]
