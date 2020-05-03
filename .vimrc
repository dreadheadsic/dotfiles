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
set mouse=a
set ttymouse=xterm2
set clipboard=unnamedplus " use system clipboard
set colorcolumn=100

set path=.,src,node_modules
set suffixesadd=.js,.jsx,.ts,.tsx

if has("termguicolors")
    set termguicolors
endif

filetype off  " required
syntax enable " enable syntax higlighting

call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'KeitaNakamura/neodark.vim'
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim'
Plug 'mhartington/oceanic-next'
Plug 'rakr/vim-one'
Plug 'vim-scripts/upAndDown' " use Shift+up/down to move line
Plug 'airblade/vim-gitgutter'
" Plug 'severin-lemaignan/vim-minimap'
Plug 'ryanoasis/vim-devicons'
Plug 'bronson/vim-trailing-whitespace' " paint trailing whitespace red, fix it with FixWhitespace
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'qpkorr/vim-bufkill' " use :BD to close buffer without closing the window
" Plug 'Valloric/YouCompleteMe'
" Plugin 'ternjs/tern_for_vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'styled-components/vim-styled-components', { 'branch': 'main'  }
" Plug 'kien/ctrlp.vim'
Plug 'zivyangll/git-blame.vim'
" Plugin 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'hzchirs/vim-material'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tpope/vim-commentary'
" Plug 'Yggdroot/LeaderF'

call plug#end()

colorscheme onedark
" transparent background
hi Normal guibg=NONE ctermbg=NONE

"""""""""""
" Airline
"""""""""""
let g:airline_powerline_fonts = 1                  " use powerline fonts
let g:airline_theme='onedark'                      " set quantum theme
let g:airline_skip_empty_sections = 1              " hide empty sections (err,warning)
let g:airline#extensions#tabline#enabled = 1       " enable advanced tabline
let g:airline#extensions#tabline#show_buffers = 1  " show all buffers when there's only one tab
let g:airline#extensions#tabline#show_splits = 0   " don't display open splits per tab
let g:airline#extensions#tabline#show_tabs = 1     " display tabs
" let g:airline#extensions#ycm#enabled = 1           " YouCompleteMe status for airline
let g:airline#extensions#ale#enabled = 1           " ALE linter status for airline

"""""""""""
" ALE async linter
"""""""""""
" let g:airline_section_error = '%{ale#statusline#Status()}'  " show ALE status in Airline error section
let g:ale_open_list = 1                                " show warnings/errors in loclist window
" list of enabled linters
let g:ale_linters = {
  \ 'javascript': ['eslint']
  \ }
" Fix JavaScript code with ESlint
let g:ale_fixers = ['eslint']
" let g:ale_fixers.javascript = ['eslint']

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

"""""""""""
" coc.nvim
"""""""""""
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>
" ctrl-p opens fzf
nnoremap <silent> <C-p> :FZF<CR>
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 } }

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" LeaderF settings
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 1
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

autocmd BufEnter *.{js,ts,jsx,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,ts,jsx,tsx} :syntax sync clear

command JsonFormat %!jq '.' " formats json in current buffer
