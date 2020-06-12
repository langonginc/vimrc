call plug#begin('~/.vim/plugged')
  Plug 'itchyny/lightline.vim'
  " Coc.vim
  " Something was wrong in this : Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} 
  Plug 'liuchengxu/vim-which-key'
  " Neo Something
  Plug 'sbdchd/neoformat'
  " File Tree
  Plug 'scrooloose/nerdtree'
  " (Pair
  Plug 'jiangmiao/auto-pairs'
  " File Tree HighLight
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Code Highlight
  Plug 'scrooloose/syntastic'
  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'terryma/vim-multiple-cursors'
  " Function Tag
  Plug 'majutsushi/tagbar'
  " Vim start
  Plug 'mhinz/vim-startify'
  " Theme
  "Plug 'connorholyday/vim-snazzy'
  "Plug 'morhetz/gruvbox'
  "Plug 'dracula/vim', { 'as': 'dracula' }  
  Plug 'sickill/vim-monokai'
  Plug 'joshdick/onedark.vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'NLKNguyen/papercolor-theme'

  " YCM
  "Plug 'tenfyzhong/CompleteParameter.vim'

  "Plug 'ncm2/ncm2'
  "Plug 'roxma/nvim-yarp'

call plug#end()

"set background=dark
"

set t_Co=256

colorscheme PaperColor "dracula onedark
let g:airline_theme='onedark' 
let g:lightline = {
  \ 'colorscheme': 'onedark',
\ }


"" Copy and Paste

" bail out if this isn't wanted (mrsvim.vim uses this).
if exists("g:skip_loading_mswin") && g:skip_loading_mswin
  finish
endif

" set the 'cpoptions' to its Vim default
if 1    " only do this when compiled with expression evaluation
  let s:save_cpo = &cpoptions
endif
set cpo&vim

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>        "+gP
map <S-Insert>        "+gP

cmap <C-V>        <C-R>+
cmap <S-Insert>        <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>        <C-V>
vmap <S-Insert>        <C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>        :update<CR>
vnoremap <C-S>        <C-C>:update<CR>
inoremap <C-S>        <C-O>:update<CR>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" End

set number
set mouse=a

" Table setting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set expandtab

" NerdTree setting
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" Save setting
nmap <C-S> :w!<CR>
vmap <C-S> <C-C> :w!<CR>v
imap <C-S> <Esc> :w!<CR>i

" To Next File
nmap <C-PageDown> :bn<CR>
vmap <C-PageDown> <C-C> :bn<CR>
imap <C-PageDown> <Esc> :bn<CR>

" To Back File
nmap <C-PageUp> :bp<CR>
vmap <C-PageUp> <C-C> :bp<CR>
imap <C-PageUp> <Esc> :bp<CR>


" To Close File
nmap <C-W> :bd<CR>
vmap <C-W> <C-C> :bd<CR>
imap <C-W> <Esc> :bd<CR>

" Creat a new page
nmap <C-T> :tabnew<CR>
vmap <C-T> <C-C> :tabnew<CR>
imap <C-T> <Esc> :tabnew<CR>

" To next page
nmap <C-\> :tabp<CR>
vmap <C-\> <C-C> :tabp<CR>
imap <C-\> <Esc> :tabp<CR>

" Quit setting
nmap <C-Q> :q!<CR>
vmap <C-Q> <C-C> :q!<CR>
imap <C-Q> <Esc> :q!<CR>

" Install Plugin
nnoremap @i :PlugInstall<CR>
nnoremap @u :PlugUpgrade<CR>

" Cop
nnoremap <F9> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w" 
    exec '!g++ %'
    exec '!echo : Please input ./a.out to run.'
endfunc

" TagbarToggle
nmap <F8> :TagbarToggle<CR>
vmap <F8> <C-C>:TagbarToggle<CR>v
imap <F8> <Esc>:TagbarToggle<CR>i

" Npm Start
nmap <F7> :!npm start<CR>
vmap <F7> <C-C>:!npm start<CR>v
imap <F7> <Esc>:!npm start<CR>i


filetype on
filetype plugin on
filetype indent on 


" Ctrl+/

autocmd FileType c imap <C-/> //




set number
syntax enable
set mouse=a
set showcmd
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set ruler
set showcmd
set cmdheight=2
filetype on
