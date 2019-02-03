set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jasoncodes/ctrlp-modified.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'eugen0329/vim-esearch'
Plugin 'fatih/vim-go'
Plugin 'jparise/vim-graphql'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'mileszs/ack.vim'
Plugin 'brgmnn/vim-opencl'
Bundle 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

let g:SimpylFold_docstring_preview=1

set nu
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
set clipboard=unnamed
set mouse=a
set nomodeline

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <silent> <C-N> :NERDTreeToggle<CR>

nnoremap <space> za

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" set C/C++ autoformatter to clang-format
autocmd FileType c,cpp,cc,h,hpp setlocal equalprg=clang-format
autocmd BufWritePre,BufRead *.c,*.cpp,*.cc,*.h,*.hpp :normal gg=G''

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

set encoding=utf-8
set list
set listchars=eol:$,tab:>-,trail:~,space:~,extends:>,precedes:<
set tabstop=2 shiftwidth=2 expandtab

let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <C-b><C-b> :GitGutterToggle<CR>
let g:gitgutter_highlight_lines = 1
let g:gitgutter_sign_added = 'xx'
let g:gitgutter_sign_modified = 'yy'
let g:gitgutter_sign_removed = 'zz'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = 'ww'
let g:gitgutter_enabled = 0

let python_highlight_all=1
syntax on

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>")

let NERDTreeIgnore=['\.pyc$', '\~$']
let $VIMRUNTIME='$HOME/.local/share/nvim/runtime'

" set nvim to use system clipboard
set clipboard+=unnamedplus
