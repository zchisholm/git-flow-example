FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    vim \
    && rm -rf /var/lib/apt/lists/*


WORKDIR git-basics-example

COPY . .

SHELL ["/bin/bash", "-c"]
