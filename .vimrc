" execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
filetype off

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

  if exists("+lines")
    set lines=30
  endif
  if exists("+columns")
    set columns=100
  endif
endif

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

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

" On-demand loading
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'}

Plugin 'Valloric/YouCompleteMe', { 'do': './install.sh' }

call vundle#end()

filetype plugin indent on

" use seoul256 color scheme
colorscheme seoul256

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
set encoding=utf-8
let g:Powerline_symbols = 'unicode'
