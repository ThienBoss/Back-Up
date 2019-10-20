
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
set nu
set noshowmode
inoremap jj <Esc>
"Pathogen
execute pathogen#infect()
set wildmenu
set suffixesadd+=.java
set autoindent
inoremap {<CR> {<CR><CR>}<Up>
inoremap (<CR>("")<Left><Left><Left>
"Turn on Highlight in search
nnoremap <S-h> :set hlsearch<CR>
"Turn off Highlight search
nnoremap <S-l> :set nohlsearch<CR>
nnoremap 4 $
nnoremap 8 *
"Quick in - out
nnoremap <Tab>q :wq<CR>
nnoremap <Tab>w :w<CR>
nnoremap <Tab>1 :q!<CR>
nnoremap <Tab>s :source %<CR>
"Execute Code
nnoremap & :&&<CR>
xnoremap & :&&<CR>
"Split Windows
nnoremap <S-Down> <C-w>s
nnoremap <S-Right> <C-w>v
nnoremap <Tab>l <C-w>l
nnoremap <Tab>h <C-w>h
nnoremap <Tab>j <C-w>j
nnoremap <Tab>k <C-w>k
"Bracket in AndroiStudio
inoremap <string<CR> <string name=""></string><Esc>8hi
"C
inoremap .c<CR> #include<stdio.h><CR><CR>int main(){<CR><CR>}<Up><CR>return 0;<Up>
inoremap print<CR> printf("");<Esc>2hi
"Kotlin
inoremap .kt<CR> fun main(args:Array<String>){<CR><CR>{<Up>
"LIGHTLINE
set laststatus=2
"LIGHTLINE COLOR THEMES
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'greeting' ] ]
      \ },
      \ 'component': {
      \   'greeting': 'It coding time!'
      \ },
      \ 'component_function':{
      \  'filename' : 'LightlineFilename'
      \ },
      \}
function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimsheLightlineFilenameLightlineFilenamell_force_overwrite_statusline = 0
"NERD TREE
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-a> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"COC NVIM (Autocomplete)
autocmd FileType json syntax match Comment +\/\/.\+$+	
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
let g:coc_snippet_next = '<tab>'

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()    
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
"Confirm Select
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
