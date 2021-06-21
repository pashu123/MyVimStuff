set noswapfile
set number
set nohls
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab
filetype plugin on
set scrolloff=5
set incsearch
set backspace=indent,eol,start  " more powerful backspacing
set mouse=c
" enabling status information in vim workfine for nvim
set laststatus=2
syntax on
" TextEdit might fail if hidden is not set.
set hidden


" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

" set format options everywhere
autocmd FileType * setlocal formatoptions-=o
autocmd FileType * setlocal formatoptions-=r


" install all the plugin over here
call plug#begin('~/.vim/plugged')
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'rstacruz/vim-closer'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'wincent/terminus'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-rooter'
Plug 'ambv/black'
call plug#end()

" leader and important mappings
let mapleader=" "
nnoremap <leader>, :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <C-s> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>g :GitGutterDisable <BAR> :set laststatus=0 <CR>
map<leader>sb :NERDTreeToggle<CR>
nmap <Leader>sf :NERDTreeFind<CR>
nnoremap Q <nop>

" ripgrep command for smartcase
let g:rg_command = 'rg --vimgrep -S'

" mapping split keys
nnoremap <Leader>] :exe "vertical resize +7" <CR>
nnoremap <Leader>[ :exe "vertical resize -7" <CR>

" Install plugin
nnoremap <leader>ip :PlugInstall <CR>

"Configuring the light line status bar
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'gitdiff': 'GitStatus'
      \ },
      \ }


" clangformat
" formatting code :FormatCode to format whole code
" whereas :FormatLines to format selected lines
"let g:clang_format#command = "/cb/tools/llvm/201910211756-206/bin/clang-format"

"Currently using default mode.
vnoremap <leader>fc :FormatLines <CR> \| :w <CR>
autocmd BufEnter *.inc :setlocal filetype=cpp
autocmd BufEnter *.mlir :setlocal filetype=cpp

" Enable disable relative numbering.
nnoremap <leader>rn :set rnu! <CR>

"enabling tabs i have ignored them for so long
nnoremap tn :tabnew<Space>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tk :tabfirst<CR>
nnoremap tj :tablast<CR>

"Let's Remap the tab in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Theme
colorscheme onedark

"Nerd Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1 
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
let g:formatter_yapf_style = 'pep8'


" this is for vim fugitive (for git)
nmap<leader>gj :diffget //3 <CR>
nmap<leader>gf :diffget //2 <CR>
nmap<leader>gs :G <CR>
nmap<leader>pf :Git push --force <CR>

" this is the mapping for fuzzy finder
" Here files is for all files, GFiles is for
" Git commited files search and BLines is for inside files search
" and bcommits is for commits search and buffer search finally
map <C-f> <Esc><Esc>:Files!<CR>
map <leader>ff <Esc><Esc>:Rg! 
map <leader>,f <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>
map <leader>b <Esc><Esc>:Buffers!<CR>
map <leader>cw <Esc><Esc>:! 

" Mapping for floatterm
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" Disable keys for better vim
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>
noremap <Home> <Nop>
noremap <End> <Nop>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>
inoremap <Home> <Nop>
inoremap <End> <Nop>

" Git gutter commands
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
set updatetime=250
nmap <Leader>gn <Plug>(GitGutterNextHunk)  " git next
nmap <Leader>gp <Plug>(GitGutterPrevHunk)  " git previous

" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)  " git add (chunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)   " git undo (chunk)<Paste>

" copy from anywhere
set clipboard=unnamedplus

" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <Leader>jp <Plug>(coc-definition)
let b:coc_diagnostic_disable=1
