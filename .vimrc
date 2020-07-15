set nocompatible              " be iMproved, required
filetype off                  " required
set nu

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'  "vim-fugitive: git-wrapper for vim
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular'
Plugin 'Nvim-R'
Plugin 'plasticboy/vim-markdown'
Plugin 'reedes/vim-pencil'
Plugin 'arcticicestudio/nord-vim'
Plugin 'junegunn/goyo.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Terminal mode settings
tnoremap <Esc> <C-\><C-n>

" Change cursor between normal and insert modes
" https://stackoverflow.com/a/58042687/11801854
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Insert mode: blinking vertical bar
let &t_SR = "\<Esc>]50;CursorShape=2\x7" " Replace mode: blinking underscore
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Else: blinking block
autocmd VimLeave * let &t_me="\<Esc>]50;CursorShape=0\x7"

set tabstop=2
set shiftwidth=2
set noexpandtab

" PEP 8 indentation rules for Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Python syntax highlighting
let python_highlight_all=1
syntax on

" Settings for R files
au BufNewFile,BufRead *.R
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flag unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.R  match BadWhitespace /\s\+$/

" UTF-8 support
set encoding=utf-8

" YCM settings
" let g:ycm_autoclose_preview_window_after_completion=1

" Color scheme
set background=dark
colorscheme nord

" NERDTree stuff
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" autocmd vimenter * NERDTree	"automatically launches NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" airline settings
let g:airline#extensions#tabline#enabled = 1

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1
" disable latex math syntax concealing
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" disable code block syntax concealing
let g:vim_markdown_conceal_code_blocks = 0

" vim-pencil settings
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,rmd call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END

" Goyo settings
let g:goyo_width = 120

" configuration for vim-pandoc and vim-rmarkdown
autocmd BufRead,BufNewFile *.rmd set filetype=rmarkdown
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#conceal#use = 0
