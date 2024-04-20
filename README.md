# Configs

Basic configs for tmux and vim

## Requirements

* [Vundle](https://github.com/VundleVim/Vundle.vim)
* [Silver Searcher](https://github.com/ggreer/the_silver_searcher)
* [FZF](https://github.com/junegunn/fzf#key-bindings-for-command-line)
* [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

## Getting Started (OSX)

### New Machine

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

./configure.sh

# Cross check: https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

### Vim

```
mkdir ~/.vim/backup/
mkdir ~/.vim/swp/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim
:PluginInstall
```

### NVim

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim
:PlugInstall
```

If you want to use nvim in favor of vim permanently, add `alias vim="nvim"` to bash/zshrc profile.

### Tmux

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
tmux
```

Install plugins

```
prefix + I
```
