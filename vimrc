syntax on                      " enable syntax highlighting
set number                     " enable line number
set hlsearch                   " highlight search matches
set nocompatible               " be iMproved, required
set tabstop=2                  " (ts) width (in spaces) that a <tab> is displayed as
set expandtab                  " (et) expand tabs to spaces (use :retab to redo entire file)
set shiftwidth=2               " (sw) width (in spaces) used in each step of autoindent (aswell as << and >>)
let NERDTreeShowHidden=1       " show hidden files and folder in nerdtree explorer

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" nerdtree
Plugin 'scrooloose/nerdtree'

" solarized theme
Plugin 'altercation/vim-colors-solarized'

" open nerdtree explorer if no args are passwd to vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if only window left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" gitgutter
Plugin 'airblade/vim-gitgutter'

" Terraform support
Plugin 'hashivim/vim-terraform'

" All of your Plugins must be added before the following line
call vundle#end()              " required
filetype plugin indent on      " required

