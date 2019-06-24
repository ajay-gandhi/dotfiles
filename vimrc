set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
" Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'kopischke/vim-fetch'
Plugin 'inkarkat/vim-mark'
Plugin 'inkarkat/vim-ingo-library' " this is needed for vim-mark :eyes:
Plugin 'aonemd/kuroi.vim'

call vundle#end()
filetype plugin indent on

" set leader key
let mapleader = "\<Space>"

" escape
inoremap jk <ESC>

" key bindings
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :e

" remove trailing whitespaces
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
  endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" status line
set laststatus=2

" tab configs
set expandtab
set softtabstop=2
set shiftwidth=2
set autoindent

" different indentation for cpp
autocmd Filetype cpp setlocal ts=4 sw=4

" macro to auto indent surrounding lines
nnoremap ff mq10k=20j`q

" line / column numbers
set number
set ruler
let &colorcolumn="81"

" disable comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" change current directory to current file
" autocmd BufEnter * silent! lcd %:p:h

" no wrapping
set tw=0

" code folding
set foldmethod=indent
set foldlevel=99
" set foldclose=all

" syntax highlighting
syntax enable
set background=dark
colorscheme kuroi
highlight Normal ctermbg=NONE
" do this through terminal, it's faster
set cursorline
set scrolloff=999
set term=screen-256color

" JS template highlighting
hi link javaScriptTemplateDelim String
hi link javaScriptTemplateVar Text
hi link javaScriptTemplateString String

" multicursor setup
let g:multi_cursor_quit_key="<C-e>"
let g:multi_cursor_insert_maps={'j':1}

" nerdtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdcommenter setup
let g:NERDSpaceDelims=1

" airline setup
let g:airline_theme = 'zenburn'

" easymotion setup
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map ? <Plug>(easymotion-sn)
omap ? <Plug>(easymotion-tn)

" ctrlp setup
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" let g:ctrlp_custom_ignore = {
  " \ 'dir':  '.(git|hg|svn)$|_build$',
  " \ }
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vagrantfile settings
" autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

" java settings
" autocmd FileType java setlocal shiftwidth=4 softtabstop=4 expandtab

" python settings
" autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
