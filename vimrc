set encoding=utf-8
set number
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set termguicolors
syntax on
syntax enable
filetype indent on 

" NerdTree specific settings
map <C-n> :NERDTreeToggle<CR>

" vim-plug plugins 
call plug#begin()

" Color scheme
" Plug 'arzg/vim-colors-xcode'

" Airline 
Plug 'vim-airline/vim-airline'

" Nerdtree - file system explorer 
Plug 'preservim/nerdtree'

" Signify - shows if a line is changed if using version control
if has('nvim') || has('patch-8.0.902')
	Plug 'mhinz/vim-signify'
else
	Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

call plug#end()

" colorscheme xcodedark
