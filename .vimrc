let mapleader = "\<Space>"
set nomodeline
set viminfo='1000,f1,:1000,/1000
set history=1000

set tabstop=4
set shiftwidth=4
set hidden
set number
set showcmd
set cursorline
set lazyredraw
filetype indent on
filetype plugin on
scriptencoding utf-8
set encoding=utf8
" enable mouse automatically
set mouse=a
" auto-hide when typing
set mousehide

" C style indentation
set cindent

" :W sudo save
command W w !sudo tee % > /dev/null

" always show current position
set ruler

" fix backspace to work as expected
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" clipboard; use unnamedplus when available
if has('clipboard')
   if has('unnamedplus')
      set clipboard=unnamed,unnamedplus
   else
      set clipboard=unnamed
   endif
endif

" backup
set backup
set backupdir=~/.vim/backups

" search options
" ignore case
set ignorecase
" highlight results
set hlsearch
" incremental search
set incsearch

" remember position in file after reopen
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" unless it's git: use first line when editing commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" merge conflict markers
map <leader>mc /\v^[<\|=>]{7}( .*\|$)<CR>
    
" easier comment blocks
ab #b /****************************************
ab #e ^V^H*****************************************/

" colors and fonts
" syntax highlighting
syntax enable
set t_Co=256
let base16colorspace=256  

set background=dark

" open a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" make CWD the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" toggle spellcheck
map <leader>ss :setlocal spell!<cr>

" remove Windows ^M when it occurs
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" open a scratchpad buffer
map <leader>q :e ~/buffer<cr>

" open a MD scratchpad buffer
map <leader>x :e ~/buffer.md<cr>

set rtp+=~/.vim/bundle/vundle
call vundle#rc

" Vundle manages Vundle: required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'
Plugin 'raimondi/delimitmate'
Plugin 'plasticboy/vim-markdown'

call vundle#end()

" allows cursor change in tmux mode
if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
