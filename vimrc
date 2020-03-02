" This vimrc file was written from scratch by me.
" In no way is this a full featured vimrc, there are a lot of improvements
" that are needed.
" Feel free to open a pull request or create an issue if you have suggestions.


set nocompatible              " be iMproved, required
filetype off                  " required

" Plug plugin manager
call plug#begin('~/.vim/plugged')
Plug 'arzg/vim-colors-xcode'
<<<<<<< HEAD
Plug 'preservim/nerdtree'
=======
>>>>>>> d409b026a29a479f31e7176a5b7d7ff3129dd0ce
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
call plug#end()

<<<<<<< HEAD
" All of your Plugins must be added before the following line
call vundle#end()            " required
=======
>>>>>>> d409b026a29a479f31e7176a5b7d7ff3129dd0ce
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set encoding=utf-8
set number
" set relativenumber
set tabstop=4
set shiftwidth=4
set autoindent
syntax on
syntax enable
filetype indent on
set backspace=indent,eol,start
set cursorline
hi clear cursorline

"Colors
set termguicolors
colorscheme xcodedark

"NERDtree config
map <C-n> :NERDTreeToggle<CR>

" Remove trailing white space on save
autocmd BufWritePre * %s/\s\+$//e
