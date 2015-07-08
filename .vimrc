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
Plugin 'flazz/vim-colorschemes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'


call vundle#end()

" Glug
source /usr/share/vim/google/google.vim

Glug codefmt gofmt_executable=goimports
Glug codefmt-google auto_all=1
Glug gtimporter
Glug piper plugin[mappings]
Glug relatedfiles plugin[mappings]
Glug youcompleteme-google
Glug g4
Glug ultisnips-google
Glug google-logo
Glug mru
Glug outline-window
Glug blazedeps
Glug refactorer
Glug syntastic-google checkers=`{'python': 'gpylint'}`
Glug whitespace highlight autotrimeof autotrimtrailing
Glug blaze
Glug autogen
Glug coverage
Glug coverage-google
Glug googlespell

" Vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
nmap L :bnext<CR>
nmap H :bprevious<CR>
nmap X :bp <BAR> bd #<CR>


" easyMotion
map f <Plug>(easymotion-jumptoanywhere)

" CamelCaseMotion
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

" Blaze deps update
nnoremap <leader>b :BlazeDepsUpdate<CR>

" Mru(Most recent files)
nnoremap <leader>m :MruWindow<CR>

" Outline window
nnoremap <leader>o :GoogleOutlineWindow<CR>

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
let g:ctrlp_root_markers = ['METADATA']
let g:ctrlp_working_path_mode = 'ra'

" Visual config
set listchars=tab:▸-

" Clipboard to system clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
set clipboard=unnamedplus

" Column 80 bar
set colorcolumn=81
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Auto save vim config
autocmd! bufwritepost .vimrc source %

filetype plugin indent on

" Color schema
set t_Co=256
if has('gui_running')
  set background=light
else
  let g:solarized_termcolors=256
  set background=dark
endif
colorscheme solarized

"Internal vim setting
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set mouse=a		" Enable mouse usage (all modes)
set nu                  " Display line num
