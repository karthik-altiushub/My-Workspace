# Oh My Zsh installation Path.
export ZSH="$HOME/.oh-my-zsh"

# echo $RANDOM_THEME
ZSH_THEME="robbyrussell"
#ZSH_THEME="random"

# Plugins
plugins=(git docker tmux vscode kubectl zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache
zstyle ':completion:*' rehash true

HISTSIZE=5000
SAVEHIST=5000


# User configuration

# Starship
eval "$(starship init zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"

# Only load nvm when you actually run `node` or `npm`
autoload -U add-zsh-hook

load-nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  add-zsh-hook -d precmd load-nvm
}

add-zsh-hook precmd load-nvm

# Brew & Nix
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
if [ -e /home/karthiknarayan/.nix-profile/etc/profile.d/nix.sh ]; then
  . /home/karthiknarayan/.nix-profile/etc/profile.d/nix.sh
fi

# Alias
alias k="kubectl"
alias t="terraform"
alias venv="source .venv/bin/activate"
alias rs="python manage.py runserver"
alias rt="python manage.py shell"

export KUBECTL_DISABLE_HTTP2=true

export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/home/karthiknarayan/.kubescape/bin

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# Run Unison in background quietly
(unison credentials >/dev/null 2>&1 &)

export KUBECTL_DISABLE_HTTP2=true
export BROWSER="wslview"
export AWS_CLI_BROWSER="wslview"
export AWS_PAGER=""

# AWS SSO login helper: prints verification URL/code, then runs STS identity
alogin() {
  # Use first argument as profile, default is AdministratorAccess
  local profile="${1:-AdministratorAccess}"

  # Disable AWS pager so "sts get-caller-identity" doesn't open less/vim
  export AWS_PAGER=""

  echo "🔐 Starting AWS SSO login for profile: ${profile}"
  echo "👉 Browser will open automatically for authentication."
  echo "-----------------------------------------------------------------------------------------------"

  # Run AWS SSO login (browser auto-opens)
  aws sso login --profile "${profile}"
  local rc=$?

  echo "-----------------------------------------------------------------------------------------------"
  if [ $rc -ne 0 ]; then
    echo "❌ SSO login failed (exit code ${rc})."
    return $rc
  fi

  echo "✅ SSO login successful."
  echo "🧾 Running: aws sts get-caller-identity"
  aws sts get-caller-identity --profile "${profile}"
}
