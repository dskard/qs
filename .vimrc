set nocompatible
syntax on
set number

" enable the mouse to be used for visual selections
set mouse=a

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

"for Go programming:
au BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 sts=4

" for Jenkinsfiles
autocmd BufNewFile,BufRead Jenkinsfile,*.Jenkinsfile,Jenkinsfile.* set syntax=groovy

" make yml jinja2 template files use yml syntax highlighting
au BufEnter *.yml.j2 exe "set syntax=yaml"

" make md markdown files use markdown syntax highlighting
"au BufEnter *.md exe "set syntax=markdown.pandoc"

"set list listchars=tab:��,trail:�
set list listchars=tab:>-,trail:-

"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme evening
"colorscheme calm
"colorscheme desert

set nocompatible              " be iMproved, required
filetype off                  " required

" turn off syntax for vimdiff
if &diff
    syntax off
endif

" using vim with a terminal
" use :rightb vertical terminal
" or  :below vertical terminal
" to open the terminal
"
" Editing the terminal?!?
" use Ctrl-w, N to enter 'Terminal-Normal' mode for scrolling
" or from https://stackoverflow.com/a/61996363
" use Ctrl-b to enter 'Terminal-Normal' mode with this remap:
tnoremap <c-b> <c-\><c-n>
" use i or a to exit 'Terminal-Normal' mode for regular terminal operation

" copy code into buffer
" Shift-V , "+y
"
" paste into shell
" Ctrl-Shift-V

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" install instructions from
" https://github.com/allexcd/vim-setup

" install vim-plug as a plugin manager
" do this in your shell:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then Open vim and type :PlugInstall
" or from the shell type `vim +PlugInstall`

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" List here the plugins with Plug commands
" See all possible ways to list a plugin: https://github.com/junegunn/vim-plug
" Ex: Plug 'https://github.com/username/reponame.git'

" Install typescript-vim plugin to enable typescript syntax support
Plug 'https://github.com/leafgarland/typescript-vim'

" Install vim-javascript plugin to enable javascript syntax highlighting
Plug 'https://github.com/pangloss/vim-javascript'

" Install YouCompleteMe plugin to to get completion suggestions automatically while typing
"Plug 'https://github.com/Valloric/YouCompleteMe'

" Syntax checking
" toggle auto-checking with
" :SyntasticToggleMode
Plug 'https://github.com/vim-syntastic/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"nnoremap <C-w>E :SyntasticCheck<CR>

" make syntastic's shellcheck plugin use the -x flag
" to allow for sourcing of files
" https://vi.stackexchange.com/a/10013
let g:syntastic_sh_shellcheck_args = "-x"

" markdown syntax highlighting
" https://github.com/gabrielelana/vim-markdown
"Plug 'gabrielelana/vim-markdown'
"Plug 'tpope/vim-markdown'

" r markdown syntax support
" https://github.com/vim-pandoc/vim-rmarkdown
Plug 'https://github.com/vim-pandoc/vim-rmarkdown'

" quarto-vim handles syntax highlighthing for qmd files
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'quarto-dev/quarto-vim'

" Solarized Colorscheme for Vim
Plug 'https://github.com/altercation/vim-colors-solarized'

" supertab
Plug 'https://github.com/ervandew/supertab'

" Asynchronous Lint Engine
" toggle with
" :ALEToggle
" :ALEEnable
Plug 'dense-analysis/ale'

" groovy syntax
Plug 'https://github.com/modille/groovy.vim'

" toml syntax
" https://github.com/cespare/vim-toml
Plug 'cespare/vim-toml', { 'branch': 'main' }

" packer / hashicorp syntax
" https://github.com/hashivim/vim-terraform.git
Plug 'hashivim/vim-terraform'
" https://github.com/hashivim/vim-vagrant
Plug 'hashivim/vim-vagrant'


" justfile syntax
" https://just.systems/man/en/chapter_11.html
" https://github.com/NoahTheDuke/vim-just
Plug 'NoahTheDuke/vim-just'

" Initialize the plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" setup vim-colors-solarized
syntax enable
" set background=light
set background=dark
"let g:solarized_termcolors=256
let g:solarized_contrast="high"
"let g:solarized_visibility="high"
colorscheme solarized
"call togglebg#map("<F4>")


" turn off quarto-vim's conceal stuff
let g:pandoc#syntax#conceal#use = 0

" disable folding?
" This resolves slow pasting into files with markdown syntax highlighting
" https://github.com/vim-pandoc/vim-pandoc/issues/316
let g:pandoc#modules#disabled = ["folding"]


" turn off vim-rmarkdown's code folding
set nofoldenable

"" install YouCompleteMe
"" don't forget to run the compiled part,
"" see qs/installs/youcompleteme.sh
"" disable YouCompleteMet with vim command:
"" let loaded_youcompleteme = 0
""Plugin 'valloric/YouCompleteMe'
"
"" leader key is backslash \
"
"" turn off YCM
""nnoremap <leader>Y :let g:ycm_auto_trigger=0<CR>
"
"" turn on YCM
""nnoremap <leader>y :let g:ycm_auto_trigger=1<CR>
"
"" YCM off by default
""let ycm_auto_trigger=0
"
""" enables auto closing of the preview window when
""" the user accepts the offered completion string
""let g:ycm_autoclose_preview_window_after_completion=1
""
""" map Jedi's jump to definition/declaration feature to the <leader>g shortcut
""nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
""
""" pull from keywords in the
""" 1. current file,
""" 2. other buffers (closed or still open),
""" 3. the current tags
""set complete=.,b,u,]
""
""
""set wildmode=longest,list:longest
""
""" shows a menu and, if available, any additional tips
""" such as the method signature or defining file
""set completeopt=menu,preview
