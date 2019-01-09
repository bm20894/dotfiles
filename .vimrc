highlight Comment ctermfg=darkgrey

command W w
command Q q
command B buffers
command Wq wq

set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" plugins
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'VundleVim/Vundle.vim'

call vundle#end()

filetype plugin indent on
syntax on

set relativenumber
set term=screen-256color
colorscheme PaperColor

set bg=dark
set nu
set tabstop=4
set shiftwidth=4
set autoindent
set noswapfile
set ruler
set showcmd
set showmode
set smartcase

" Airline
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts=1
" background hex: #212121
