filetype off
call pathogen#infect()
call pathogen#helptags()

" installed bundles
" xml to make for easy/magic bash installation with sed
"<pathogen>
	"<bundle>git://github.com/tsaleh/vim-supertab.git</bundle>
	"<bundle>git://github.com/editorconfig/editorconfig-vim.git</bundle>
	"<bundle>git://github.com/reedes/vim-pencil.git</bundle>
	"<bundle>git://github.com/plasticboy/vim-markdown.git</bundle>
	"<bundle>git://github.com/junegunn/goyo.vim.git</bundle>
	"<bundle>git://github.com/junegunn/limelight.vim.git</bundle>
"</pathogen>

" syntax
syntax on
syntax enable
filetype plugin on


" WRITING
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:limelight_conceal_ctermfg = 'gray'

augroup pencil
	autocmd!
	autocmd FileType markdown,mkd call pencil#init()
	autocmd FileType text         call pencil#init()
augroup END

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" -----------------------------------

set nocompatible

" indentation
set smartindent
set modelines=0
set shiftwidth=3
set tabstop=3
set shiftwidth=3
set noexpandtab

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
set foldmethod=marker

" movement
set ignorecase
set showmatch

" leader key
let mapleader=","

" leader mappings 
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>v V`]
nnoremap <leader>w <C-w><C-w>
nnoremap <leader>s <C-w><C-v>

" insert mappings
imap jj <Esc>
imap uu _

" visual
set linespace=2
set laststatus=2
if has('gui_running')
  set background=dark
  colorscheme macvim
endif

" spelling (text only)
if v:version >= 700
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
  autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en
endif

" VimDiff settings
set diffopt+=iwhite
