if empty(globpath(&runtimepath, 'autoload/plug.vim'))
  echoerr "vim-plug is not found. plugins are not loaded."
else

call plug#begin()

" Git
Plug 'tpope/vim-fugitive'               " a git wrapper
Plug 'airblade/vim-gitgutter'           " shows a git diff in the gutter

" Completion
Plug 'ervandew/supertab'                " Perform all your vim insert mode completions with Tab
Plug 'github/copilot.vim'               " Neovim plugin for GitHub Copilot

" Navigation
Plug 'scrooloose/nerdtree'              " a tree explorer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                 " a fuzzy finder. requires fzf adove
Plug 'majutsushi/tagbar'                " displays tags in a window. requires universal-ctags
Plug 'mhinz/vim-startify'               " The fancy start screen for Vim
Plug 'junegunn/goyo.vim'                " Distraction-free writing in Vim. :Goyo

" Vim Improvements
Plug 'tpope/vim-surround'               " quoting/parenthesizing made simple
Plug 'tpope/vim-repeat'                 " enable repeating supported plugin maps with dot operator
Plug 'rmagatti/auto-session'            " A small automated session manager for Neovim

" LSP
Plug 'neovim/nvim-lspconfig'              " Quickstart configs for Nvim LSP
Plug 'williamboman/mason.nvim'            " Portable package manager for Neovim
Plug 'williamboman/mason-lspconfig.nvim'  " Extension to mason.nvim
Plug 'jose-elias-alvarez/null-ls.nvim'    " Inject LSP diagnostics, code actions, and more via Lua
Plug 'nvim-telescope/telescope.nvim'      " a highly extendable fuzzy finder over lists
Plug 'nvim-lua/plenary.nvim'              " - several nvim plugins require this
" - completion
Plug 'hrsh7th/cmp-nvim-lsp'               " nvim-cmp source for neovim builtin LSP client.
Plug 'hrsh7th/nvim-cmp'                   " A completion plugin for neovim.

" All languages
Plug 'scrooloose/nerdcommenter'         " Comment functions so powerful—no comment necessary
Plug 'nicwest/vim-camelsnek'            " Convert between camel and snek case
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter-textobjects'           " Syntax aware text-objects, select, move, swap, and peek support.

" HTML/CSS
Plug 'groenewege/vim-less'              " vim syntax for LESS

" Javascript/Typescript
Plug 'pangloss/vim-javascript'          " Vastly improved Javascript indentation and syntax support in Vim
Plug 'leafgarland/typescript-vim'       " Typescript syntax files for Vim

" Markdown
Plug 'godlygeek/tabular'                " Vim script for text filtering and alignment. vim-markdown uses this.
Plug 'preservim/vim-markdown'           " Syntax highlighting, matching rules and mappings
Plug 'img-paste-devs/img-paste.vim'     " paste image to markdown

" Python
Plug 'Vimjas/vim-python-pep8-indent'    " This modifies Vim’s indentation behavior to comply with PEP8

" Vimscript
Plug 'junegunn/vader.vim'               " A simple Vimscript test framework

" csv
Plug 'chrisbra/csv.vim'                 " A Filetype plugin for csv files

" Utility
Plug 'vim-scripts/ZoomWin'              " zoom in/out of windows (<c-w>o to toggle)
Plug 'vim-airline/vim-airline'          " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'   " a collection of themes for vim-airline

" Vim objects
Plug 'michaeljsmith/vim-indent-object'  " This plugin defines a new text object, based on indentation levels.
Plug 'wellle/targets.vim'               " Adds various text objects to give you more targets to operate on

" Etc.
Plug 'dhruvasagar/vim-table-mode'       " VIM Table Mode for instant table creation.
Plug 'vimwiki/vimwiki'                  " Personal Wiki for Vim
Plug 'edunga1/vimwiki-link'             " Experimental plugin for Vimwiki
Plug 'sainnhe/sonokai'

call plug#end()
endif

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
au BufRead,BufNewFile {*.tsx,*.jsx}               set ft=typescriptreact

" Highlight PopUp menu
highlight! link Pmenu Visual

filetype plugin indent on   " required!

" Key mappings
let mapleader = ","
set pastetoggle=<F2>

" Bind W to writing
command! W  write

" Clear last search highlighting
nnoremap <space> <cmd>noh<cr>

" Navigating between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <s-h> gT
nnoremap <s-l> gt
nnoremap <c-t> :tabnew<cr>
nnoremap [b <cmd>bp<cr>
nnoremap ]b <cmd>bn<cr>

" quickfix and location list
nnoremap \q <cmd>copen<cr>
nnoremap [q <cmd>cprevious<cr>
nnoremap ]q <cmd>cnext<cr>
nnoremap \w <cmd>lopen<cr>
nnoremap [w <cmd>lprevious<cr>
nnoremap ]w <cmd>lnext<cr>

" Change tab size
map <leader>w4 <cmd>set tabstop=4<cr><cmd>set softtabstop=4<cr><cmd>set shiftwidth=4<cr><cmd>set expandtab<cr>
map <leader>w2 <cmd>set tabstop=2<cr><cmd>set softtabstop=2<cr><cmd>set shiftwidth=2<cr><cmd>set expandtab<cr>

" Keep content after pasting
vnoremap <leader>p "_dP

" built-in terminal
" - go back to normal mode with <leader><esc>
tnoremap <leader><esc> <c-\><c-n>
set shell=/bin/zsh

" Neovim initialization
if has('nvim')
  set inccommand=nosplit  " highlights during a substitution in progress
endif

" Extend the runtimepath to include the vim-include directory
runtime! vim-include/*.vim
