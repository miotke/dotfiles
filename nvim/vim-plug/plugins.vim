" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'sheerun/vim-polyglot'                   " Better Syntax Support
    Plug 'jiangmiao/auto-pairs'                   " Auto pairs for '(' '[' '{'
    Plug 'vim-airline/vim-airline'                " Airline
    Plug 'scrooloose/NERDTree'                    " File Explorer
    Plug 'airblade/vim-gitgutter'                 " Shows git changes next to the line number
    Plug 'lukas-reineke/indent-blankline.nvim'    " Shows indentation lines
    Plug 'lewis6991/spellsitter.nvim'             " Spell checker

call plug#end()
