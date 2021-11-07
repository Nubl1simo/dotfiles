call plug#begin('$HOME/.config/nvim/plugins')

" List of plugins
Plug 'lervag/vimtex'
Plug 'gruvbox-community/gruvbox'
" Plug 'morhetz/gruvbox'
"Plug 'vim-airline/vim-airline'

" wtf
"let g:vimtex_compiler_latexmk = { 
"       \ 'executable' : 'latexmk',
"       \ 'options' : [ 
"       \   '-xelatex',
"       \   '-file-line-error',
"       \   '-synctex=1',
"       \   '-interaction=nonstopmode',
"       \ ],
"       \}

let g:vimtex_view_method='zathura'
let g:tex_conceal='abdmg'

call plug#end()

" sets
" set tabstop=4 softtabstop=4 "Sets default tab width to 4 characters
set number
set relativenumber
set nohlsearch " it won't highlight search results after search
"set hidden
set noerrorbells
"set nowrap
set smartcase "case insensitive
set ignorecase ""
set incsearch
set scrolloff=4
set signcolumn=yes
set conceallevel=1
"set colorcolumn=x

":options for help

" remaps


" Other stuff
colorscheme gruvbox
