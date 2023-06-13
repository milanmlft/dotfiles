set nocompatible              " be iMproved, required
filetype on                  " required
filetype plugin indent on
set nu

set clipboard+=unnamedplus  " copy to system clipboard

" Plugins
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Statusbar plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" surrounding with parentheses, brackets, quotes and more
Plug 'tpope/vim-surround'

" R stuff
Plug 'godlygeek/tabular'
Plug 'jalvesaq/Nvim-R'

" bracket completion
Plug 'jiangmiao/auto-pairs'

" Markdown and writing stuff
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

" All of your Plugins must be added before the following line
call plug#end()            " required

" General settings
set splitbelow
set splitright
set tabstop=2
set shiftwidth=2
set noexpandtab
set mouse=nv	" enable mouse support in Normal and Visual mode

" https://github.com/vim-pandoc/vim-pandoc-syntax/issues/185
set termguicolors

" spaceduck theme
colors spaceduck

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Terminal mode settings
tnoremap <Esc> <C-\><C-n>

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
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Nvim-R settings
" ===============
" Send selection or line to R with space bar
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
" Shortcut for R's assignment operator:
" 0 turns it off; 1 assigns underscore; 2 assigns two underscores
let R_assign = 2
" R output is highlighted with current colorscheme
let g:rout_follow_colorscheme = 1
" R commands in R output are highlighted
let g:Rout_more_colors = 1
" always set working directory to vim working directory
let R_nvim_wd = 1

" Flag unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h  match BadWhitespace /\s\+$/

" UTF-8 support
set encoding=utf-8

" NERDTree stuff
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" autocmd vimenter * NERDTree	"automatically launches NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1
" disable latex math syntax concealing
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" disable code block syntax concealing
let g:vim_markdown_conceal_code_blocks = 0
" support front matter in YAML format
let g:vim_markdown_frontmatter = 1

" mardkown-preview settings
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0

" vim-pencil settings
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,pandoc,rmarkdown call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END

" Goyo settings
let g:goyo_width = 120

" configuration for vim-pandoc and vim-rmarkdown
autocmd BufRead,BufNewFile *.Rmd set filetype=rmarkdown
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#conceal#use = 0

" Nvim-R support for radian console
" =================================
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1

