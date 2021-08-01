let mapleader =" "
filetype plugin on
syntax enable
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

" <============================================>
" Specify the plugins you want to install here.
" We'll come on that later

" [file browsing]
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'

"[styling]
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'Yggdroot/indentLine'
" Plug 'vim-airline/vim-airline'
Plug 'jacoborus/tender.vim'
Plug 'junegunn/goyo.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'crusoexia/vim-javascript-lib'
Plug 'patstockwell/vim-monokai-tasty'
" Plug 'ryanoasis/vim-devicons'
Plug 'mboughaba/i3config.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'hashivim/vim-terraform'
Plug 'godlygeek/tabular'
" Plug 'sainnhe/gruvbox-material'
Plug 'gruvbox-community/gruvbox'
Plug 'kovetskiy/sxhkd-vim'
Plug 'jparise/vim-graphql'
Plug 'cespare/vim-toml'
Plug 'bfontaine/Brewfile.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'mbbill/echofunc'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sbdchd/neoformat'

" [programming]
Plug 'hoob3rt/lualine.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'shawncplus/phpcomplete.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'dense-analysis/ale'
Plug 'lumiliet/vim-twig'
" Plug 'vim-scripts/indentpython.vim'
" Plug 'vim-python/python-syntax'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
" Plug 'davidhalter/jedi-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'vim-test/vim-test'
" Plug 'cohama/lexima.vim'

Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/gv.vim'

" Syntax highlight
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'martinda/Jenkinsfile-vim-syntax'

" [workflow]
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/SimpylFold'
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
Plug 'adelarsq/vim-matchit'
Plug 'unblevable/quick-scope'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'


" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

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





" keep 10 lines when top focusing
set scrolloff=10

" highlight search results
set hlsearch

" ignore case in search
set ignorecase

" use case if search contains uppercase
set smartcase

" keep words together on line break
set lbr

" use auto indent, copy indent from prev line
set autoindent

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
" let g:airline_theme = 'gruvbox'

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

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>! :q!<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

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

" let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
map <Leader>mp :InstantMarkdownPreview<CR>
map <Leader>mc :InstantMarkdownStop<CR>


"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode "]======
nnoremap v <C-V>
nnoremap <C-V> v

vnoremap v <C-V>
vnoremap <C-V> v

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

exec "set listchars=nbsp:~"
" set list

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
" let g:coc_global_extensions = [
" 	\ 'coc-marketplace',
" 	\ 'coc-lists',
" 	\ 'coc-syntax',
" 	\ 'coc-json',
" 	\ 'coc-html',
" 	\ 'coc-css',
" 	\ 'coc-pairs',
" 	\ 'coc-snippets',
" 	\ 'coc-markdownlint',
" 	\ 'coc-vimlsp',
" 	\ 'coc-yaml',
" 	\ 'coc-highlight',
" 	\ 'coc-phpls',
" 	\ 'coc-tsserver',
" 	\ 'coc-vetur' ,
" 	\ 'coc-python',
" 	\ 'coc-scssmodules',
" 	\ 'coc-sh',
" 	\ 'coc-gitignore',
" 	\ 'coc-jest',
" 	\ ]

" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <leader>rr <Plug>(coc-rename)
" nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" Remap for rename current word
" nmap <F2> <Plug>(coc-rename)


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"" Or use `complete_info` if your vim support it, like:
"" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
""
"" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

"" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'

" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

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
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <C-j> :m .+1<CR>==
inoremap <C-k> :m .-2<CR>==

" Undo Break Points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Keep this centered when using next/prev
nnoremap n nzzzv
nnoremap N Nzzzv

" Make Y behave like D etc.
nnoremap Y y$

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

" nmap <leader>rr <Plug>(coc-rename)
" nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

let g:python3_host_prog = $HOME."/.virtualenvs/nvim/bin/python"
let g:python_host_prog = $HOME."/.virtualenvs/nvim-python2/bin/python"
"
nmap <leader>hh :noh<CR>

" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" call coc#config('python', {'pythonPath': $HOME."/.virtualenvs/base/bin/python" })
" call coc#config('python', {'pythonPath': $HOME."/.virtualenvs/base/bin/python" })
" call coc#config('python', {'pythonPath': $HOME."/.virtualenvs/neovim-python3.6.0/bin/python" })
"
nmap <leader>rp :put =expand('%')<CR>
nmap <leader>ap :put =expand('%:p')<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>


lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF



nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
" nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles()<CR>
" nnoremap <leader>va :lua require('theprimeagen.telescope').anime_selector()<CR>
" nnoremap <leader>vc :lua require('theprimeagen.telescope').chat_selector()<CR>
" nnoremap <leader>gc :lua require('theprimeagen.telescope').git_branches()<CR>



" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>



set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true



" LSP config
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.flow.setup{}
require'lspconfig'.diagnosticls.setup {}
EOF

" auto-format
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.js Neoformat
" autocmd BufWritePre *.jsx Neoformat

" let g:neoformat_run_all_formatters = 1
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-v> :TestVisit<CR>

let test#strategy = "neovim"
let test#python#runner = 'pytest'
" let testcommand = 'pytest src/modules/ --nomigrations'
" let test#python#pytest#executable="docker-compose -f ./config/local/docker/docker-compose.yml exec docker_django_1 sh -c ".$testcommand
"
"
"
lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>


set updatetime=100
nmap <leader>gn <plug>(signify-next-hunk)
nmap <leader>gp <plug>(signify-prev-hunk)
