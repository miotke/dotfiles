set number 		        " Sets line numbers
syntax enable 		    " Enables syntax highlighting
set encoding=utf-8	    " The encoding displayed
set mouse=a             " Enable your mouse
set splitbelow          " Horizontal splits will automatically be below
set splitright          " Vertical splits will automatically be to the right
set t_Co=256            " Support 256 colors
set tabstop=4           " Insert 4 spaces for a tab
set shiftwidth=2        " Change the number of space characters inserted for indentation
set smarttab            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab           " Converts tabs to spaces
set smartindent         " Makes indenting smart
set autoindent          " Good auto indent
set laststatus=0        " Always display the status line
set number              " Line numbers

" --- THEME ---
colorscheme monokai

" --- MAPS ---
" NerdTree specific settings
map <C-n> :NERDTreeToggle<CR>

" --- SOURCE ---
source $HOME/.config/nvim/vim-plug/plugins.vim

autocmd BufWritePre * :%s/\s\+$//e
