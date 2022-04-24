set number
set expandtab
set tabstop=2
set shiftwidth=2
set colorcolumn=81
set cursorline

set nocompatible

syntax enable
filetype plugin on

" Autocomment 
" TODO : make it dependant to language
vmap " :s/^/#<CR>

" Use M key to set marks
noremap M m

" Remap keys for usage with azerty
noremap j h
noremap k j
noremap l k
noremap m l

" Leave terminal mode on escape
tnoremap <Esc> <C-\><C-n>

" Move in panels using CTRL
" (following line is a fix : https://github.com/neovim/neovim/issues/18245)
noremap <CR> <C-w>l
noremap <C-l> <C-w>k
noremap <C-k> <C-w>j
noremap <C-j> <C-w>h

" Remove search
noremap h :nohlsearch<CR>

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
nnoremap <Leader>sh :-1read $HOME/.config/nvim/templates/skeleton.sh<CR>o

" FMTs
function Fmt(cmd)
  normal Mt
  execute a:cmd
  normal `t
endfunction
autocmd BufWritePre *.py call Fmt('%!autopep8 -')
autocmd BufWritePre *.md call Fmt('%!mdfmt')
autocmd BufWritePre *.rs call Fmt('%!rustfmt')
autocmd BufWritePre *.h,*.c,*.cc,*.cpp call Fmt(':py3file /usr/share/clang/clang-format.py')

" === PLUGINS === "
" plugins are in `:echo stdpath('data')`
"
call plug#begin(stdpath('data') . '/plugged')
  Plug 'preservim/nerdtree', { 'on': 'NERDTree' }
  Plug 'alvan/vim-closetag'
  Plug 'preservim/tagbar'
  Plug 'rust-lang/rust.vim'
call plug#end()

" Nerdtree settings
let NERDTreeWinSize=21
map t :NERDTree<CR>:TagbarToggle<CR>
