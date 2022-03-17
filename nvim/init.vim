set number
set expandtab
set tabstop=2
set shiftwidth=2
set colorcolumn=81
set cursorline

set nocompatible

syntax enable
filetype plugin on

" Remap keys for usage with azerty
noremap j h
noremap k j
noremap l k
noremap m l

" Move in panels using CTRL
noremap <C-m> <C-w>l
noremap <C-l> <C-w>k
noremap <C-k> <C-w>j
noremap <C-j> <C-w>h

" So we can use `:find ...` for fuzzyfind
set path+=**

" TODO : link it to the write command!
command! MakeTags !ctags -R .

" Highlight cursor line
hi CursorLine   cterm=NONE ctermbg=238
hi CursorColumn cterm=NONE ctermbg=238

" Switch highlight from vertical to horizontal
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Read an templates and move cursor to the right position
nnoremap <Leader>html :-1read $HOME/.config/nvim/templates/skeleton.html<CR>3jwf>a
nnoremap <Leader>python :-1read $HOME/.config/nvim/templates/skeleton.py<CR>o
nnoremap <Leader>clang :-1read $HOME/.config/nvim/templates/skeleton.c<CR>o

" FMTs
autocmd BufWritePre *.py %!autopep8 -
autocmd BufWritePre *.md %!mdfmt
autocmd BufWritePre *.h,*.c,*.cc,*.cpp :py3file /usr/share/clang/clang-format.py

" === PLUGINS === "
" plugins are in `:echo stdpath('data')`
"
call plug#begin(stdpath('data') . '/plugged')
  Plug 'preservim/nerdtree', { 'on': 'NERDTree' }
  Plug 'alvan/vim-closetag'
call plug#end()

" Nerdtree settings
let NERDTreeWinSize=21
map t :NERDTree<CR>
