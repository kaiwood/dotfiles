set nocompatible 

" setup pathogen (~/.vim/bundle support)
runtime! autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Encoding
set encoding=utf8
set fileencoding=utf8

" General stuff
set background=dark 
set ttyfast
" filetype plugin indent on
if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  colo default
  syntax on
endif

set syntax=on 
set vb t_vb="" " disable error beep AND visual bell
set mouse=a 
set backspace=indent,eol,start 
set autowrite 
set history=100
set tabpagemax=10 
set showmode 
set showcmd
set showmatch
set linespace=0 
set autowriteall
set gdefault " default g flag on substitutions
set hidden
set wmh=0
set novisualbell

" search stuff
set incsearch
set hlsearch
set ignorecase 
set smartcase 

" statusline
set laststatus=2
set statusline=%F%m%r%h%w\ [%{&ff}]\ %y\ 
set statusline+=%{rvm#statusline()}
set statusline+=%{fugitive#statusline()}
set statusline+=\ [ascii:\ %03.3b]\ 
set statusline+=\ [%4l,%4v]\ [%p%%]\ 

" Backup/Swap stuff
set backup
set backupdir=$HOME/.vimbackup//
set directory=$HOME/.vimswap//
set viewdir=$HOME/.vimviews//
set noswapfile
 
silent execute '!mkdir -p $HOME/.vimbackup'
silent execute '!mkdir -p $HOME/.vimswap'
silent execute '!mkdir -p $HOME/.vimviews'

" Indentation
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" set autoindent
" set cindent
" set cinoptions=(0
" set cinwords=if,else,while,do,for,switch,case


" Key bindings
let mapleader=","
 
" nnoremap ü <C-]>
" nnoremap Ü <C-O>
 
map <c-ö> <c-]>
map <c-y> <c-a>

nnoremap <leader>ee Go<ESC>:.!ruby %<RETURN>

" Easier moving in tabs and windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
map <C-K> <C-W>k

" shift key fixes
" cmap W w
" cmap WQ wq
" cmap wQ wq
" cmap Q q
" cmap Tabe tabe

" forgot sudo?
" cmap w!! w !sudo tee % >/dev/null

" Leader shortcuts for Rails commands
map <Leader>rm :Rmodel 
map <Leader>rc :Rcontroller 
map <Leader>rv :Rview 
map <Leader>rh :Rhelper 
" map <Leader>u :Runittest 
" map <Leader>f :Rfunctionaltest 
" map <Leader>tm :RTmodel 
" map <Leader>tc :RTcontroller 
" map <Leader>tv :RTview 
" map <Leader>tu :RTunittest 
" map <Leader>tf :RTfunctionaltest 
" map <Leader>sm :RSmodel 
" map <Leader>sc :RScontroller 
" map <Leader>sv :RSview 
" map <Leader>su :RSunittest 
" map <Leader>sf :RSfunctionaltest 

" fugitive binds
map <Leader>gs :Gstatus<cr>
map <Leader>gc :Gcommit<cr>

map <Leader>7 :nohlsearch<cr>


" autocmd for different file types
autocmd FileType text setlocal textwidth=78

autocmd BufEnter *.cpp set softtabstop=4 shiftwidth=4 expandtab makeprg=g++\ -Wall\ -o\ %:r\ %
autocmd BufEnter *.c set softtabstop=4 shiftwidth=4 expandtab makeprg=gcc\ -Wall\ -o\ %:r\ %
autocmd BufEnter *.java set softtabstop=4 shiftwidth=4 expandtab makeprg=javac\ %
autocmd BufRead *.java set include=^#\s*import
autocmd BufRead *.java set includeexpr=substitute(v:fname,'\\.','/','g')
autocmd BufEnter *.rb set tabstop=2 shiftwidth=2 expandtab
autocmd BufEnter *.sh set tabstop=4 shiftwidth=4 expandtab 
autocmd BufEnter *.php set tabstop=4 shiftwidth=4 expandtab 
autocmd BufEnter *.py set tabstop=4 shiftwidth=4 expandtab
autocmd BufEnter *.html set tabstop=2 shiftwidth=2 expandtab

" tab completion
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
vnoremap <C-F>   =$
nnoremap <C-tab> mzvip=`z

function! OverloadedTabKey()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<tab>"
    else
      if &omnifunc != '' 
        return "\<c-x>\<c-o>"
      elseif &dictionary != ''
        return "\<c-k>"
      else
        return "\<c-n>"
      endif
    endif
endfunction
"inoremap <tab> <c-r>=OverloadedTabKey()<cr>

set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

"ruby
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
" highlight Pmenu ctermbg=238 gui=bold


autocmd FileType ruby let g:surround_40 = "(\r)"
autocmd FileType ruby let g:surround_91 = "[\r]"
autocmd FileType ruby let g:SuperTabDefaultCompletionType = "context"

"NERD_Tree config
let NERDTreeChDirMode=2
let NERDTreeWinSize=35

" TList config
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40

" ragtag config
let g:ragtag_global_maps = 1

" delimitMate
" let g:delmitMate_expand_cr = 1

" Misc GUI stuff
if has("gui_running")

    set go-=T
    set go-=l
    set go-=r
    set go-=R
    set go-=L
    set go-=b

    set number
    set numberwidth=5
    set cursorline
    colo luciusx

    " MacVim specifix stuff
    if has("gui_macvim")
      set linespace=1
      set fuoptions=maxvert,maxhorz
      set guifont=DejaVu\ Sans\ Mono:h12
      let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
    endif

    if has("gui_gtk2")
      set guifont=Terminus\ 10
      let g:ackprg="ack-grep -H --nocolor --nogroup --column"
    endif

    " Windows stuff... just in case ;)
    if has("win32") || has("win64")

    endif

    au VimEnter * Tlist
    au VimEnter * NERDTree
    au VimEnter * wincmd p

    " change representation of invisibles 
    set listchars=tab:▸\ ,eol:¬
    " shortcut to toggle invisible
    nmap <leader>l :set list!<CR>
    

    
endif

" Source the vimrc file after saving it
if has("autocmd")
  " autocmd bufwritepost .vimrc source $MYVIMRC
  autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl
endif

