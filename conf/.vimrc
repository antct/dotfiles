" syntax
syntax enable

" show
set number
set ruler
set showcmd
set showmode

" bell
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" cursor
set cursorline

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
noremap <silent><leader>/ :nohls<CR>

" swap
set noswapfile

" mouse
set mouse-=a

" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set shiftround

" indent
set autoindent
set cindent
set smartindent

" encoding
set fileformat=unix
set encoding=utf-8

" right click paste
set clipboard^=unnamed,unnamedplus

" 256-color support
set t_Co=256

" reload
autocmd! bufwritepost _vimrc source %
autocmd! bufwritepost .vimrc source %"

" plug
set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
" centos not support
" Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
" Plug 'wakatime/vim-wakatime'
" Plug 'davidhalter/jedi-vim'
call plug#end()

" vim theme papercolor
set background=dark
let g:PaperColor_Theme_Options={
\   'theme': {
\     'default': {
\       'transparent_background': 1
\     }
\   }
\ }
colorscheme PaperColor

" lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }

" tab keymap
nnoremap <C-l> :tabn<cr>
nnoremap <C-h> :tabp<cr>
nnoremap <C-n> :tabnew<cr>
" buffer keymap
nnoremap <C-k> :bn<cr>
nnoremap <C-j> :bp<cr>
nnoremap <C-o> :open<Space>

" easymotion
" <Leader>f{char} to move to {char}
map  <Leader>c <Plug>(easymotion-bd-f)
nmap <Leader>c <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)"

" tagbar \tb toggle tagbar
nnoremap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='~/.ctags/bin/ctags'
let g:tagbar_compact=1
let g:tagbar_width=30
let g:tagbar_right_=1
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py call tagbar#autoopen()

" jedi
let g:jedi#auto_initialization=1
let g:jedi#show_call_signatures=2
let g:jedi#completions_command="<C-t>"

" fold
let g:SimpylFold_docstring_preview=1
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" indent
let g:indentLine_enabled=1

" ctrlp
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
" <Leader>f MRU
nnoremap <Leader>f :CtrlPMRUFiles<CR>
" <Leader>b BUFFER
nnoremap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching=0
endif

" ctrls
nnoremap <C-f> :CtrlSF<Space>
let g:ctrlsf_default_view_mode='compact'

" nerdtree 
" \nt toggle nerdtree
nnoremap <LEADER>nt :NERDTreeToggle<CR>
let g:NERDTreeWinPos='left'
let g:NERDChristmasTree=1
let g:NERDTreeHighlightCursorline=1
let g:NERDTreeWinSize=30
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
" let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
" if no file open nerdtree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autoopen nerdtree
" autocmd vimenter * NERDTree

"nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }
