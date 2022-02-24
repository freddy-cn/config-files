set number
set nocompatible              
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set nowrap
set mouse=a
set foldmethod=indent
set foldlevel=15
set laststatus=2 " for lightline
filetype plugin on
syntax on
syntax sync fromstart
set redrawtime=5000
set cursorline  
" set cursorcolumn
set omnifunc=syntaxcomplete#Complete
set hlsearch
set incsearch
set splitbelow
set splitright
set autoread
set ignorecase
set updatetime=500
let operating_sys = system("echo $OSTYPE")
" Inicia  configuración de Vundle ----------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'leafOfTree/vim-vue-plugin'
Plugin 'sheerun/vim-polyglot'
Plugin 'psliwka/vim-smoothie'
Plugin 'Yggdroot/indentLine'
Plugin 'preservim/nerdcommenter'
" colorschemes
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'sonph/onehalf'
Plugin 'jacoborus/tender.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'joshdick/onedark.vim'
Plugin 'sainnhe/edge'
Plugin 'itchyny/lightline.vim'
Plugin 'gilgigilgil/anderson.vim'
Plugin 'sainnhe/sonokai'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'dikiaap/minimalist'
Plugin 'kyoz/purify', { 'rtp': 'vim' }
Plugin 'christophermca/meta5'
" Plugin 'rafalbromirski/vim-aurora'
" non vundle:
" https://github.com/romainl/Apprentice
" https://github.com/jaredgorski/SpaceCamp
" https://github.com/tomasr/molokai
if operating_sys =~ "linux"
    " Ultisnips engine.
    Plugin 'SirVer/ultisnips'
    " Snippets are separated from the engine. Add this if you want them:
    Plugin 'honza/vim-snippets'
elseif operating_sys =~ "darwin"
    " echo "mac"
endif
call vundle#end()      
" Termina configuración de Vundle----------

set termguicolors
colorscheme purify 
" molokai, spacecamp, spacecamp_lite
" apprentice, iceberg, lucid, purify

filetype plugin indent on   
let g:netrw_liststyle = 3
let g:netrw_winsize = 17
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:user_emmet_leader_key=','
"au BufNewFile,BufRead *.vue setf vue
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
let g:vim_vue_plugin_config = {
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript'],
      \   'style': ['css'],
      \},
      \'full_syntax': [],
      \'initial_indent': [],
      \'attribute': 0,
      \'keyword': 0,
      \'foldexpr': 0,
      \'debug': 0,
      \}

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|vendor\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
  
" LIGHTLINE CONFIGURATION
" default lightline: 'powerline', available: one, PaperColor, solarized, wombat
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }
function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" ultisnips settings
    " let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

vnoremap ñs y/\V<C-R>=escape(@",'/\')<CR><CR>

nmap <F5> :NERDTreeToggle<CR>
" moving
nmap <S-H> T <left>
" nmap <S-J> <down>
" nmap <S-K> <up>
nmap <S-L> t <right>
" navigation 
nmap <C-J> :join<CR>
nmap <C-K> i<CR><ESC>k$
imap <C-H> <left>
imap <C-J> <down>
imap <C-K> <up>
imap <C-L> <right>
" add surrounding chars
vmap " S"
vmap ' S'
vmap ( S(
vmap [ S[
vmap tc \cc
vmap tu \cu
vmap ts \cs
" saving 
inoremap ññ <Esc>:w<CR><right>
inoremap ÑÑ <Esc>:w<CR><right>
inoremap ñ<Space> <CR>
inoremap Ñ<Space> <CR>
inoremap ñq <Esc>
inoremap ÑQ <Esc>
nnoremap ññ <Esc>:w<CR><right>
nnoremap ÑÑ <Esc>:w<CR><right>
nnoremap wq <Esc>:wq<CR>
nnoremap q! <Esc>:q!<CR>
nnoremap wqa <Esc>:wqa<CR>
nnoremap qa! <Esc>:qa!<CR>
nnoremap tt <Esc>:NERDTreeToggle<CR>
nnoremap TT <Esc>:NERDTreeToggle<CR>
" cycling through tabs and scrolling page up and down:
noremap <S-K> kkkkk
noremap <S-J> jjjjj
noremap ñh gT 
noremap ñl gt
noremap ÑH gT 
noremap ÑL gt
noremap ñF ?
noremap ñf /
noremap ñg *
noremap ñG #
noremap <Space> i<Space><Esc><right>
noremap ñb ?
noremap ñv :vs<CR>
noremap ñh :split<CR>
noremap ñe :FZF<CR>
noremap ÑE :FZF<CR>
" resize windows
nmap -  <C-W><
nmap +  <C-W>>
nmap == <C-W>=
" miscelaneous
nmap ñ1 :set foldlevel=1<CR>
nmap ñ2 :set foldlevel=2<CR>
nmap MM :nohlsearch<CR>
nmap mm :nohlsearch<CR>
nmap ñw <C-W>ww
nmap ssf :syntax sync fromstart<CR>
inoremap ño <C-X><C-O>
inoremap ÑO <C-X><C-O>
inoremap ñp <C-X><C-P>
inoremap ÑP <C-X><C-P>
vnoremap ñf y/\V<C-R>=escape(@",'/\')<CR><CR>
" copy from vim to clipboard
vnoremap ñc :'<,'>w !xclip -selection clipboard<CR><CR>
vnoremap ñ <Esc>
vnoremap ñn :norm _
inoremap "" ""<left>
inoremap '' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

cabbrev sessionmk mks! ~/.vim/sessions/
cabbrev sessionso source ~/.vim/sessions/

if operating_sys =~ "linux"
    iabbrev operatingsystem linux
elseif operating_sys =~ "darwin"
    iabbrev operatingsystem mac
endif

function! PhpAbbrev()
      iabbrev enc json_encode(
      iabbrev dec json_decode(
      iabbrev info Log::info(
      iabbrev jresponse response(<ESC>A->json([])
endfunction
function! JsAbbrev()
      iabbrev clog console.log(
      iabbrev ctable console.table(
      iabbrev foreach forEach((elem, i<RIGHT> => {<CR>
      iabbrev for for(let i = 0; i < length; i++<RIGHT>{<CR>
      iabbrev getbyid document.getElementById(''
      iabbrev getbyclass document.getElementsByClassName(''
      iabbrev doc document
      iabbrev filter filter((element, index, array<RIGHT> => {<CR>
      iabbrev map map((element, index, array<RIGHT> => {<CR>
      iabbrev reduce reduce((previousValue, currentValue, currentIndex, array<RIGHT> => { <RIGHT>, optionalInitialValue
endfunction

function! SaveSessionAndExit()
    :mks! ~/.vim/sessions/default.vim
    :wqa
endfunction

function! RestoreDefaultSession()
    :source ~/.vim/sessions/default.vim
endfunction
