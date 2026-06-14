#!/usr/bin/env bash
# Lazy tools family: lazygit + lazydocker (jesseduffield TUIs)
set -euo pipefail

# ===========================================
# Detect package manager
# ===========================================

detect_pm() {
  if command -v dnf &>/dev/null; then
    echo "dnf"
  elif command -v apt-get &>/dev/null; then
    echo "apt"
  elif command -v pacman &>/dev/null; then
    echo "pacman"
  elif command -v brew &>/dev/null; then
    echo "brew"
  else
    echo "unknown"
  fi
}

PM=$(detect_pm)
echo "Detected package manager: $PM"

# ===========================================
# lazygit
# ===========================================

install_lazygit() {
  if command -v lazygit &>/dev/null; then
    echo "lazygit already installed: $(lazygit --version | grep -oP 'version=\K[^,]+')"
    return
  fi

  case "$PM" in
  dnf)
    sudo dnf copr enable -y atim/lazygit
    sudo dnf install -y lazygit
    ;;
  apt)
    local version
    version=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
    curl -sL "https://github.com/jesseduffield/lazygit/releases/download/v${version}/lazygit_${version}_Linux_x86_64.tar.gz" -o /tmp/lazygit.tar.gz
    sudo tar xzf /tmp/lazygit.tar.gz -C /usr/local/bin lazygit
    rm /tmp/lazygit.tar.gz
    ;;
  pacman)
    sudo pacman -S --noconfirm lazygit
    ;;
  brew)
    brew install lazygit
    ;;
  esac
  echo "lazygit installed"
}

echo "Installing lazygit..."
install_lazygit

# ===========================================
# lazydocker
# ===========================================

install_lazydocker() {
  if command -v lazydocker &>/dev/null; then
    echo "lazydocker already installed: $(lazydocker --version | grep -oP 'Version: \K.*')"
    return
  fi

  case "$PM" in
  dnf)
    sudo dnf copr enable -y atim/lazydocker
    sudo dnf install -y lazydocker
    ;;
  apt)
    local version
    version=$(curl -s https://api.github.com/repos/jesseduffield/lazydocker/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
    curl -sL "https://github.com/jesseduffield/lazydocker/releases/download/v${version}/lazydocker_${version}_Linux_x86_64.tar.gz" -o /tmp/lazydocker.tar.gz
    sudo tar xzf /tmp/lazydocker.tar.gz -C /usr/local/bin lazydocker
    rm /tmp/lazydocker.tar.gz
    ;;
  pacman)
    sudo pacman -S --noconfirm lazydocker
    ;;
  brew)
    brew install lazydocker
    ;;
  esac
  echo "lazydocker installed"
}

echo "Installing lazydocker..."
install_lazydocker
