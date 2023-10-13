# Configs

Basic configs for tmux and vim

## Requirements

* [Vundle](https://github.com/VundleVim/Vundle.vim)
* [Silver Searcher](https://github.com/ggreer/the_silver_searcher)
* [FZF](https://github.com/junegunn/fzf#key-bindings-for-command-line)
* [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

## Getting Started (OSX)

Follow instructions for FZF and Silver Searcher and then set up vim and copy configs.

```
mkdir ~/.vim/backup/
mkdir ~/.vim/swp/
source ./install
```

### Vim

```
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

### Notes

`ag` supports an `.aignore` file where we can specify directories/files to ignore
in the same format as a `.gitignore`. Create it at `~/.aignore` for universal usage.
