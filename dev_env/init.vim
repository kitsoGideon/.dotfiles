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
filetype plugin indent on
let g:python_host_prog='/usr/bin/python2.7'
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


" set the runtime path to include Vundle and initialize
"set rtp+=~/.nvim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/.nvim/bundle')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'sjl/threesome.vim'
"Plugin 'tpope/vim-fugitive'
"Plugin 'bling/vim-airline'
"Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'pangloss/vim-javascript'
"Plugin 'easymotion/vim-easymotion'
"Plugin 'othree/html5.vim'
"Plugin 'hail2u/vim-css3-syntax'
"Plugin 'justinmk/vim-syntax-extra'
"Plugin 'csexton/snipmate.vim'

" webdev stuff
"Plugin 'itchyny/lightline.vim'
"Plugin 'tpope/vim-surround'
"Plugin 'mattn/emmet-vim'
"Plugin 'skammer/vim-css-color'
"Plugin 'tomtom/tcomment_vim'
"Plugin 'rstacruz/sparkup'
"Plugin 'shemerey/vim-peepopen'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
" plugin from http:/.vim-scripts.org.vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup.vim script is in a subdirectory of this repo called.vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': .vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

"Required
set runtimepath^=~/.nvim/bundle/neobundle.vim/

" Required
call neobundle#begin(expand('~/.nvim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
NeoBundle 'bling/vim-airline'
NeoBundle 'sjl/threesome.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'justinmk/vim-syntax-extra'
NeoBundle 'csexton/snipmate.vim'

" webdev stuff
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'skammer/vim-css-color'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'rstacruz/sparkup'
NeoBundle 'shemerey/vim-peepopen'
"NeoBundle 'Valloric/YouCompleteMe'
"NeoBundle 'rdnetto/YCM-Generator'

" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()
" All of your Plugins must be added before the following line
"call vundle#end()            " required



filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set encoding=utf-8            " Necessary to show unicode glyphs
set t_Co=256           " explicitly tell vim my terminal supports 256 colors
set laststatus=2       " Always show the statusline
set showtabline=2      " Alway show the tabline, even if there is only one tab
set noshowmode         " Hide the default mode text (e.g -- INSERT -- below the statusline)
set list
set listchars=tab:ᐅ\ ,eol:𐒇
colorscheme delek
set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)ྲ
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands

set clipboard+=unnamedplus
set cursorline

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


" my keybinding mappings
noremap <C-s> :w<cr>
inoremap <C-s> <Esc>:w<cr>

let mapleader=","
noremap \ ,

imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
" new line above or below and get out of insert mode

nmap g<C-o> o<ESC>k
nmap gO O<ESC>j

" upper or lowercase the current word
nmap g^ gUiW
nmap gv guiW


" nerdtree stuff
" open nerdtree automatically when opening vim
" autocmd StdinReadPre * let s:std_in=1
"    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" airline status stuff
let g:airline_theme = 'sol'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" get powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
