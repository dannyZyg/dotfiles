let mapleader =" "
set nocompatible              " be iMproved, required
filetype plugin on
syntax enable
set undodir=~/.vim/undodir
set undofile
set clipboard=unnamedplus
set mouse=a
set nowrap
set number
set number relativenumber
set history=1000

" show the cursor position
set ruler

" show incomplete Command
set showcmd

" show useful command suggestions
set wildmenu
set smarttab
set smartindent
set incsearch

" by default, the indent is 2 spaces.
set shiftwidth=4
set softtabstop=4
set tabstop=4

set splitbelow
set splitright
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
"
"set rtp+=~/.vim/bundle/Vundle.vim
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
" Plug 'Yggdroot/indentLine'
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
Plug 'hashivim/vim-terraform'
Plug 'godlygeek/tabular'
" Plug 'sainnhe/gruvbox-material'
Plug 'gruvbox-community/gruvbox'
Plug 'kovetskiy/sxhkd-vim'
Plug 'jparise/vim-graphql'

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
Plug 'martinda/Jenkinsfile-vim-syntax'

" [workflow]
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/SimpylFold'
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
Plug 'adelarsq/vim-matchit'
Plug 'unblevable/quick-scope'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" <============================================>
" All of your Plugins must be added before the following line
" call vundle#end()            " required
" Initialize plugin system
call plug#end()


" Trigger a highlight in the appropriate direction when pressing these keys:
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
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




"ts = 'number of spaces that <Tab> in file uses'
"sts = 'number of spaces that <Tab> uses while editing'
"sw = 'number of spaces to use for (auto)indent step'

" for html/rb files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype json setlocal ts=2 sw=2 expandtab

" for js/coffee/jade files, 4 spaces
" autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 "expandtab
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab

" php and twig
autocmd Filetype php setlocal ts=4 sw=4 sts=4
autocmd Filetype twig setlocal ts=4 sw=4 sts=4

autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype yml setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 sts=2 expandtab

" for cs files, 2 spaces
autocmd Filetype cs setlocal ts=2 sw=2 expandtab!

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

" autocmd vimenter * colorscheme gruvbox
"
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark

" let g:gruvbox_material_palette = 'mix' "mix | origninal | material
" let g:airline_theme = 'gruvbox_material'
let g:airline_theme = 'gruvbox'

" colorscheme vim-monokai-tasty
" let g:airline_theme='monokai_tasty'
" let g:airline_powerline_fonts = 1
" let g:sublimemonokai_term_italic = 1

" nerdtree settings
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>

hi CursorLine cterm=underline

set splitright splitbelow

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap j gj
nmap k gk

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
  execute '! ~/scripts/aws/lambda-cmd.sh deploy %'
endfunction
map <Leader>dd :call LambdaDeploy()<CR>

function LambdaInvoke()
  execute '! ~/scripts/aws/lambda-cmd.sh invoke %'
endfunction
map <Leader>di :call LambdaInvoke()<CR>

function LambdaUpdateLayer()
  execute '! ~/scripts/aws/lambda-cmd.sh layer %'
endfunction
map <Leader>lu :call LambdaUpdateLayer()<CR>

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
map <Leader>mp :InstantMarkdownPreview<CR>
map <Leader>mc :InstantMarkdownStop<CR>


"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode "]======
nnoremap v <C-V>
nnoremap <C-V> v

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
	\ 'coc-marketplace',
	\ 'coc-lists',
	\ 'coc-syntax',
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
	\ 'coc-vetur' ,
	\ 'coc-python',
	\ 'coc-scssmodules',
	\ 'coc-sh',
	\ 'coc-gitignore',
	\ 'coc-jest',
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
"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

let g:terraform_align=1
let g:terraform_fmt_on_save=1

"python.jediEnabled": false

"" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


inoremap jk <esc>
noremap <leader>u :UndotreeShow<CR>
noremap <leader>ps :Rg<SPACE>

" Move selection chunks up and down - follow indent
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" trim whitespace on save
" autocmd BufWritePre * :call TrimWhitespace()

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" allows rip grep to find your git root for faster search
if executable('rg')
	let g:rg_derive_root='true'
endif

"restart sxhkd if editing the rc
autocmd BufWritePost *sxhkdrc !killall sxhkd; setsid sxhkd &


" NERDTree

" " sync open file with NERDTree
" " Check if NERDTree is open or active
" function! IsNERDTreeOpen()
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction

" " " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" " file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction

" " Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

function! Getbgcol()
  return synIDattr(hlID("Normal"), "bg")
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', Getbgcol())
call NERDTreeHighlightFile('ini', 'yellow', 'none', '#eb5234', Getbgcol())
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', Getbgcol())
call NERDTreeHighlightFile('yml', 'yellow', 'none', '#eb5234', Getbgcol())
call NERDTreeHighlightFile('config', 'yellow', 'none', '#eb5234', Getbgcol())
call NERDTreeHighlightFile('conf', 'yellow', 'none', '#eb5234', Getbgcol())
call NERDTreeHighlightFile('json', 'yellow', 'none', '#eb5234', Getbgcol())
call NERDTreeHighlightFile('html', 'yellow', 'none', '#eb5234', Getbgcol())
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', Getbgcol())
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', Getbgcol())
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', Getbgcol())
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', Getbgcol())
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', Getbgcol())
call NERDTreeHighlightFile('vue', 'green', 'none', '#1aab5d', Getbgcol())

let g:vim_json_conceal=0


nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

let g:python3_host_prog = $HOME."/.virtualenvs/neovim-python3/bin/python"
" let g:python_host_prog = $HOME."/.virtualenvs/neovim-python2/bin/python"
