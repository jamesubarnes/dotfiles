" Make Vim more useful
set nocompatible
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Change mapleader
let mapleader=","
" Respect modeline in files
set modeline
set modelines=4
" Enable syntax highlighting
syntax on
set re=0
" Tabs vs spaces
set noexpandtab
set tabstop=2
set shiftwidth=2
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Automatic commands
if has("autocmd")
	" Enable file type detection
  filetype on
endif

" Theme
" git clone https://github.com/catppuccin/vim.git ~/.vim/pack/plugins/start/catppuccin
set termguicolors
colorscheme catppuccin_mocha
