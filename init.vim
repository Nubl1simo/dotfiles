call plug#begin('$HOME/.config/nvim/plugins')

" List of plugins
Plug 'lervag/vimtex'
Plug 'gruvbox-community/gruvbox'
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
let g:vimtex_view_method='zathura'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

call plug#end()

" sets
set title
set number
set relativenumber
set nohlsearch " it won't highlight search results after search
set noerrorbells
set smartcase "case insensitive
set ignorecase ""
set incsearch
set scrolloff=4
set signcolumn=yes
set conceallevel=1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" nnoremap <C-l> :!pdflatex *.tex<CR>
" nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

autocmd VimEnter * hi Normal ctermbg=none

":options for help

" Other stuff
colorscheme gruvbox

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
