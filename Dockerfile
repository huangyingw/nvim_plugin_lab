FROM ubuntu:22.04

# 避免在安装过程中出现交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 安装Neovim和其它可能需要的依赖
RUN apt-get update && apt-get install -y \
    neovim \
    git \
    python3 \
    python3-pip \
    nodejs \
    npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /workspace

# 启动时打开bash
CMD ["/bin/bash"]
