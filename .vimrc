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

" spell check
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
autocmd FileType tex,js,html set shiftwidth=2 tabstop=2

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

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" install supertab
Plugin 'ervandew/supertab'

" install YouCompleteMe
" don't forget to run the compiled part,
" see qs/installs/youcompleteme.sh
" disable YouCompleteMet with vim command:
" let loaded_youcompleteme = 0
Plugin 'valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" leader key is backslash \

" turn off YCM
nnoremap <leader>Y :let g:ycm_auto_trigger=0<CR>

" turn on YCM
nnoremap <leader>y :let g:ycm_auto_trigger=1<CR>

" YCM off by default
let ycm_auto_trigger=0

"" enables auto closing of the preview window when
"" the user accepts the offered completion string
"let g:ycm_autoclose_preview_window_after_completion=1
"
"" map Jedi's jump to definition/declaration feature to the <leader>g shortcut
"nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
"" pull from keywords in the
"" 1. current file,
"" 2. other buffers (closed or still open),
"" 3. the current tags
"set complete=.,b,u,]
"
"
"set wildmode=longest,list:longest
"
"" shows a menu and, if available, any additional tips
"" such as the method signature or defining file
"set completeopt=menu,preview
"
"
"let g:python3_host_prog='/opt/anaconda2/5.0.1/bin/python2'
"let g:python_host_prog='/opt/anaconda3/5.0.1/bin/python3'
