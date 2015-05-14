set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

Plugin 'airblade/vim-gitgutter'
Plugin 'kshenoy/vim-signature'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'marijnh/tern_for_vim'
Plugin 'klen/python-mode'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'flazz/vim-colorschemes'
Plugin 'itchyny/lightline.vim'

call vundle#end()            " required
filetype plugin indent on    " required
