call plug#begin('~/.vim/plugged')
  Plug 'itchyny/lightline.vim'
  " Coc.vim
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} 
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
call plug#end()

" Copy and Paste

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
nmap <F7> :!npm start *<CR>
vmap <F7> <C-C>:!npm start *<CR>v
imap <F7> <Esc>:!npm start *<CR>i

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
