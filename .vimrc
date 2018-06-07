execute pathogen#infect()
syntax on
filetype indent plugin on
set number
set hlsearch
set hidden

set expandtab
set autoindent
set formatoptions=croql
set directory=/tmp

let mapleader = ","
noremap <leader><ESC> :nohl<CR>
noremap <F2> :w<CR>
noremap <F4> :bd<CR>
"noremap <F5> :bprev<CR>
"noremap <F6> :bnext<CR>
noremap <F5> <C-O>
noremap <F6> <C-I>

noremap <C-B> :CtrlPBuffer<CR>
noremap <C-F> :ClangFormatAutoToggle<CR>

nnoremap <leader>g :YcmCompleter GoTo<CR>

let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_open_multiple_files = 'i'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'max:20'
let g:ctrlp_follow_symlinks = 0

let g:ycm_global_ycm_extra_conf = '~/ycm_extra_conf.py'
let g:ycm_filetype_specific_completion_to_disable = { 'cpp': 0 }

let g:clang_format#enable_fallback_style = 0
let g:clang_format#command="clang-format-5.0"
let g:clang_format#auto_format=0

let g:clang_format#auto_format_on_insert_leave = 1
"Fix problems with this sticking. vim-clang-format enables it from FileType
"events.
au BufEnter *.{cc,h} :call clang_format#enable_format_on_insert()

let g:clang_format#style="google"

fun! BufRefresh()
  set noconfirm
  bufdo set eventignore-=Syntax | e!
  set confirm
endfun

""nmap <C-F4> :bufdo bd<CR>
nmap <C-F5> :call BufRefresh()<CR>

function! FileTime()
  let msg=strftime("%m/%d %H:%M:%S",getftime(expand("%")))
  return msg
endfunction
let g:airline_section_y='%{FileTime()}'
