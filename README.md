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

### Tmux

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
```
