"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/bzs/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/bzs/.config/nvim/dein')
  call dein#begin('/home/bzs/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/bzs/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('zchee/deoplete-clang')
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" Required:
filetype plugin indent on

syntax enable

let g:python3_host_prog = '/home/bzs/dev/.virtualenvs/nvim/bin/python'
"Deoplete ===
let g:deoplete#enable_at_startup = 1
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " To close preview window of deoplete

let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'

