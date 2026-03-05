# Ubuntu Development Environment Setup

> Homebrew-first development environment for Ubuntu/WSL2

## Quick Setup

```bash
git clone <repository-url>
cd My-Workspace
```

---

## Installation Sequence

### 1. System Prerequisites

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential curl
```

### 2. Install Zsh

```bash
sudo apt install -y zsh
chsh -s $(which zsh)
# Log out and back in
```

### 3. Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Plugins:**

```bash
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# zsh-autocomplete
git clone https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

Update `~/.zshrc`:

```bash
plugins=(git docker kubectl zsh-autosuggestions zsh-syntax-highlighting)
```

### 4. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

Add to `~/.zshrc`:

```bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

### 5. Install Starship

```bash
brew install starship
mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml
```

Add to `~/.zshrc`:

```bash
eval "$(starship init zsh)"
```

### 6. Install Development Tools

```bash
# CLI Tools
brew install git vim tmux htop fzf tree bat yq

# Languages
brew install python@3.14 go
brew install uv  # Python package manager

# Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.zshrc
nvm install --lts
```

### 7. Install Cloud Tools

```bash
brew install awscli azure-cli terraform
```

### 8. Install Kubernetes Tools

```bash
brew install kubernetes-cli helm minikube kubectx
```

### 9. Install DevOps Utilities

```bash
brew install go-task act socat websocat hey
```

---

## Installed Tools

### Core Development

- **git** 2.53.0 | **vim** 9.2 | **tmux** 3.6a | **htop** 3.4.1 | **fzf** 0.70.0

### Languages

- **Python** 3.14.3 + **UV** 0.10.6
- **Node.js** v22.19.0 + **NVM** 0.39.7
- **Go** 1.26.0

### Cloud & IaC

- **AWS CLI** 2.33.30 | **Azure CLI** 2.83.0 | **Terraform** 1.14.6

### Kubernetes

- **kubectl** 1.35.1 | **Helm** 4.1.1 | **Minikube** 1.38.1 | **kubectx**

### Utilities

- **bat** 0.26.1 | **yq** 4.52.4 | **tree** 2.3.1 | **go-task** 3.48.0 | **act** 0.2.84

---

## Configuration

### Git

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main
```

### NVM (Lazy Loading)

Add to `~/.zshrc`:

```bash
export NVM_DIR="$HOME/.nvm"
autoload -U add-zsh-hook
load-nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  add-zsh-hook -d precmd load-nvm
}
add-zsh-hook precmd load-nvm
```

### Aliases

Add to `~/.zshrc`:

```bash
# Kubernetes
alias k="kubectl"
alias kctx="kubectx"

# Docker
alias d="docker"
alias dc="docker-compose"

# Terraform
alias tf="terraform"

# Git
alias gs="git status"
alias gp="git push"
alias gl="git pull"

# Python
alias py="python3"
alias venv="source .venv/bin/activate"
```

---

## Updates

```bash
# Update Homebrew packages
brew update && brew upgrade

# Update system packages
sudo apt update && sudo apt upgrade

# Update Oh My Zsh
omz update

# Update Node.js
nvm install --lts && nvm use --lts
```

---

## Notes

- **System:** Ubuntu
- **Package Manager:** Homebrew (primary) + APT (system only)
- **Shell:** Zsh + Oh My Zsh + Starship
- **APT packages:** zsh, curl, build-essential only
- **Everything else:** Installed via Homebrew

---

## Verification

```bash
# Check versions
zsh --version
git --version
vim --version | head -1
python3 --version
node --version
go version
kubectl version --client
terraform version
```
