#! /bin/bash

if [ $(uname) == "Darwin" ]; then
    echo "ok, we're on a mac. lets install homebrew first!"

    source install/brew.sh

    echo "installing node (from nvm)"
    
    source $(brew --prefix nvm)/nvm.sh
    nvm install stable
    nvm alias default stable
fi

source install/python.sh
source install/link.sh
source install/vim.sh

echo "setting zsh as default shell"
chsh -s $(which zsh)

