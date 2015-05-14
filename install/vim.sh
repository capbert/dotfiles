#! /usr/bash


# clone vundle to 'bootstrap' vim plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.dotfiles/vim/vim.ln/bundle/Vundle.vim

# install plugins
vim +PluginInstall +qall

# some plugins need initialization
# cd ~/.vim/bundle/YouCompleteMe  && ./install.sh --clang-completer

cd ~/.vim/bundle/tern_for_vim && npm install


npm install -g jshint
