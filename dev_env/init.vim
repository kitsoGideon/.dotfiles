"
" An example for a.vimrc file.
"
"
" To use it, copy it to
"     for Unix:  ~/.vimrc
"     for Windows:  $VIM\.vimrc

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
let g:python_host_prog='/home/kitso/.pyenv/versions/3.5.1/bin/python'
" Put these in an autocmd group, so that we can delete them easily.
augroup.vimrcEx
  autocmd!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=80

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   execute "normal! g`\"" |
\ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

windo setlocal number

set nocompatible              " be iMproved, required
filetype on                  " required


"Required

" Required
call plug#begin('~/.nvim/bundle/')
" Let Plug manage Plug
" Required

" My Bundles here:
" Refer to |:Plug-examples|.
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'easymotion/vim-easymotion'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css, scss, html' }
Plug 'justinmk/vim-syntax-extra'
Plug 'csexton/snipmate.vim'

" webdev stuff
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'skammer/vim-css-color', { 'for': 'css, scss, html' }
Plug 'tomtom/tcomment_vim'
Plug 'rstacruz/sparkup'

" java completetion
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

" foobits
" Plug 'floobits/floobits-neovim'

Plug 'vim-scripts/CRefVim', { 'for': 'c' }
Plug 'vim-scripts/taglist.vim'
Plug 'plasticboy/vim-markdown', { 'for': 'html, md' }
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'Valloric/YouCompleteMe', { 'for': 'python, c, cpp, cc, cxx, h' }
Plug 'rdnetto/YCM-Generator', { 'for': 'python, c, cpp, cc, cxx, h'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/vim-webdevicons' | Plug 'vim-airline/vim-airline'


call plug#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Put your non-Plugin stuff after this line
set encoding=utf-8     " Necessary to show unicode glyphs
set laststatus=2       " Always show the statusline
set showtabline=2      " Alway show the tabline, even if there is only one tab
" set t_Co = 256           " explicitly tell vim my terminal supports 256 colors
set noshowmode         " Hide the default mode text (e.g -- INSERT -- below the statusline)
set list
set listchars=tab:ᐅ\ ,eol:𐒇
" colorscheme delek
set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)ྲ
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set clipboard+=unnamedplus
set cursorline

" the colorscheme
source ~/.nvim/colors/topfunky-light.vim
" do not use arrows in normal mode
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
noremap <up> <Nop>
" do not use arrows in insert mode
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <up> <Nop>
" do not use arrows in visual mode
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <up> <Nop>

"tabs & indenatation
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set shiftround
set completeopt+=longest


"highlighting hacks
hi LineNr ctermbg = grey
hi normal ctermfg = grey
"

" my keybinding mappings
noremap <C-s> :w<cr> " save in normal mode
inoremap <C-s> <Esc>:w<cr> " save in insert mode and go to normal mode


let mapleader=","
noremap \ ,

imap <leader>' ''<ESC>
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i

map <leader>c <C-_><C-_> " tcomment
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>

" new line above or below and get out of insert mode
map g<C-o> o<ESC>k
nmap gO O<ESC>j

" upper or lowercase the current word
nmap g^ gUiW
nmap gv guiW

" airline status stuff
let g:airline_powerline_fonts=1
let g:airline_theme = "laederon"
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
