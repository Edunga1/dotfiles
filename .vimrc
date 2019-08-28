call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'               " a git wrapper
Plug 'airblade/vim-gitgutter'           " shows a git diff in the gutter

" Completion
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'

" Documents
" - Dash needs Dash.app (OSX Only)
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'

" Navigation
Plug 'scrooloose/nerdtree'              " a tree explorer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                 " a fuzzy finder. requires fzf adove
Plug 'majutsushi/tagbar'                " displays tags in a window. requires universal-ctags

" Programming
Plug 'tpope/vim-surround'               " quoting/parenthesizing made simple
Plug 'groenewege/vim-less'              " vim syntax for LESS
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/matchit.zip'
Plug 'othree/html5.vim'
Plug 'tpope/vim-bundler'
Plug 'rudes/vim-java'
Plug 'fatih/vim-go'
Plug 'elixir-editors/vim-elixir'
Plug 'rhysd/vim-crystal'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'

" Python
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Utility
Plug 'vim-scripts/AutoTag'              " Updates entries in a tags file automatically when saving
Plug 'vim-scripts/ZoomWin'              " Zoom in/out of windows (<c-w>o to toggle)

" Colorscheme
Plug 'altercation/vim-colors-solarized'

" ETC
Plug 'vimwiki/vimwiki'                  " personal wiki

call plug#end()

" General {
set nocompatible          " disable vi compatibility.
set history=256           " Number of things to remember in history.
set autowrite             " Writes on make/shell commands
set autoread
set timeoutlen=250        " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed    " Yanks go on clipboard instead.

" Backup
set nowritebackup
set nobackup
set directory=/tmp//      " prepend(^=) $HOME/.tmp/ toA default path; use full path as backup filename(//)

set hidden                " The current buffer can be put to the background without writing to disk

set hlsearch              " highlight search
set ignorecase            " Do case in sensitive matching with
set smartcase             " be sensitive when there's a capital letter
set incsearch
" }

" Formatting {
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set wrap
set textwidth=0           " Don't wrap lines by default

set backspace=indent,eol,start " more powerful backspacing

set smarttab              " Smarter tab levels
set foldlevelstart=20

syntax on                 " enable syntax
" }

" Visual {
set number                " Show line numbers
set showmatch             " Show matching brackets.
set matchtime=5           " Bracket blinking.
set novisualbell          " No blinking
set noerrorbells          " No noise.
set laststatus=2          " Always show status line.
set vb t_vb=              " disable any beeps or flashes on error
set ruler                 " Show ruler
set showcmd               " Display an incomplete command in the lower right corner of the Vim window
set equalalways

set splitbelow
set splitright

" Auto commands {
au BufRead,BufNewFile {Gemfile,config.ru,*.thor}  set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}     set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}            set ft=gitcommit
" }

" Key mappings {
" Clear last search highlighting
nnoremap <Space> :noh<cr>

let mapleader = ","         " Change leader key

" Navigating between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <c-t> :tabnew<cr>

set tabstop=2             " Set the default tabstop
set softtabstop=2
set shiftwidth=2          " Set the default shift width for indents
set expandtab             " Make tabs into spaces (set by tabstop)
map <Leader>w4 :set tabstop=4<CR>:set softtabstop=4<CR>:set shiftwidth=4<CR>:set expandtab<CR>
map <Leader>w2 :set tabstop=2<CR>:set softtabstop=2<CR>:set shiftwidth=2<CR>:set expandtab<CR>
set list
set listchars=tab:T>

" Keep content after pasting
vnoremap <leader>p "_dP

" Fix for rvm
set shell=/bin/sh

set pastetoggle=<F2>
" }

" sudo write
cmap w!! %!sudo tee > /dev/null %

filetype plugin indent on   " required!

" vim-json
let g:vim_json_syntax_conceal = 0

" Colorscheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Highlight extra white spaces
highlight ExtraWhitespace ctermbg=red guibg=red
" highlight SpecialKey guibg=red ctermbg=red
highlight SpecialKey guibg=#424242 ctermfg=236 ctermbg=234

match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }

" Extend
runtime! vim-include/*.vim
