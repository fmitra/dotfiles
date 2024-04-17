#!/bin/sh

echo "============================"
echo "Install dependencies"
echo "============================"
echo ""
brew install fzf
brew install the_silver_searcher
brew install tmux
brew install nvim
brew install go
brew install gopls
brew install pyenv
brew install pyenv-virtualenv
brew install gpg-suite
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "============================"
echo "Set up development environmenet"
echo "============================"
echo ""
cp tmux.conf.txt ~/.tmux.conf
cp init.vim.txt ~/.config/nvim/init.vim
cp zshrc.txt ~/.zshrc

echo "============================"
echo "Done!"
echo ""
echo "Run prefix + I in TMUX and :PlugInstall in NVIM to complete setup"
echo "============================"
