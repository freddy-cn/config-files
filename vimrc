" - GLOBAL SETTINGS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"   
set number
set nocompatible              
set tabstop=4
set expandtab
set shiftwidth=4 "override if not working
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
" set omnifunc=syntaxcomplete#Complete
set hlsearch
set incsearch
set splitbelow
set splitright
set autoread
set ignorecase
set updatetime=500
let operating_sys = system("echo $OSTYPE")





" - VUNDLE PLUGINS  - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" enable plugins according machine-specific config 
if operating_sys =~ "linux"
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
elseif operating_sys =~ "darwin"
  " echo "mac"
endif

" neovim exclusive plugins
if has('nvim')
  Plugin 'nvim-lua/plenary.nvim'
  Plugin 'nvim-telescope/telescope.nvim'
  Plugin 'williamboman/mason.nvim'
  Plugin 'williamboman/mason-lspconfig.nvim'
  Plugin 'neovim/nvim-lspconfig'
  Plugin 'hrsh7th/cmp-nvim-lsp'
  Plugin 'hrsh7th/cmp-buffer'
  Plugin 'hrsh7th/cmp-path'
  Plugin 'hrsh7th/cmp-cmdline'
  Plugin 'hrsh7th/nvim-cmp'
endif

Plugin 'ervandew/supertab'
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
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'ryanoasis/vim-devicons'


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
Plugin 'sainnhe/gruvbox-material'
Plugin 'srcery-colors/srcery-vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'dikiaap/minimalist'
Plugin 'kyoz/purify', { 'rtp': 'vim' }
Plugin 'christophermca/meta5'
" Plugin 'rafalbromirski/vim-aurora'
" non vundle:
" https://github.com/romainl/Apprentice
" https://github.com/jaredgorski/SpaceCamp
" https://github.com/tomasr/molokai
call vundle#end()      


if has('nvim')
    lua require("mason-config")
    lua require('lspservers')
endif

set completeopt=menu,menuone,noselect

set termguicolors
colorscheme srcery
" molokai, spacecamp, spacecamp_lite
" apprentice, iceberg, lucid, purify

filetype plugin indent on   
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:user_emmet_leader_key=','
highlight Pmenu guibg=black 

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
" default lightline: 'powerline', one, PaperColor, solarized,
" wombat, landscape
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'landscape',
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
let g:indentLine_char_list = ['|', '¦', '┆', '┊', ':']

" supertab
let g:SuperTabCrMapping=1
let g:SuperTabMappingForward='<s-tab>'
let g:SuperTabMappingBackward='<tab>'


" ultisnips settings
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" gutentags settings
let g:gutentags_ctags_executable="universal-ctags"
let g:gutentags_enabled=1

" devicons config
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" - MAPINGS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"
if operating_sys =~ "linux"
    iabbrev operatingsystem linux
elseif operating_sys =~ "darwin"
    iabbrev operatingsystem mac
endif

if has('nvim')
  nnoremap ñr <cmd>Telescope find_files<cr>
  nnoremap ñe <cmd>Telescope git_files<cr>
  " nnoremap ñg <cmd>Telescope live_grep<cr>
  nnoremap ñt <cmd>Telescope buffers<cr>
  " nnoremap ñh <cmd>Telescope help_tags<cr>
else
  noremap ñe :FZF<CR>
  noremap ñt :buffers<CR>:b 
endif


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
nnoremap q! <Esc>:q!<CR>
nnoremap qa! <Esc>:qa!<CR>
nnoremap tt <Esc>:NERDTreeToggle<CR>
" cycling through tabs and scrolling page up and down:
noremap <S-K> kkkkk
noremap <S-J> jjjjj
noremap ñf /
noremap ñb ?
noremap ñg *
noremap ñG #
noremap <Space> i<Space><Esc><right>
noremap ñv :vs<CR>
noremap ñh :split<CR>
" resize windows
nmap -  <C-W><
nmap +  <C-W>>
nmap == <C-W>=
" miscelaneous
nmap ñ1 :set foldlevel=1<CR>
nmap ñ2 :set foldlevel=2<CR>
nmap ñm :nohlsearch<CR>
nmap ñj <C-D>
nmap ñk <C-U>
nmap ñw <C-W>ww
nmap ssf :syntax sync fromstart<CR>
inoremap ñm <C-X><C-O>
inoremap ñn <C-X><C-P>
nmap <CR> o<ESC>
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



" - FUNCTIONS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
function! PhpAbbrev()
      iabbrev enc-- json_encode(
      iabbrev dec-- json_decode(
      iabbrev info-- Log::info(
      iabbrev jresponse-- response(<ESC>A->json([])
endfunction
function! JsAbbrev()
      iabbrev clog-- console.log(
      iabbrev ctable-- console.table(
      iabbrev cerror-- console.table(
      iabbrev foreach-- forEach((elem, i<RIGHT> => {<CR>
      iabbrev for-- for(let i = 0; i < length; i++<RIGHT>{<CR>
      iabbrev getbyid-- document.getElementById(''
      iabbrev getbyname-- document.getElementsByName(''
      iabbrev getbyclass-- document.getElementsByClassName(''
      iabbrev addlistener-- element.addEventListener('click', function(evt){<ESC>$r;<LEFT><LEFT>i
      iabbrev doc-- document
      iabbrev filter-- filter((element, index, array<RIGHT> => {<CR>
      iabbrev map-- map((element, index, array<RIGHT> => {<CR>
      iabbrev reduce-- reduce((previousValue, currentValue, currentIndex, array<RIGHT> => { <CR>, optionalInitialValue
endfunction

function! SaveSessionAndExit()
    :mks! ~/.vim/sessions/default.vim
    :wqa
endfunction

function! RestoreDefaultSession()
    :source ~/.vim/sessions/default.vim
endfunction
