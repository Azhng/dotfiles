set nocompatible 
filetype off

call plug#begin()

Plug 'tmhedberg/SimpylFold'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'jparise/vim-graphql'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'
Plug 'brgmnn/vim-opencl'
Plug 'jez/vim-better-sml'
Plug 'neovimhaskell/haskell-vim'
Plug 'jsfaint/gen_tags.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'rhysd/vim-clang-format'
Plug 'tbastos/vim-lua'
Plug 'tikhomirov/vim-glsl'
Plug 'fatih/vim-go'
Plug 'uarun/vim-protobuf'
Plug 'ycm-core/YouCompleteMe'

call plug#end()

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
set visualbell

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

" set SML keybinding
autocmd BufRead *.sml :SMLReplStart
autocmd FileType sml nnoremap <buffer> <C-j> :SMLReplBuild<CR>

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

set encoding=utf-8
set list
set listchars=eol:$,tab:>-,trail:~,space:~,extends:>,precedes:<
set tabstop=2 shiftwidth=2 expandtab

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


" ctrlp config
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = 'build'
let g:ctrlp_custom_ignore = 'target'
let g:ctrlp_root_markers = ['.ctrlp', 'Makefile', 'CMakeLists.txt', 'go.mod', 'build.sbt', 'Cargo.toml']

call togglebg#map("<F5>")

let NERDTreeIgnore=['\.pyc$', '\~$']
let $VIMRUNTIME='$HOME/.local/share/nvim/runtime'

" set nvim to use system clipboard
set clipboard+=unnamedplus

" glsl
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" clang-format
let g:clang_format#auto_format = 1

" gen_tags
let g:gen_tags#blacklist = ['$HOME']

" ESC
imap jj <ESC>

" YCM Language server
let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'scala',
  \     'cmdline': [ 'metals-vim' ],
  \     'filetypes': [ 'scala', 'sbt' ],
  \     'project_root_files': [ 'build.sbt' ]
  \   }
  \ ]

nnoremap <silent> gd :YcmCompleter GoTo<CR>
nnoremap <silent> fi :YcmCompleter FixIt<CR>
nnoremap <silent> gdc :YcmCompleter GetDoc<CR>
nnoremap <silent> gtp :YcmCompleter GetType<CR>
nnoremap <silent> yd :YcmDiags<CR>

let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_global_ycm_extra_conf = '$HOME/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
