call plug#begin()

" Colorscheme
Plug 'altercation/vim-colors-solarized' " vim color scheme

" Git
Plug 'tpope/vim-fugitive'               " a git wrapper
Plug 'airblade/vim-gitgutter'           " shows a git diff in the gutter

" Completion
Plug 'ervandew/supertab'                " Perform all your vim insert mode completions with Tab
Plug 'SirVer/ultisnips'                 " The ultimate snippet solution for Vim

" Navigation
Plug 'scrooloose/nerdtree'              " a tree explorer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                 " a fuzzy finder. requires fzf adove
Plug 'majutsushi/tagbar'                " displays tags in a window. requires universal-ctags
Plug 'mhinz/vim-startify'               " The fancy start screen for Vim
Plug 'itchyny/vim-gitbranch'            " - vim-startify requires this
Plug 'junegunn/goyo.vim'                " Distraction-free writing in Vim. :Goyo

" Vim Improvements
Plug 'tpope/vim-surround'               " quoting/parenthesizing made simple
Plug 'tpope/vim-repeat'                 " enable repeating supported plugin maps with dot operator

" LSP
Plug 'neovim/nvim-lspconfig'              " Quickstart configs for Nvim LSP
Plug 'williamboman/mason.nvim'            " Portable package manager for Neovim
Plug 'williamboman/mason-lspconfig.nvim'  " Extension to mason.nvim
Plug 'jose-elias-alvarez/null-ls.nvim'    " Inject LSP diagnostics, code actions, and more via Lua
Plug 'nvim-lua/plenary.nvim'              " - null-ls.nvim requires this

" Programming
Plug 'groenewege/vim-less'              " vim syntax for LESS
Plug 'scrooloose/nerdcommenter'         " Comment functions so powerful—no comment necessary
Plug 'terryma/vim-expand-region'        " allows you to visually select increasingly larger regions of text
                                        " Press + to expand the visual selection and _ to shrink it.
Plug 'nicwest/vim-camelsnek'            " Convert between camel and snek case
Plug 'sheerun/vim-polyglot'             " A collection of language packs for Vim. syntax highlighting and etc.
                                        " - csv.vim

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
Plug 'Vimjas/vim-python-pep8-indent'    " This modifies Vim’s indentation behavior to comply with PEP8

" Utility
Plug 'vim-scripts/AutoTag'              " Updates entries in a tags file automatically when saving
Plug 'vim-scripts/ZoomWin'              " zoom in/out of windows (<c-w>o to toggle)
Plug 'vim-airline/vim-airline'          " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'   " a collection of themes for vim-airline

" vim objects
Plug 'michaeljsmith/vim-indent-object'  " This plugin defines a new text object, based on indentation levels.
Plug 'wellle/targets.vim'               " Adds various text objects to give you more targets to operate on
Plug 'jeetsukumaran/vim-pythonsense'    " Pythonsense is a Vim plugin that provides text objects and motions
                                        " for Python classes, methods, functions, and doc strings.

" Etc.
Plug 'vimwiki/vimwiki', { 'branch': 'dev' } " Personal wiki for vim
Plug 'dhruvasagar/vim-table-mode'

call plug#end()

" General
set encoding=utf-8
set nocompatible          " disable vi compatibility.
set history=256           " Number of things to remember in history.
set autowrite             " Writes on make/shell commands
set autoread
set timeoutlen=250        " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed    " Yanks go on clipboard instead.
set path+=**              " Search all subdirectories and recursively

" Backup
set nowritebackup
set nobackup
set directory=/tmp//      " prepend(^=) $HOME/.tmp/ toA default path; use full path as backup filename(//)

set hidden                " The current buffer can be put to the background without writing to disk
set updatetime=300        " CursorHold evet waiting time.

" Search
set hlsearch              " highlight search
set ignorecase            " Do case in sensitive matching with
set smartcase             " be sensitive when there's a capital letter
set incsearch

" Formatting
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

" Visual
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
set numberwidth=3         " gutter column width

set splitbelow
set splitright
set shell=/bin/sh
set background=dark
set list
set listchars=tab:T>

" Highlight special keys and extra white spaces
autocmd ColorScheme *
  \ highlight SpecialKey guibg=#424242 ctermfg=236 ctermbg=234 |
  \ highlight ExtraWhitespace ctermbg=red guibg=red |
  \ match ExtraWhitespace /\s\+$/ |
  \ autocmd BufWinEnter * match ExtraWhitespace /\s\+$/ |
  \ autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/ |
  \ autocmd InsertLeave * match ExtraWhitespace /\s\+$/ |
  \ autocmd BufWinLeave * call clearmatches()

" Auto commands
au BufRead,BufNewFile {Gemfile,config.ru,*.thor}  set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}     set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}            set ft=gitcommit

filetype plugin indent on   " required!

" Key mappings
let mapleader = ","
set pastetoggle=<F2>

" Bind W to writing
command! W  write

" Clear last search highlighting
nnoremap <Space> :noh<cr>

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

" Change tab size
map <Leader>w4 :set tabstop=4<CR>:set softtabstop=4<CR>:set shiftwidth=4<CR>:set expandtab<CR>
map <Leader>w2 :set tabstop=2<CR>:set softtabstop=2<CR>:set shiftwidth=2<CR>:set expandtab<CR>

" Keep content after pasting
vnoremap <leader>p "_dP

" Neovim initialization
if has('nvim')
  set inccommand=nosplit  " highlights during a substitution in progress
endif

" Extend
runtime! vim-include/*.vim

" Call for profiling
function! StartProfiling()
  :profile start vim-profiling.log
  :profile file *
  :profile func *
  echo 'profiling is started. log file: vim-profiling.log'
endfunction

