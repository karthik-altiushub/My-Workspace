# Oh My Zsh Custom Plugins Installation

## Installation Commands

### 1. zsh-autocomplete

Real-time type-ahead completion for Zsh.

```bash
git clone https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
```

### 2. zsh-autosuggestions

Fish-like autosuggestions for Zsh.

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### 3. zsh-syntax-highlighting

Fish shell-like syntax highlighting for Zsh.

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### 4. zsh-bat

Enhanced cat command with syntax highlighting using bat.

```bash
git clone https://github.com/fdellwing/zsh-bat.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat
```

## Configuration

After installing the plugins, add them to your `~/.zshrc` file:

```bash
plugins=(
    git
    zsh-autocomplete
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-bat
)
```

**Note:** `zsh-syntax-highlighting` should be the last plugin in the list.

## Apply Changes

After editing `~/.zshrc`, reload your configuration:

```bash
source ~/.zshrc
```

## Prerequisites

For `zsh-bat` to work properly, you need to install `bat`:

```bash

brew install bat

```
