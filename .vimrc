let mapleader = ","

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
Plugin 'fatih/vim-go'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'SirVer/ultisnips'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'fatih/molokai'

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

" vim-go
set autowrite
let g:go_version_warning = 0

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" auto import on file write
let g:go_fmt_command = "goimports"

" Fatih molokai colorscheme
" let g:rehash256 = 1
" let g:molokai_original = 1
" colorscheme molokai
