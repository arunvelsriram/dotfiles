syntax on                      " enable syntax highlighting
set number                     " enable line number
set nocompatible               " be iMproved, required
filetype off                   " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" nerdtree
Plugin 'scrooloose/nerdtree'

" gitgutter
Plugin 'airblade/vim-gitgutter'

" solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" sorround
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()              " required
filetype plugin indent on      " required


