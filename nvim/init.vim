set number
set expandtab
set tabstop=2
set shiftwidth=2
set colorcolumn=81
set cursorline

set nocompatible

syntax enable
filetype plugin on

noremap j h
noremap k j
noremap l k
noremap m l

noremap <C-m> <C-w>l
noremap <C-l> <C-w>k
noremap <C-k> <C-w>j
noremap <C-j> <C-w>h

" so we can use `:find ...` for fuzzyfind
set path+=**

" TODO : link it to the write command!
command! MakeTags !ctags -R .

" Read an templates and move cursor to the right position
nnoremap ,html :-1read $HOME/.config/nvim/templates/skeleton.html<CR>3jwf>a
nnoremap ,python :-1read $HOME/.config/nvim/templates/skeleton.py<CR>o
nnoremap ,clang :-1read $HOME/.config/nvim/templates/skeleton.c<CR>o
