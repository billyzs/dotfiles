"dein setup script==================
if &compatible
  set nocompatible
endif
set runtimepath+=/home/bzs/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/bzs/.config/nvim/dein')
  call dein#begin('/home/bzs/.config/nvim/dein')

  call dein#add('/home/bzs/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi', {'on_ft': ['py']})
  " call dein#add('neomake/neomake')
  " call dein#add('zchee/deoplete-clang', {'on_ft': ['c', 'h', 'cpp', 'hpp']})
  call dein#end()
  call dein#save_state()
endif


filetype plugin indent on
syntax enable<Paste>
"end of dein setup====================

let g:python3_host_prog = '/home/bzs/dev/.virtualenvs/nvim/bin/python'

"deoplete =============
" call deoplete#enable()
let g:deoplete#enable_at_startup = 1 "enable with lazy load
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
"Python:
"inoremap <silent><expr> <Tab>
"    \ pumvisible() ? "\<C-n>" : deoplete#manual_complete()

"Clang:
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
let g:deoplete#sources#clang#std = [{'c': 'c11', 'cpp': 'c++1z', 'objc': 'c11', 'objcpp': 'c++1z'}]

