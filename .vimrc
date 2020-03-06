call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'altercation/vim-colors-solarized'

" Git
Plug 'tpope/vim-fugitive'               " a git wrapper
Plug 'airblade/vim-gitgutter'           " shows a git diff in the gutter

" Completion
Plug 'ervandew/supertab'                " Perform all your vim insert mode completions with Tab
Plug 'SirVer/ultisnips'                 " The ultimate snippet solution for Vim

" Documentation
" - Dash needs Dash.app (OSX Only)
Plug 'rizzatti/dash.vim'                " search Dash.app from Vim
Plug 'rizzatti/funcoo.vim'              " use by dash.vim

" Navigation
Plug 'scrooloose/nerdtree'              " a tree explorer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                 " a fuzzy finder. requires fzf adove
Plug 'majutsushi/tagbar'                " displays tags in a window. requires universal-ctags
Plug 'mhinz/vim-startify'               " The fancy start screen for Vim

" Programming
Plug 'neoclide/coc.nvim', {'branch': 'release'} " full language server protocol support as VSCode
Plug 'tpope/vim-surround'               " quoting/parenthesizing made simple
Plug 'groenewege/vim-less'              " vim syntax for LESS
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'                 " repeat.vim: enable repeating supported plugin maps with dot operator
Plug 'terryma/vim-expand-region'        " allows you to visually select increasingly larger regions of text
                                        " Press + to expand the visual selection and _ to shrink it.

" HTML
Plug 'vim-scripts/matchit.zip'          " extended % matching for HTML, LaTeX, and many other languages

" Javascript & Typescript
Plug 'pangloss/vim-javascript'          " Vastly improved Javascript indentation and syntax support in Vim
Plug 'mxw/vim-jsx'                      " React JSX syntax highlighting and indenting for vim
Plug 'leafgarland/typescript-vim'       " Typescript syntax files for Vim

" Markdown
Plug 'godlygeek/tabular'                " Vim script for text filtering and alignment. vim-markdown uses this.
Plug 'plasticboy/vim-markdown'          " Syntax highlighting, matching rules and mappings

" Python
Plug 'jeetsukumaran/vim-pythonsense'    " A Vim plugin that provides text objects

" Utility
Plug 'vim-scripts/AutoTag'              " Updates entries in a tags file automatically when saving
Plug 'vim-scripts/ZoomWin'              " zoom in/out of windows (<c-w>o to toggle)
Plug 'vim-airline/vim-airline'          " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'   " a collection of themes for vim-airline

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

call plug#end()

" General {
set encoding=utf-8
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
set updatetime=300        " CursorHold evet waiting time.

set hlsearch              " highlight search
set ignorecase            " Do case in sensitive matching with
set smartcase             " be sensitive when there's a capital letter
set incsearch
" }

" Formatting {
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set textwidth=0           " Don't wrap lines by default

set backspace=indent,eol,start " more powerful backspacing

set foldlevelstart=20

set smarttab              " Smarter tab levels
set tabstop=2             " Set the default tabstop
set expandtab             " Make tabs into spaces (set by tabstop)
set shiftwidth=2          " Set the default shift width for indents
set softtabstop=2

syntax on                 " enable syntax
" }

" Visual {
set wrap
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
set wildmenu              " command line completion

set splitbelow
set splitright
set shell=/bin/sh
set background=dark
set list
set listchars=tab:T>

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
nnoremap <s-h> gT
nnoremap <s-l> gt
nnoremap <c-t> :tabnew<cr>
nnoremap [b :bp<cr>
nnoremap ]b :bn<cr>

map <Leader>w4 :set tabstop=4<CR>:set softtabstop=4<CR>:set shiftwidth=4<CR>:set expandtab<CR>
map <Leader>w2 :set tabstop=2<CR>:set softtabstop=2<CR>:set shiftwidth=2<CR>:set expandtab<CR>

" Keep content after pasting
vnoremap <leader>p "_dP

set pastetoggle=<F2>
" }

filetype plugin indent on   " required!

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

" Neovim
if has('nvim')
  set inccommand=nosplit  " highlights during a substitution in progress
endif

" Extend
runtime! vim-include/*.vim
