set nocompatible
set expandtab
set textwidth=0
set colorcolumn=120
set expandtab
set shiftwidth=2
set tabstop=2
set nu
set relativenumber
set backspace=indent,eol,start
set cpoptions+=$
set wildmenu
set smartcase
set clipboard=unnamed
set ruler
set linebreak

" automatically reload changes to vimrc file
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


" set rtp+=~/.vim/ale


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
syntax on
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Shougo/neocomplete.vim'
" Plugin 'python-mode/python-mode'
Plugin 'tpope/vim-fugitive'
"Plugin 'roxma/nvim-completion-manager'
Plugin 'chrisbra/csv.vim'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'gaalcaras/ncm-R'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'roxma/ncm-clang'
Plugin 'jalvesaq/Nvim-R', { 'for' : 'r' }
" Plugin 'Rip-Rip/clang_complete'
Plugin 'jpalardy/vim-slime'
Plugin 'SirVer/ultisnips'
" Plugin 'Shougo/deoplete.nvim'
Plugin 'honza/vim-snippets'
Plugin 'davidhalter/jedi-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'triglav/vim-visual-increment'

call vundle#end()
filetype plugin indent on

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.hpp, *.h,*.c, *.cpp set filetype=c.doxygen
augroup END
"
" get rid of white space
autocmd BufWritePre * %s/\s\+$//e


"Solarized color scheme

let g:solarized_termcolors = 256
set background=dark
let g:solarized_contrast = "high"
colorscheme solarized
set term=screen-256color
set t_ut=

" Settings for recompiling R packages and other command line settings
map<F1> :!sh -xc 'R CMD INSTALL ~/workspace/btyd_e/btydR/btydR'
map<F2> :SlimeSend1 q(save = "no") <Enter> :SlimeSend1 R <Enter>
map<F3> :!sh -xc 'R CMD INSTALL ~/workspace/btyd_e/api_code/clvUtils'

"set the window switch keys

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable arrow keys

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" Settings for NERDTreeToggle

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Settings for VimSlime

xmap <Space> <Plug>SlimeRegionSend
nmap <Enter> <Plug>SlimeLineSend
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.0"}

" Settings for Ale

let g:airline#extensions#ale#enabled = 1

" Ale settings

let g:ale_linters = {'cpp': ['gcc']}


" Settings for N-vim R

" This disables automatic arrow to underscore
let R_assign = 2
let R_in_buffer = 0
let R_show_args = 0
let R_args_in_stline = 1
let R_show_arg_help = 0
let R_start_libs = "clvUtils, btydR, ggplot2"
let r_syntax_folding = 1
" Settings for UltiSnips

let g:UltiSnipsExpandTrigger="<C-o>"
let g:UltiSnipsJumpForwardTrigger="<C-a>"
let g:UltiSnipsJumpBackwardTrigger="<C-q>"

" Settings for Neocomplete

autocmd FileType r setlocal omnifunc=CompleteR
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

let g:neocomplete#enable_at_startup = 1

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.r = '\w*::'
let g:neocomplete#sources#omni#functions.r = 'CompleteR'
let g:neocomplete#sources#omni#input_patterns.cpp =  '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'')'
let g:neocomplete#force_omni_input_patterns.r = '[[:alnum:].\\]\+''\w*::\w*'


inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'

let g:pymode_python = 'python3'
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0
let g:pymode_rope_autoimport = 0
" let g:jedi#popup_on_dot = 0
let g:jedi#force_py_version = 3
" let g:jedi#show_call_signatures = 0
"
let g:deoplete#enable_at_startup = 1
