set autoindent         " always set autoindenting on
set background=dark
set cursorline         " Highlight current line
set encoding=utf-8
set expandtab          " spaces instead of tab
set hidden             " hide buffers, don't close
set hlsearch           " highlight search terms
set incsearch          " show search matches as you type
set laststatus=2       " show airline always
set nobackup
set nocompatible       " be iMproved, required
set noswapfile
set nowritebackup
set number             " enable line numbers
set shiftwidth=2       " number of spaces to use for autoindenting
set smarttab           " insert tabs on the start of a line according to
                       "    shiftwidth, not tabstop
set tabstop=2          " set tab to 2 spaces

if has("termguicolors")
    set termguicolors
endif

colorscheme quantum

filetype off  " required
syntax enable " enable syntax higlighting

set rtp+=~/.vim/bundle/Vundle.vim " set up vundle
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'kaicataldo/material.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'vim-scripts/upAndDown' " use Shift+up/down to move line
Plugin 'airblade/vim-gitgutter'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'ryanoasis/vim-devicons'
Plugin 'bronson/vim-trailing-whitespace' " paint trailing whitespace red, fix it with FixWhitespace
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'qpkorr/vim-bufkill' " use :BD to close buffer without closing the window
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'w0rp/ale'
Plugin 'fleischie/vim-styled-components'
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""
" Airline
"""""""""""
let g:airline_powerline_fonts = 1                  " use powerline fonts
let g:airline_theme='quantum'                      " set quantum theme
let g:airline_skip_empty_sections = 1              " hide empty sections (err,warning)
let g:airline#extensions#tabline#enabled = 1       " enable advanced tabline
let g:airline#extensions#tabline#show_buffers = 1  " show all buffers when there's only one tab
let g:airline#extensions#tabline#show_splits = 0   " don't display open splits per tab
let g:airline#extensions#tabline#show_tabs = 1     " display tabs
let g:airline#extensions#ycm#enabled = 1           " YouCompleteMe status for airline
let g:airline#extensions#ale#enabled = 1           " ALE linter status for airline

"""""""""""
" ALE async linter
"""""""""""
"let g:airline_section_error = '%{ALEGetStatusLine()}'  " show ALE status in Airline error section
let g:ale_open_list = 1                                " show warnings/errors in loclist window
" list of enabled linters
let g:ale_linters = {
  \ 'javascript': ['eslint', 'jscs']
  \ }
" Fix JavaScript code with ESlint
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']

"""""""""""
" vim-devicons
"""""""""""
"let g:WebDevIconsNerdTreeAfterGlyphPadding = ''  " the amount of space to use after the glyph character
let g:WebDevIconsUnicodeDecorateFolderNodes = 1  " enable folder icons in NERDtree
let g:DevIconsEnableFoldersOpenClose = 1         " enable open/closed folder icons in NERDTree
"let g:DevIconsDefaultFolderOpenSymbol = ' '     " symbol for open folders in NERDTree
"let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ' '

"let g:webdevicons_enable_airline_tabline = 1
"let g:webdevicons_conceal_nerdtree_brackets = 1

"let NERDTreeShowHidden=1  " show hidden files in NERDtree

"let NERDTreeDirArrowExpandable = ' '     " make arrows invisible
"let NERDTreeDirArrowCollapsible = ' '    " make arrows invisible

let g:jsx_ext_required = 0  " Allow JSX in normal JS files

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
