"Vim file! 


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'kmszk/skyhawk'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set encoding=utf-8
set number
set tabstop=4
set shiftwidth=4 
set autoindent
syntax on
syntax enable
filetype indent on
set backspace=indent,eol,start

"Colors
colorscheme skyhawk

"Startup when Vim starts
autocmd vimenter * NERDTree
