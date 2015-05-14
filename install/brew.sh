#! /bin/bash

if ! type brew 2>/dev/null; then
	echo "install the brew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "brew it up..."

# lets get cask
brew install caskroom/cask/brew-cask

# utilities I like
brew install htop-osx
brew install ack
brew install tree
brew install wget
brew install Caskroom/cask/osxfuse
brew install sshfs

# development stuff
brew install git
brew install vim
brew install reattach-to-user-namespace
brew install tmux
brew install zsh
brew install nvm
brew install python
brew install cmake
brew install tidy-html5

echo "and now cask"

brew cask install adobe-creative-cloud
brew cask install charles
brew cask install dash
brew cask install firefox
brew cask install google-chrome
brew cask install caskroom/versions/sublime-text3
brew cask install synology-assistant
brew cask install virtualbox
