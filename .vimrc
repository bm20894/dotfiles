let mapleader = ","

hi Comment ctermfg=darkgrey
hi clear search

command W w
command Q q
command B buffers
command Wq wq

set nocompatible

" Plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rafaqz/citation.vim'
Plug 'Shougo/unite.vim'
Plug 'junegunn/goyo.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'chiel92/vim-autoformat'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'vim-scripts/delimitMate.vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
call plug#end()

set relativenumber

set background=dark
" colorscheme PaperColor
colorscheme dracula

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
set splitright
set splitbelow

" Whitespacing by FileType
autocmd FileType html,javascript,javascript.jsx,yaml setlocal tabstop=2 shiftwidth=2

" Airline
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts=0
" background hex: #212121

" vim-go
set autowrite
let g:go_version_warning = 0

" ---------- Settings ----------

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

" auto import on file write
let g:go_fmt_command = "goimports"

" Vim-Markdown
let g:vim_markdown_folding_diabled=1
let g:vim_markdown_conceal=0
let g:tex_conceal=""
let g:vim_markdown_math=1

let g:vim_markdown_frontmatter=1
let g:vim_markdown_json_frontmatter=1

" Emmet HTML
let g:user_emmet_leader_key=','

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Autoformat
" autocmd BufWritePre * :Autoformat

" ---------- Mappings ----------

" Go
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" R Markdown
autocmd FileType rmd nmap <leader>b :!echo "require(rmarkdown); render('<c-r>%')" \| R --vanilla<CR>

" Other pdf stuff
autocmd FileType markdown nmap <leader>b :!panda %:r<CR><CR>

autocmd FileType tex nmap<leader>b :!latex_panda %:r<CR><CR>
autocmd FileType tex nmap<leader>B :!latex_panda_bib %:r<CR><CR>
autocmd FileType tex nmap<leader>P :!zathura %:r.pdf >/dev/null&<CR><CR>

" make sh scripts executable
autocmd FileType sh map <leader>x :!chmod +x %:p<CR><CR>
autocmd FileType sh map <leader>r :!./%<CR>

" Run R scripts
autocmd FileType r nmap <leader>r :!Rscript %<CR><CR>
autocmd FileType r nmap <leader>P :!zathura Rplots.pdf&<CR><CR>

" Target
autocmd FileType * nmap <space><space> /<++><CR>c4l

" Goyo
autocmd FileType * nmap<leader>u :Goyo<CR>

" Spell check
autocmd FileType * nmap<leader>o :set spell! spelllang=en_us<CR>

" Python 3
autocmd FileType python nmap<leader>r :py3file %<CR>

" NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>

" Fugitive (for Git)
set statusline +=%{FugitiveStatusline()}

" Terminal Emulator
nnoremap <leader>T :exec winheight(0)/3."split"<CR>:te<CR>

nnoremap <leader>s :hi clear search<CR>
