let mapleader =" "
set nocompatible              " be iMproved, required
filetype plugin on
syntax enable
set undodir=~/.vim/undodir
set undofile
set clipboard=unnamedplus


inoremap jk <esc>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set splitbelow
set splitright
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

call plug#begin('~/.vim/plugged')

" <============================================>
" Specify the plugins you want to install here.
" We'll come on that later
"

" [file browsing]
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/gv.vim'

"[styling]
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'jacoborus/tender.vim'
Plug 'junegunn/goyo.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'crusoexia/vim-javascript-lib'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'ryanoasis/vim-devicons'
Plug 'mboughaba/i3config.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" [programming]
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'shawncplus/phpcomplete.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'dense-analysis/ale'
Plug 'lumiliet/vim-twig'
Plug 'vim-scripts/indentpython.vim'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Syntax highlight
Plug 'vim-pandoc/vim-pandoc-syntax'

" [workflow]
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/SimpylFold'
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
Plug 'adelarsq/vim-matchit'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" <============================================>
" All of your Plugins must be added before the following line
" call vundle#end()            " required
" Initialize plugin system
call plug#end()


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
" Put the rest of your .vimrc file here
let g:SimpylFold_docstring_preview=1

set number relativenumber

" keep 1000 items in the history
set history=1000

" show the cursor position
set ruler

" show incomplete Command
set showcmd

" show useful command suggestions
set wildmenu

" show line numbers
set number

" replace tabs with spaces
" set expandtab

" set tab width to 4
set shiftwidth=4
set tabstop=4
set smarttab
set incsearch

" keep 5 lines when top focusing
set scrolloff=5

" highlight search results
set hlsearch

" ignore case in search
set ignorecase

" use case if search contains uppercase
set smartcase

" keep words together on line break
set lbr

" use auto indent, copy indent from prev line
set ai

" smart indent
set si

set bg=dark
set cursorline
colorscheme vim-monokai-tasty
let g:airline_theme='monokai_tasty'
let g:airline_powerline_fonts = 1
let g:sublimemonokai_term_italic = 1

" nerdtree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-t> :NERDTreeToggle<CR>

hi CursorLine cterm=underline

set splitright splitbelow

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-p> :Files<CR>

fun! CheckChages()
    set autoread
    checkt
endfun

nmap <leader>gr call CheckChanges()

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>! :q!<CR>

nmap <leader>a :tab split<CR>:Ack ""<Left>
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

if (has("termguicolors"))
 set termguicolors
endif

" Enable folding
set foldmethod=indent
set foldlevel=99
set encoding=utf-8

" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

function LambdaDeploy()
  execute '! lddeploy %'
endfunction
map <Leader>dd :call LambdaDeploy()<CR>

function LambdaInvoke()
  execute '! ldinvoke %'
endfunction
map <Leader>di :call LambdaInvoke()<CR>

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
map <Leader>mp :InstantMarkdownPreview<CR>
map <Leader>mc :InstantMarkdownStop<CR>


"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode "]======

nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

exec "set listchars=nbsp:~"
" set list

nmap <Leader>nn <Plug>VimwikiIndex


map <Leader>ds :pu=strftime('%Y-%m-%d')<CR>

set omnifunc=syntaxcomplete#Complete

" au BufNewFile,BufRead *.ejs set filetype=html
"
"
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.i3/config set filetype=i3config
aug end

set pyxversion=3

" COC SETUP
let g:coc_global_extensions = [
	\ 'coc-json', 
	\ 'coc-html', 
	\ 'coc-css', 
	\ 'coc-pairs', 
	\ 'coc-snippets',
	\ 'coc-markdownlint',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-highlight',
	\ 'coc-phpls',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-python'
	\ ]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
