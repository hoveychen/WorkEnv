set nocompatible
syntax on

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'davidhalter/jedi'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'tpope/vim-sensible'
Plugin 'Valloric/MatchTagAlways'
Plugin 'bkad/CamelCaseMotion'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-run-interactive'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/html5.vim'
Plugin 'Raimondi/delimitMate'


call vundle#end()

" Leader command
let mapleader=' '

" Vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11

nmap L :bnext<CR>
nmap H :bprevious<CR>
nmap X :bp <BAR> bd #<CR>

" Run Interactive
nnoremap <leader>r :RunInInteractiveShell<space>

" Tagbar
nnoremap <leader>t :TagbarToggle<CR>

" NERD Tree
nnoremap <leader>n :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif " Automatically open a NERDTree if no files where specified

" easyMotion
map f <Plug>(easymotion-jumptoanywhere)

" CamelCaseMotion
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

" YCM
nnoremap <leader>g :YcmCompleter GoTo<CR>

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" Syntastic
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_mode_map = {'mode': 'passive'}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlP
nnoremap <leader>c :CtrlP<CR>
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .ds_store
      \ --ignore "**/*.pyc"
      \ --ignore .git5_specs
      \ --ignore review
      \ --ignore ".fuse_*"
      \ -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_root_markers = ['README.md']
let g:ctrlp_working_path_mode = 'ra'

" Visual config
set listchars=tab:▸-

" Clipboard to system clipboard
"nnoremap <C-y> "+y
"vnoremap <C-y> "+y
"nnoremap <C-p> "+gP
"vnoremap <C-p> "+gP
"set clipboard=unnamedplus
"
"

" GoTags in Tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" Column 80 bar
set colorcolumn=81
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Auto save vim config
autocmd! bufwritepost .vimrc source %

filetype plugin indent on

" Color schema
set background=dark
if has('gui_running')
else
  set t_Co=256
  let g:solarized_termcolors=256
  set background=dark
endif
colorscheme solarized

"Internal vim setting
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set mouse=a		" Enable mouse usage (all modes)
set nu                  " Display line num

" Silver searcher
set grepprg=ag\ --nogroup\ --nocolor

" Window moving
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
