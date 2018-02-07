set shell=/bin/bash
filetype off
call pathogen#infect()
call pathogen#helptags()

" installed bundles
" xml to make for easy/magic bash installation with sed
"<pathogen>
       "<bundle>git://github.com/scrooloose/nerdcommenter.git</bundle>
       "<bundle>git://github.com/scrooloose/nerdtree.git</bundle>
       "<bundle>git://github.com/tpope/vim-surround.git</bundle>
       "<bundle>git://github.com/tsaleh/vim-supertab.git</bundle>
       "<bundle>git://github.com/tpope/vim-eunuch.git</bundle>
       "<bundle>git://github.com/tpope/vim-haml.git</bundle>
       "<bundle>git://github.com/tpope/vim-liquid.git</bundle>
       "<bundle>git://github.com/tpope/vim-markdown.git</bundle>
       "<bundle>git://github.com/Lokaltog/vim-powerline.git</bundle>
       "<bundle>git://github.com/nathanaelkane/vim-indent-guides.git</bundle>
       "<bundle>git://github.com/juvenn/mustache.vim.git</bundle>
       "<bundle>git://github.com/mattn/emmet-vim.git</bundle>
       "<bundle>git://github.com/editorconfig/editorconfig-vim.git</bundle>
       "<bundle>git://github.com/pangloss/vim-javascript.git</bundle>
       "<bundle>git://github.com/mxw/vim-jsx.git</bundle>
       "<bundle>git://github.com/vim-syntastic/syntastic</bundle>
       "<bundle>git@github.com:plasticboy/vim-markdown.git</bundle>
"</pathogen>


" syntax
syntax on
syntax enable
filetype plugin indent on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_ignore_files = ['\m\c\.scss$', '\m\c\.hbs$']

" file types
autocmd BufRead *.ts set filetype=typescript
autocmd BufRead *.jinc set filetype=jsp
autocmd BufRead *.email set filetype=velocity
autocmd BufRead *.email.html set filetype=velocity
autocmd BufRead *.py set filetype=python

" jsx
let g:jsx_ext_required = 0

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
autocmd FileType python setlocal tabstop=4
autocmd FileType python setlocal shiftwidth=4
autocmd FileType python setlocal expandtab
autocmd FileType python setlocal tabstop=4
autocmd FileType python setlocal shiftwidth=4
autocmd FileType python setlocal expandtab

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
set showmatch

" leader key
let mapleader=","

" wrapping
set nowrap

" leader mappings 
nnoremap <leader>a :Ack
nnoremap <leader>o :NERDTree<CR>
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

" spelling (text only)
if v:version >= 700
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
  autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en
endif

" emmet settings
"let g:user_emmet_install_global = 0
"autocmd BufNewFile,BufRead *.mustache,*.html,*.jsp EmmetInstall

" indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#b58900   ctermbg=190
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#cb4b16 ctermbg=166

" VimDiff settings
set diffopt+=iwhite

" Syntax highlighting options
hi htmlArg gui=italic
hi htmlArg cterm=italic
hi Comment gui=italic
hi Comment cterm=italic
autocmd FileType * if &ft!="css"|hi Type gui=italic|endif
autocmd FileType * if &ft!="css"|hi Type cterm=italic|endif
