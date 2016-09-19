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
" let g:python_host_prog='/home/kitso/.pyenv/versions/3.5.1/bin/python'
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

filetype plugin indent on    " required

call plug#begin('~/.nvim/bundle/')
" Let Plug manage Plug
" Required

" My Bundles here:
" Refer to |:Plug-examples|.
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-syntax-extra'
Plug 'csexton/snipmate.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/taglist.vim'
Plug 'arkwright/vim-whiplash'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'ekalinin/Dockerfile.vim'
Plug 'lepture/vim-jinja'
Plug 'cohlin/vim-colorschemes'
Plug 'Shougo/vinarise.vim'
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/vim-tmux-clipboard'
Plug 'janko-m/vim-test'


" Git stuff
Plug 'jreybert/vimagit'

" Python stuff
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
"Plug 'tmhedberg/SimpylFold', {'for': 'python'}

" Arduino
Plug 'jplaut/vim-arduino-ino'

" webdev stuff
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'html', 'jinja'] }
Plug 'coot/html5-syntax.vim', { 'for': ['css', 'scss', 'html'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html', 'jinja'] }
Plug 'michalliu/jsruntime.vim', { 'for': ['javascript', 'html', 'jinja', 'css', 'scss', 'json'] }
Plug 'michalliu/jsoncodecs.vim', { 'for': ['javascript', 'html', 'jinja', 'css', 'scss', 'json'] }
"Plug 'michalliu/sourcebeautify.vim',  { 'for': ['css', 'scss', 'html', 'jinja'] }
Plug 'plasticboy/vim-markdown', { 'for': ['html', 'md', 'jinja'] }
Plug 'rstacruz/sparkup'
" java completetion
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

" GO tools
Plug 'fatih/vim-go', {'for': 'go'}

" C and C++
Plug 'arakashic/chromatica.nvim', {'for': ['c', 'cpp', 'h']}
let g:chromatica#libclang_path='/usr/local/opt/llvm/lib/libclang.so'
let g:chromatica#responsive_mode=1
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Eyecandy
Plug 'cohlin/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'


call plug#end()
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Put your non-Plugin stuff after this line
" the colorscheme
set encoding=utf-8     " Necessary to show unicode glyphs
set laststatus=2       " Always show the statusline
set showtabline=2      " Alway show the tabline, even if there is only one tab
" set t_Co = 256           " explicitly tell vim my terminal supports 256 colors
set noshowmode         " Hide the default mode text (e.g -- INSERT -- below the statusline)
set list
set listchars=tab:ᐅ\ ,eol:𐒇
set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)ྲ
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set clipboard+=unnamedplus
set cursorline
set autoread

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
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" foldmethod
" absolute line numbers in insert mode, relative otherwise for easy movement
au InsertEnter * :set nu
au InsertLeave * :set rnu


" automatically reload vimrc when it's saved
"au BufWritePost ~/.dotfiles/dev_env/init.vim so ~/.dotfiles/dev_env/init.vim


" spelling
"set spell spelllang=en_us
autocmd Filetype html setlocal ts=2 sw=2 expandtab
"autocmd Filetype jinja setlocal ts=2 sw=2 expandtab

"highlighting hacks
hi LineNr ctermbg = grey
hi normal ctermfg = grey
"

" my keybinding mappings
noremap <C-s> :w<cr> " save in normal mode
inoremap <C-s> <Esc>:w<cr> " save in insert mode and go to normal mode

" tabs
map <leader>l <esc>:tabnext<CR>
map <leader>h <esc>:tabprevious<CR>

let mapleader=","
noremap \ ,

imap <leader>' ''<ESC>
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>% %%<ESC>i

nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>

" new line above or below and get out of insert mode
noremap g<C-o> o<ESC>k
noremap gO O<ESC>j

" upper or lowercase the current word
noremap g^ gUiW
noremap gv guiW
vnoremap g^ gUi
vnoremap gv gui

" airline status stuff
let g:airline_powerline_fonts=1
let g:airline_theme = "darcula"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


" EYE CANDY
source ~/.nvim/colors/mytopfunky.vim
"colorscheme delek
