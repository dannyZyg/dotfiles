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
Plug 'mhinz/vim-signify'

"[styling]
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'Yggdroot/indentLine'
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
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'vim-test/vim-test'
" Plug 'cohama/lexima.vim'
Plug 'mbbill/undotree'
Plug 'folke/trouble.nvim'

Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/gv.vim'

" Syntax highlight
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'rajasegar/vim-astro', {'branch': 'main'}

" [workflow]
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/SimpylFold'
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
Plug 'adelarsq/vim-matchit'
Plug 'unblevable/quick-scope'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" [music]
Plug 'tidalcycles/vim-tidal'

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
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
colorscheme gruvbox

highlight Comment cterm=italic gui=italic

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

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.i3/config set filetype=i3config
aug end

set pyxversion=3

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

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

let g:terraform_align=1
let g:terraform_fmt_on_save=1

"" Enable true color 启用终端24位色
" if exists('+termguicolors')
" endif
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors


inoremap jk <esc>
noremap <leader>u :UndotreeToggle<CR>

let g:undotree_SplitWidth = 50
let g:undotree_WindowLayout = 2

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


nnoremap <leader>cs :noh<CR>

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
require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
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
lua << EOF
-- LSP this is needed for LSP completions in CSS along with the snippets plugin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}
EOF

lua << EOF
require("lspconfig").cssls.setup({
  cmd = { "vscode-css-language-server", "--stdio" },
  capabilities = capabilities,
  settings = {
    scss = {
      lint = {
        idSelector = "warning",
        zeroUnits = "warning",
        duplicateProperties = "warning",
      },
      completion = {
        completePropertyWithSemicolon = true,
        triggerPropertyValueCompletion = true,
      },
    },
  },
})
EOF

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

" Tidalcycles hacky autocompletion
" https://tidalcycles.org/docs/getting-started/editor/Vim
" autocmd FileType tidal call s:tidal_abbr()
" function! s:tidal_abbr()
"     inoreabbr billybd "[t ~ ~ ~] [~ ~ ~ ~] [t ~ ~ ~] [~ ~ ~ ~]"
"     inoreabbr billysn "[~ ~ ~ ~] [t ~ ~ ~] [~ ~ ~ ~] [t ~ ~ ~]"
"     inoreabbr billych "[t ~ t ~] [t ~ t ~] [t ~ t ~] [t ~ t ~]"
"     inoreabbr bluemondaybd "[t ~ ~ ~] [~ ~ ~ ~] [t ~ ~ ~] [~ ~ ~ ~]"
"     inoreabbr bluemondaysn "[~ ~ ~ ~] [t ~ ~ ~] [~ ~ ~ ~] [t ~ ~ ~]"
"     inoreabbr bluemondaycp "[~ ~ ~ ~] [t ~ ~ ~] [~ ~ ~ ~] [t ~ ~ ~]"
"     inoreabbr bluemondayoh "[~ ~ t ~] [~ ~ t ~] [~ ~ t ~] [~ ~ t ~]"
"     ... etc ...
" endfunction

let g:tidal_target = "terminal"

lua << EOF
  require("trouble").setup {
    -- your configuration comes here
  }
EOF

" nvim-completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c


if &term =~# '^screen' || &term =~# '^tmux' || &term =~# '^alacritty'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
