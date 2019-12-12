" vim: ts=2 sw=2

" Load defaults.vim
source $VIMRUNTIME/defaults.vim

" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  	 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load vim-plug and plugins
if !empty(glob('~/.vim/autoload/plug.vim'))
call plug#begin('~/.vim/plugged')
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
call plug#end()
endif

" Track undo history in ~/.vim/undo
if !isdirectory( $HOME . '.vim/undo') | call mkdir($HOME . '/.vim/undo', 'p') | endif
set undofile
set undodir^=$HOME/.vim/undo//

" Keep file backups in ~/.vim/backup
if !isdirectory( $HOME . '.vim/backup') | call mkdir($HOME . '/.vim/backup', 'p') | endif
set backup
set backupdir^=$HOME/.vim/backup//

" Don't create swapfiles
set noswapfile

set number                            " Show number column
set colorcolumn=80                    " Make the 80th column of a line visible
set nowrap                            " Don't autowrap lines

" Yanking copies to clipboard
set clipboard+=unnamed

" Leader is ,
let mapleader = ','

" CTRL P configuration
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command =
  \ ['.git', 'cd %s && git ls-files -co --exclude-standard']

" NERDTree configuration
map <Leader>d :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
