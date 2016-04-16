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


"Required
set runtimepath^=~/.nvim/bundle/neobundle.vim/

" Required
call neobundle#begin(expand('~/.nvim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
NeoBundle 'sjl/splice.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'ctrlpvim/ctrlp.vim'
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

" java completetion
NeoBundle 'artur-shaik/vim-javacomplete2'

" foobits
" NeoBundle 'floobits/floobits-neovim'

NeoBundle 'vim-scripts/CRefVim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'jmcantrell/vim-virtualenv'
" NeoBundle 'vim-scripts/vim-webdevicons'

" NeoBundle 'artur-shaik/vim-javacomplete2'
" NeoBundle 'Valloric/YouCompleteMe'
" NeoBundle 'rdnetto/YCM-Generator'

NeoBundle 'scrooloose/nerdtree'
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Put your non-Plugin stuff after this line
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Italic\11
set encoding=utf-8     " Necessary to show unicode glyphs
set laststatus=2       " Always show the statusline
set showtabline=2      " Alway show the tabline, even if there is only one tab
set t_Co=256           " explicitly tell vim my terminal supports 256 colors
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

" the colorscheme
"source ~/.nvim/colors/desertEx.vim
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

 if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif


let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''


