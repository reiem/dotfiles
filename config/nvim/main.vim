" Use space as leader
nnoremap <space> <Nop>
let mapleader=" "

" Double space for saving the file
nnoremap <leader><space> :w<cr>

" Move to through buffers with leader h and leader l
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>l :bnext<cr>

" Hybrid line numbering
:set number relativenumber

" Colors for line number column
highlight LineNr ctermfg=grey ctermbg=black

" Use python version in neovim venv
let g:python3_host_prog="~/venv3.7/neovim/bin/python"

" Show a bar at col 80
highlight ColorColumn ctermbg=darkgrey
:set colorcolumn=80

" Switching between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Centering cursor with scrolloff
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
