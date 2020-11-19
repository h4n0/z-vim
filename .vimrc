syntax on

set nocompatible
filetype off

" search first in current directory then file directory for tag file
set tags=tags;/

set cursorline
set cursorcolumn

if has("gui_running")
  syntax enable
  set background=dark
  colorscheme solarized " GUI is running or is about to start.
  set lines=80 columns=150
else
  " This is console Vim.
  
  " set line number on the left
  set number

"  if exists("+lines")
"    set lines=30
"  endif
"  if exists("+columns")
"    set columns=100
"  endif
endif

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamedplus

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" set up gutentags
"let g:gutentags_trace = 1

" set up leaderF
let g:Lf_ShortcutF = '<c-p>'
noremap <c-n> :LeaderfFunction!<cr>

" use plugin manager from gmarik/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Make sure you use single quotes
Plugin 'junegunn/seoul256.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic' 
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'rhysd/vim-clang-format'
Plugin 'tpope/vim-fugitive'
"Plugin 'mindriot101/vim-yapf'

" add clang format params
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:clang_format#code_style = 'google'
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : 0,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "ColumnLimit" : 100,
            \ "BreakBeforeBraces" : "Allman"}

" config python yapf
"let g:yapf_style = "google"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" set rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" set vim-powerline
set laststatus=2
set encoding=UTF-8
let g:Powerline_symbols = 'unicode'

""""""""""syntastic""""""""""""
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
""whether to show balloons
let g:syntastic_enable_balloons = 1
" disable check for python
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

" On-demand loading
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'}

Plugin 'Valloric/YouCompleteMe', { 'do': './install.sh' }

" Add Rust support
Plugin 'rust-lang/rust.vim'

call vundle#end()

" use seoul256 color scheme
colorscheme seoul256


filetype plugin indent on
