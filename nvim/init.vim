set number 		        " Sets line numbers
syntax enable 		    " Enables syntax highlighting
set encoding=utf-8	    " The encoding displayed
set mouse=a             " Enable your mouse
set splitbelow          " Horizontal splits will automatically be below
set splitright          " Vertical splits will automatically be to the right
set t_Co=256            " Support 256 colors
set tabstop=4           " Insert 4 spaces for a tab
set shiftwidth=4        " Change the number of space characters inserted for indentation
set smarttab            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab           " Converts tabs to spaces
set smartindent         " Makes indenting smart
set autoindent          " Good auto indent
set laststatus=0        " Always display the status line

" --- THEME ---
colorscheme monokai

" --- AIRLINE ---
let g:airline_theme='bubblegum' "Sets the Airline theme to bubblegum

" --- NERDCommentor ---
"Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Enables keybinds to be overriden for NERDCommentor
let g:NERDCreateDefaultMappings = 0

" --- MAPS ---
" Sets Control-n to toggle NERDTree on the left hand side
map <C-n> :NERDTreeToggle<CR> " Sets Control-n to toggle NERDTree on the left hand side

" Allows NERDCommentor to comment lines using control-c
map <C-c> :call NERDComment(0,"toggle")<CR>
" --- SOURCE ---
source $HOME/.config/nvim/vim-plug/plugins.vim

" --- AUTO COMMANDS ---
" Removes trailing white space on write/save
autocmd BufWritePre * :%s/\s\+$//e
