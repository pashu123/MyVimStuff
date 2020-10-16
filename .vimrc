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
Plug 'rhysd/vim-clang-format'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'Chiel92/vim-autoformat'
Plug 'Valloric/YouCompleteMe'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'
Plug 'ambv/black'
Plug 'wesQ3/vim-windowswap'
Plug 'kshenoy/vim-signature'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'voldikss/vim-floaterm'
Plug 'wincent/terminus'
" Plug 'APZelos/blamer.nvim'
call plug#end()


" leader and important mappings
let mapleader=" "
nnoremap <leader>, :vsplit ~/.vimrc<CR>
nnoremap <C-s> :source ~/.vimrc<CR>
nnoremap <leader>g :GitGutterDisable <BAR> :set laststatus=0 <CR>
map<leader>sb :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
nnoremap Q <nop>

" mapping split keys
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <Leader>] :exe "vertical resize +7" <CR>
nnoremap <Leader>[ :exe "vertical resize -7" <CR>

nnoremap <leader>ip :PlugInstall <CR>


"Configuring the light line status bar
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


" clangformat
" Adding for auto detection of style
" g:clang_format#code_style is a base style. llvm, google, chromium, mozilla
" It's a vnoremap only changes part of code.
let g:clang_format#code_style='google'
let g:clang_format#detect_style_file=1
vnoremap <leader>fc :ClangFormat <CR> \| :w <CR>
inoremap <leader>afc :ClangFormat <CR> \| :w <CR>
autocmd BufEnter *.inc :setlocal filetype=cpp

" ripgrep command for smartcase
let g:rg_command = 'rg --vimgrep -S'

" some autoformat and defaults
nnoremap <leader>la :Autoformat <CR> \| :w <CR>
nnoremap <leader>pyf :Black <CR> \| :w <CR>
nnoremap <leader>rn :set rnu! <CR>
nnoremap <leader>gc :GCheckout <CR>

"enabling tabs i have ignored them for so long
nnoremap tn :tabnew<Space>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tk :tabfirst<CR>
nnoremap tj :tablast<CR>

" git lens like feature show code 
" let g:blamed_enabled = 0
" let g:blamer_delay = 500
" nnoremap <leader>gb :BlamerToggle <CR>
" let g:blamer_show_in_visual_modes = 0
" let g:blamer_date_format = '%d/%m/%y'


"Let's Remap the tab in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"Color Settings
" If you have vim >=8.0 or Neovim >= 0.1.5
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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
nmap<leader>pf :Gpush --force <CR>

" this is the mapping for fuzzy finder
" Here files is for all files, GFiles is for
" Git commited files search and BLines is for inside files search
" and bcommits is for commits search and buffer search finally
map <C-f> <Esc><Esc>:Files!<CR>
map <leader>ff <Esc><Esc>:Rg! 
map <leader>,f <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>
map <leader>b <Esc><Esc>:Buffers!<CR>
map <leader>cw <Esc><Esc>:FloatermToggle<CR> 

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

" YCM conf
" install with .install.py --clangd-completer
let g:ycm_global_ycm_extra_conf = '~/ycm_extra_conf.py'
let g:ycm_use_clangd = 1
let g:ycm_max_diagnostics_to_display = 500
let g:ycm_always_populate_location_list = 0
let g:ycm_auto_hover = ""
nnoremap <silent> <Leader>jp :YcmCompleter GoTo<CR>
