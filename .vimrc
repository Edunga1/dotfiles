call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'

" Completion
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'

" Requires ag(homebrew)
Plug 'rking/ag.vim'

" Documents
" - Dash needs Dash.app (OSX Only)
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'

" Navigation
 Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" Programming
Plug 'groenewege/vim-less'
Plug 'kchmck/vim-coffee-script'
Plug 'nono/vim-handlebars'
Plug 'slim-template/vim-slim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/matchit.zip'
Plug 'othree/html5.vim'
Plug 'tpope/vim-bundler'
Plug 'alfredodeza/jacinto.vim'
Plug 'rudes/vim-java'
Plug 'fatih/vim-go'
Plug 'elixir-editors/vim-elixir'
Plug 'rhysd/vim-crystal'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'

" Python
Plug 'scrooloose/syntastic'
Plug 'davidhalter/jedi-vim'

" Utility
Plug 'vim-scripts/AutoTag'
Plug 'vim-scripts/ZoomWin'
Plug 'benmills/vimux'
Plug 'airblade/vim-gitgutter'

" Vroom
Plug 'skalnik/vim-vroom'

" Colorscheme
Plug 'altercation/vim-colors-solarized'

" Personal Wiki
Plug 'vimwiki/vimwiki'

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
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <c-t> :tabnew<cr>

" Keep content after pasting
vnoremap <leader>p "_dP

" Run cucumber {
silent! map <unique> <Leader>w :!bundle exec cucumber --profile=wip<CR>
nmap <Leader>r :!ruby %<CR>

" Fix for rvm
set shell=/bin/sh

set pastetoggle=<F2>
" }

" NERDCommenter {
vnoremap <leader><leader> :call NERDComment('nx', 'Toggle')<CR>
vnoremap <Bslash><Bslash> :call NERDComment('nx', 'Toggle')<CR>
noremap <leader><leader> :call NERDComment('n', 'Toggle')<CR>
noremap <Bslash><Bslash> :call NERDComment('n', 'Toggle')<CR>

let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction
" }

" sudo write
cmap w!! %!sudo tee > /dev/null %

filetype plugin indent on   " required!

" Vroom
let g:vroom_map_keys = 0
let g:vroom_use_vimux = 1
map <leader>t :VroomRunTestFile<cr>
map <leader>T :VroomRunNearestTest<cr>

" Vimux
map <Leader>vz :VimuxZoomRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>

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
