set nocompatible 
filetype off "NeoBundle Scripts-----------------------------
if &compatible
set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
filetype plugin indent on
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
Plugin 'jez/vim-better-sml'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'bitc/vim-hdevtools'
Plugin 'jsfaint/gen_tags.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'

Bundle 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on


let g:SimpylFold_docstring_preview=1

set nu

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

set foldmethod=indent
set foldlevel=99

nnoremap <space> za
nnoremap <localleader>t :EnType<CR>
au FileType scala nnoremap <localleader>df :EnDeclaration<CR>

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

autocmd BufWritePost *.scala silent :EnTypeCheck

au FileType js,html,css 
      \ setlocal tabstop=2 softtabstop=2 shiftwidth=2

set encoding=utf-8
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-f> :YcmCompleter GoTo<CR>

set encoding=utf-8
set list
set listchars=eol:$,tab:>-,trail:~,space:~,extends:>,precedes:<
set tabstop=2 shiftwidth=2 expandtab

" GLSL config
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" ycm config
let g:ycm_path_to_python_interpreter = 'C:\Python27\python.exe'
let g:ycm_global_ycm_extra_conf = 'C:\Users\Archer Zhang\.vim\bundle\YouCompleteMe\third_party\ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let python_highlight_all=1
syntax on

if has('gui_running')
set t_Co=256
set background=dark
colorscheme solarized
else
colorscheme zenburn
endif

" ctrlp config
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = 'build'

call togglebg#map("<F5>")

let NERDTreeIgnore=['\.pyc$', '\~$']

set clipboard=unnamed

if exists('+termguicolors')
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
endif

