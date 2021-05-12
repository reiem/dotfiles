call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
"Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" NERDCommenter
Plug 'preservim/nerdcommenter'

" Vimspector
Plug 'puremourning/vimspector'

" eunuch (File commands like :Move etc)
Plug 'tpope/vim-eunuch'

" vifm
Plug 'vifm/vifm.vim'

" Fugitive
Plug 'tpope/vim-fugitive'

" Color scheme Gruvebox
Plug 'morhetz/gruvbox'

call plug#end()
