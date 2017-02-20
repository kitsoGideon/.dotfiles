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
" Put these in an autocmd group, so that we can delete them easily.

let g:python_host_prog='/usr/bin/python2.7'
let g:python3_host_prog='/home/kitso/.pyenv/versions/3.6.0/bin/python'

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
Plug 'csexton/snipmate.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'arkwright/vim-whiplash'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'ekalinin/Dockerfile.vim', {'for': 'dockerfile'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'roxma/vim-tmux-clipboard'
Plug 'janko-m/vim-test', {'for': ['go', 'rb']}
Plug 'jistr/vim-nerdtree-tabs'
Plug 'sjl/splice.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'thinca/vim-quickrun'
Plug 'nathanaelkane/vim-indent-guides'


" binary files
Plug 'Shougo/vinarise.vim'
let g:vinarise_enable_auto_detect=1

" SQL
Plug 'cosminadrianpopescu/vim-sql-workbench'

" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
"Plug 'scrooloose/syntastic'

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Git stuff
Plug 'jreybert/vimagit'

" Python stuff
Plug 'lambdalisue/vim-pyenv', {'for': 'python'}
Plug 'lepture/vim-jinja', {'for': ['jinja', 'html']}
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'pzxbc/vim-kv', {'for': 'kv'}
Plug 'zchee/deoplete-jedi', {'for': 'python'}

" Arduino
Plug 'jplaut/vim-arduino-ino', {'for': 'ino'}

" webdev stuff
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'html', 'jinja'] }
Plug 'coot/html5-syntax.vim', { 'for': ['css', 'scss', 'html'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html', 'jinja'] }
Plug 'michalliu/jsruntime.vim', { 'for': ['javascript', 'html', 'jinja', 'css', 'scss', 'json'] }
Plug 'michalliu/jsoncodecs.vim', { 'for': ['javascript', 'html', 'jinja', 'css', 'scss', 'json'] }
Plug 'plasticboy/vim-markdown', { 'for': ['html', 'md', 'jinja'] }
Plug 'rstacruz/sparkup'

" java tools
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

" javascript
Plug 'carlitux/deoplete-ternjs', { 'for': 'js', 'do': 'npm install -g tern' }

" GO tools
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'nsf/gocode', { 'for': 'go', 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}

" C and C++
Plug 'justinmk/vim-syntax-extra', {'for': ['c', 'cpp', 'h', 'cxx', 'cc', 'hpp', 'hxx']}
Plug 'zchee/deoplete-clang', {'for': ['c', 'cpp', 'h', 'cxx', 'cc', 'hpp', 'hxx']}
Plug 'Shougo/neoinclude.vim', {'for': ['h', 'hpp', 'hxx']}

" Markdown
Plug 'vim-pandoc/vim-pandoc', {'for': ['md', 'markdown.pandoc']}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': ['md', 'markdown.pandoc']}
" Eyecandy
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'alessandroyorba/sidonia'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
Plug 'ryanoasis/vim-devicons'
Plug 'zefei/vim-colortuner'

" colorschemes
Plug 'NLKNguyen/papercolor-theme' "using it for the airline prompt
Plug 'fneu/breezy'
Plug 'zanglg/nova.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'tyrannicaltoucan/vim-quantum'
"Plug 'cohlin/vim-colorschemes'
"Plug 'caglartoklu/ftcolor.vim'
"Plug 'morhetz/gruvbox'
"Plug 'google/vim-colorscheme-primary'


call plug#end()

" To ignore plugin indent changes, instead use:
"filetype plugin on
" Put your non-Plugin stuff after this line
"
set encoding=utf-8     " Necessary to show unicode glyphs
set laststatus=2       " Always show the statusline
set showtabline=2      " Alway show the tabline, even if there is only one tab
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

"tabs & indenatation
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set shiftround
set completeopt+=longest

" change leader key from / to ,
let mapleader=","
noremap \ ,

" EYE CANDY
let java_highlight_functions = 1
colorscheme quantum

" airline Status stuff
let g:airline_powerline_fonts=1
let g:airline_theme='quantum'
let g:quantum_italics = 1
let g:quantum_black = 1

" Ale stuff
let g:ale_sign_error = "\u2717"
let g:ale_sign_warning = "\u26A0"

let g:tagbar_width = 35
let g:NERDTreeWinSize = 25

" vim-go stuff
let g:go_list_type = "quickfix" " avoids conflicts with syntatstic

" deoplte-clang stuff
let g:deoplete#sources#clang#libclang_path = '/usr/lib/x86_64-linux-gnu/libclang-4.0.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-4.0/lib/clang/4.0.0/'

" do not use arrows in normal mode
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
noremap <up> <Nop>
"do not use arrows in visual mode
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <up> <Nop>

" remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" set backup directory
set bdir=/home/kitso/.local/share/nvim/backup

" run python code from vim
map <f5> :w <CR>!clear <CR>:!python % <CR>

" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
au VimResized * exe "normal! \<c-w>="

" NERDTree Toggle
nnoremap <leader>n :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
" show current file in NerdTree
map <silent> <C-s> :NERDTree<CR><C-w>p:NERDTreeFind<CR>

" reselect visual block after indentation
vnoremap < <gv
vnoremap > >gv

" absolute line numbers in insert mode, relative otherwise for easy movement
au InsertEnter * :set nu
au InsertLeave * :set rnu

" spelling
"set spell spelllang=en_us
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype jinja setlocal ts=2 sw=2 expandtab
autocmd Filetype jinja2 setlocal ts=2 sw=2 expandtab
"autocmd Filetype jinja setlocal ts=2 sw=2 expandtab

"highlightingf hacks
hi LineNr ctermbg = grey
hi normal ctermfg = grey
"

" my keybinding mappings
noremap <C-s> :w<cr> " save in normal mode
inoremap <C-s> <Esc>:w<cr> " save in insert mode and go to normal mode
" save and exit
noremap <C-x> :wq<cr> " save in normal mode and exit
inoremap <C-x> <Esc>:wq<cr> " save in insert mode and exit

" tabs
map <leader>l <esc>:tabnext<CR>
map <leader>h <esc>:tabprevious<CR>


imap <leader>' ''<ESC>
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>% %%<ESC>i

nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>
nmap <F8> :TagbarToggle<CR>

" new line above or below and get out of insert mode
noremap g<C-o> o<ESC>k
noremap gO O<ESC>j

" upper or lowercase the current word
noremap g^ gUiW
noremap gv guiW
vnoremap g^ gUi<ESC>
vnoremap gv gui<ESC>

" vim-jedi stuff
autocmd CompleteDone * pclose

"" pydiction stuff
"let g:pydiction_location = '/home/kitso/.nvim/bundle/Pydiction/complete-dict'
" CSS & HTML autocompletion
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
