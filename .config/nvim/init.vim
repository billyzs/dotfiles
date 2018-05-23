" # installation notes: 
" cd ~/.config/nvim
" $ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" $ sh ./installer.sh ./dein
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
filetype plugin indent on

syntax enable

let g:python3_host_prog = '/home/bzs/devel/.virtualenvs/neovim/bin/python3'
let g:loaded_python_provider = 1 " disable python2 support

" Required:
set runtimepath+=/home/bzs/.config/nvim/repos/dein

" Required:
if dein#load_state('/home/bzs/.config/nvim/repos')
  call dein#begin('/home/bzs/.config/nvim/repos')

  " Let dein manage dein
  " Required:
  call dein#add('/home/bzs/.config/nvim/repos/dein')

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('zchee/deoplete-clang')
  call dein#add('tomasr/molokai')
  call dein#add('w0rp/ale')
  call dein#add('vim-airline/vim-airline')
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif


"Deoplete ============================================================
let g:deoplete#enable_at_startup = 1
" set sources
" let g:deoplete#sources = {}
" let g:deoplete#sources.cpp = ['LanguageClient']
" deoplete-clang
let g:deoplete#sources#clang#flags = ['-pthread', '-Wall']
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
" let g:deoplete#sources#clang#executable = '/usr/bin/clang'

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " To close preview window of deoplete

"ale
let g:ale_virtualenv_dir_names = ['/home/bzs/dev/.virtualenvs/nvim']
let g:ale_python_yapf_executable = 'yapf'

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:AirlineTheme = 'molokai'

"Misc ============================================================
imap jj <Esc>
" Enable filetype plugins
filetype plugin on
filetype indent on
" toggle between relative and abs line number
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
color molokai
set tabstop=4
" Turn on the WiLd menu
set wildmenu
command Q execute "q!"
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
set autoread " Set to auto read when a file is changed from the outside

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4


