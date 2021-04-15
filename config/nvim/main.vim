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
