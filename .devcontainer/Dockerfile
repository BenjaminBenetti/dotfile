FROM mcr.microsoft.com/devcontainers/base:debian

# ===========================================
# System packages
# ===========================================

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    curl \
    wget \
    git \
    vim \
    neovim \
    tmux \
    htop \
    btop \
    jq \
    yq \
    tree \
    unzip \
    zip \
    tar \
    xz-utils \
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common \
    openssh-client \
    ripgrep \
    fd-find \
    fzf \
    bat \
    exa \
    shellcheck \
    strace \
    dnsutils \
    net-tools \
    iproute2 \
    iputils-ping \
    traceroute \
    nmap \
    tcpdump \
    man-db \
    less \
    file \
    locales \
    sudo \
    fontconfig \
    bubblewrap \
    sshfs \
    && rm -rf /var/lib/apt/lists/*

# ===========================================
# Locale
# ===========================================

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
