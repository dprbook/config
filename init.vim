" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')
" Theme
Plug 'joshdick/onedark.vim'

" Status line
Plug 'vim-airline/vim-airline'

" Buffer display
Plug 'bling/vim-bufferline'

" Fuzzy finder selection UI
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Undo history
Plug 'mbbill/undotree'

" Show marks
Plug 'kshenoy/vim-signature'

" Delete trailing whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Ale
Plug 'w0rp/ale'

" JS support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Go support
Plug 'fatih/vim-go', { 'for': 'go' }

" Yaml support
Plug 'avakhov/vim-yaml', { 'for': 'yaml' }

" Language client protocol
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh'
            \ }

" Outline
Plug 'majutsushi/tagbar'

" Buffer closing
Plug 'qpkorr/vim-bufkill'

" Language support
"Plug 'sheerun/vim-polyglot'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'wokalski/autocomplete-flow'
"" For func argument completion
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

call plug#end()





" PLUGIN CONFIG
let g:deoplete#enable_at_startup = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }

"Bufferline
let g:bufferline_echo = 0

" Ale
let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ 'html': ['tidy'],
            \ 'go': ['gometalinter'],
            \ 'sh': ['shellcheck'],
            \ 'bash': ['shellcheck'],
            \ 'zsh': ['shellcheck'],
            \ }

let g:ale_fixers = {
            \ 'javascript': ['eslint'],
            \ }

" Whitespace
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_at_eof = 1

" Language Server
let g:LanguageClient_autoStart = 1

" Minimal LSP configuration for JavaScript
"let g:LanguageClient_serverCommands = {}
"if executable('javascript-typescript-stdio')
"    let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
"    " Use LanguageServer for omnifunc completion
"    autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
"else
"    echo "Javasript LangServer not installed\n"
"    :cq
"endif

" Undotree
let g:undotree_ShortIndicators = 1
let g:undotree_RelativeTimestamp = 0
let g:undotree_ShortIndicators = 1
let g:undotree_RelativeTimestamp = 0
if has("persistent_undo")
    set undodir=~/vim/.undodir/
    set undofile
endif

" Javascript syntax highlight
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1





" CUSTOM SCRIPTS
"so ~/bin/vim/fold.vim





" KEYMAPS
let mapleader=","
" Used leader chars: a (b) (c) d e (f) g h (i) j k l m (n) o p (q) r (s) (t) (u) (v) w (x) (y) z

" Ctrl maps
" go to prev buffer
nnoremap <C-H> :bprev<CR>
" go to next buffer
nnoremap <C-L> :bnext<CR>

" Misc
" format file
map <F7> mzgg=G`zdmz

" Defaults remaps
" j + k go to next line, even if it is a line break line
nnoremap j gj
nnoremap k gk
" J = 5j
nnoremap J 5gj
" K = 5k
nnoremap K 5gk
" space in normal mode toggles fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" space in visual mode create fold
vnoremap <Space> zf
" deoplete tab movement
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" disable highlighting on esc press
nnoremap <esc> :noh<return><esc>

" Copy, paste, delete remaps
" delete current word
nnoremap <silent> <leader>x viw"_d
" cut current word
nnoremap <silent> <leader>c "zdiw
" yank current word
nnoremap <silent> <leader>y "zyiw
" paste copied word
nnoremap <silent> <leader>v "zp
" paste copied word over selected
nnoremap <silent> <leader>b viw"zp
" save session and file
nnoremap <leader>s :mksession!<CR>

" Brackets helpers
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O
ino [<CR> [<CR>]<ESC>O
ino [;<CR> [<CR>];<ESC>O

" Plugins
" delete current buffer but keep window layout
map <leader>q :BD<CR>
" open fuzzy finder
nnoremap <leader>f :FZF<CR>
" show undo tree
map <leader>u :UndotreeToggle<CR>
" show file outline
map <leader>t :TagbarToggle<CR>
" go to next lint location
nnoremap <silent> <leader>n :ALENextWrap<CR>

" Language Client
" languageClient#textDocument_hover defined under leader maps
" give info about symbol under cursor
nnoremap <silent> <leader>i :call LanguageClient#textDocument_hover()<CR>
" rename symbol under cursor
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" show all references to symbol under cursor
nnoremap <silent> <F3> :call LanguageClient#textDocument_references()<CR>
" go to definition of symbol under cursor
nnoremap <silent> <F4> :call LanguageClient#textDocument_definition()<CR>





" COMMAND REMAPS
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q





" NEW COMMANDS
"command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw





" SETTINGS
" Line numbers
set number relativenumber

augroup numbertoogle
    autocmd!
    autocmd FocusGained,InsertLeave * set relativenumber
    autocmd FocusLost,InsertEnter * set norelativenumber
augroup END

" Disable auto comment continue
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Others
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

set ruler

set undolevels=1000
set backspace=indent,eol,start

set noshowmode
set signcolumn=yes
set hidden
set sessionoptions=buffers,curdir,folds,help,tabpages,winsize

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
filetype plugin on

" Terminal colors
if (has("termguicolors"))
    set termguicolors
endif

syntax on
"colorscheme onedark

noh
