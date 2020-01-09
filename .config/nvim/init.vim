set nocompatible 
filetype off

call plug#begin()

Plug 'gmarik/Vundle.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'airblade/vim-gitgutter'
Plug 'eugen0329/vim-esearch'
Plug 'jparise/vim-graphql'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'
Plug 'mileszs/ack.vim'
Plug 'brgmnn/vim-opencl'
Plug 'jez/vim-better-sml'
Plug 'neovimhaskell/haskell-vim'
Plug 'bitc/vim-hdevtools'
Plug 'jsfaint/gen_tags.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'rhysd/vim-clang-format'
Plug 'tbastos/vim-lua'
Plug 'tikhomirov/vim-glsl'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf'
Plug 'ajh17/VimCompletesMe'

" Bundle 'Valloric/YouCompleteMe'

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

" duplicate current buffer to new tab
nnoremap f :tab split \| YcmCompleter GoToDefinition<CR>

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

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

" ctrlp config
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = 'build'
let g:ctrlp_root_markers = ['.ctrlp', 'Makefile', 'CMakeLists.txt']

call togglebg#map("<F5>")

let NERDTreeIgnore=['\.pyc$', '\~$']
let $VIMRUNTIME='$HOME/.local/share/nvim/runtime'

" set nvim to use system clipboard
set clipboard+=unnamedplus

" vim-hdevtools
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsInfo<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsClear<CR>

" glsl
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" clang-format
let g:clang_format#auto_format = 1

" gen_tags
let g:gen_tags#blacklist = ['$HOME']

" disable ycm for scala and let metals/coc handle it
let g:ycm_filetype_blacklist = { 'scala': 1 }

" Coc triggers
au FileType scala inoremap <silent><expr> <c-space> coc#refresh()
au FileType scala nmap <silent> gd <Plug>(coc-definition)
au FileType scala nmap <silent> gy <Plug>(coc-type-definition)
au FileType scala nmap <silent> gi <Plug>(coc-implementation)
au FileType scala nmap <silent> gr <Plug>(coc-references)))))
au FileType scala autocmd CursorHold * silent call CocActionAsync('highlight')

" lsp configs
set hidden
let g:LanguageClient_hoverPreview = 'always'

let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls'],
       \ 'cpp': ['clangd'],
       \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" ESC
imap jj <ESC>
