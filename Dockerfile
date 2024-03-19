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
    npm \
    curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 安装Jupyter和Neovim的Python客户端
RUN pip3 install jupyter neovim

# 安装vim-plug插件管理器
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-/root/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# 设置工作目录
WORKDIR /workspace

# 将本地的init.vim复制到容器中
COPY init.vim /root/.config/nvim/init.vim

# 使用nvim的headless模式自动安装插件
RUN nvim --headless +PlugInstall +qall

# 启动时打开bash
CMD ["/bin/bash"]
