filetype off                                                                                                                                                                       
call pathogen#infect()
call pathogen#helptags()

" installed bundles
" git://github.com/scrooloose/nerdcommenter.git
" git://github.com/tpope/vim-surround.git
" git://github.com/tsaleh/vim-supertab.git
" git://github.com/tpope/vim-eunuch.git
" git://github.com/tpope/vim-haml.git
" git://github.com/tpope/vim-liquid.git
" git://github.com/tpope/vim-markdown.git
" git://github.com/Lokaltog/vim-powerline.git
" git://github.com/altercation/vim-colors-solarized.git
" git://github.com/nathanaelkane/vim-indent-guides.git

" syntax
syntax on
syntax enable
filetype plugin indent on
autocmd BufRead *.jinc set filetype=jsp
autocmd BufRead *.email set filetype=velocity
autocmd BufRead *.email.html set filetype=velocity

set nocompatible

set path+=/usr/local/meetup/**,~/dev/**


" indentation
set listchars=tab:`\ ,trail:~,extends:>,precedes:<
set list
set smartindent
set modelines=0
set shiftwidth=3
set tabstop=3
set shiftwidth=3
set noexpandtab
autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set expandtab

" Mode stuff
set history=50
set encoding=utf-8
set scrolloff=3
set ai
set autoindent
set autoread
set si
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set foldmethod=marker
set number
                                                                                                                                                                                
" movement
set ignorecase
set smartcase
set showmatch

" leader key
let mapleader=","

" wrapping
set nowrap

" leader mappings 
nnoremap <leader>a :Ack
nnoremap <leader>v V`]
nnoremap <leader>w <C-w><C-w>
nnoremap <leader>s <C-w><C-v> 

" build mappings
" nnoremap <leader>b :w <CR> :! {shell cmd for some build process} <CR>

" insert mappings
imap jj <Esc>
imap uu _

" visual
set linespace=2
set laststatus=2
set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
if has('gui_running')
  set background=dark
  colorscheme solarized
endif

" indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#b58900   ctermbg=190
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#cb4b16 ctermbg=166

" spelling (text only)
if v:version >= 700
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
  autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en
endif
                                                                                                                                                               
