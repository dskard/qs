set nocompatible
syntax on
" tab multible lines at once
map t ma>'t'a
map T ma<'t'a

" rewrap a paragraph or a program comment
map <F5> gqap

" quickly switch buffers
map <F6> :b#<CR>

" convert to binary
map <F7> :%!xxd<CR>
map <F8> :%!xxd -r<CR>

" convert to binary
map <F9> <Esc>:!aspell -c --dont-backup "%"<CR>:e! "%"<CR><CR>

" backspace and delete stuff
"noremap Bs Del
"noremap Del Bs
"noremap!Bs Del
"noremap!Del Bs
set bs=2

runtime macros/matchit.vim

set autoindent
set ruler
" interpret tab as an `indent' command instead of an insert-a-tab command
"set softtabstop=4
"indent with four spaces when hitting tab
set shiftwidth=4
set tabstop=4
"expand all tabs to spaces according to shiftwidth parameter
set expandtab
"
set rulerformat=%40(%m%r%=%l,%c%V,0x%B,%o\ %P%)

"enable filetype detection:
filetype on

filetype plugin on

"for C-like programming:
autocmd FileType c,cpp,cc,py,tcl,tk,pl,m,sh set shiftwidth=4 tabstop=4

"for tex programming:
autocmd FileType tex set shiftwidth=2 tabstop=2

au FileType make setlocal noexpandtab

" make swig interface files use c syntax highlighting
au BufEnter *.i exe "set syntax=c"

" make procmailrc files use sh syntax highlighting
au BufEnter .procmailrc exe "set syntax=sh"


"set list listchars=tab:��,trail:�
set list listchars=tab:>-,trail:-

"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme evening
"colorscheme calm
colorscheme desert
