set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'

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

nnoremap <Leader><Up> <C-W>+

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

" line / column numbers
set number
set ruler
set cursorline
let &colorcolumn="81"

" no wrapping
set tw=0

" syntax highlighting
syntax enable
colorscheme chroma
set term=screen-256color

" merlin setup
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" airline setup
let g:airline_theme = 'zenburn'

" easymotion setup
let g:Easymotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map ? <Plug>(easymotion-sn)
omap ? <Plug>(easymotion-tn)

" ctrlp setup
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '.(git|hg|svn)$|_build$',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vagrantfile settings
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

" cupfile settings
autocmd BufRead,BufNewFile *.cup set filetype=cup
autocmd FileType cup setlocal shiftwidth=4 softtabstop=4 expandtab

" xi settings
autocmd BufRead,BufNewFile *.xi set filetype=xi

" java settings
autocmd FileType java setlocal shiftwidth=4 softtabstop=4 expandtab

" python settings
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
