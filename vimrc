" Bundles {{{
if !filereadable(expand('~/.vim/autoload/plug.vim'))
    sil !mkdir -p ~/.vim/plugged
    sil !git clone https://github.com/junegunn/vim-plug ~/.vim/autoload
    :PlugInstall
endif

cal plug#begin('~/.vim/plugged')

"Plug 'Valloric/YouCompleteMe'
Plug 'altercation/vim-colors-solarized'
Plug 'edsono/vim-matchit'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'gavinbeatty/dragvisuals.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-dispatch'
Plug 'osyo-manga/vim-hopping'
Plug 'myusuf3/numbers.vim'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'scrooloose/Syntastic'
Plug 'tpope/vim-markdown'
Plug 'nelstrom/vim-markdown-folding'
Plug 'reedes/vim-colors-pencil'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-litecorrect'
Plug 'gerw/vim-latex-suite'
Plug 'fatih/vim-go'

"Plug 'SirVer/ultisnips'
"Plug 'mhinz/vim-startify'
"Plug 'kien/ctrlp.vim', { 'on': ['CtrlP', 'DmenuFM', 'DmenuBuffer', 'DmenuMRU', 'DmenuBufTag', 'DmenuHistory', 'DmenuLines'] }
"Plug 'jkoz/vim-fzf', { 'on': ['Dmenu', 'DmenuFM', 'DmenuBuffer', 'DmenuMRU', 'DmenuBufTag', 'DmenuHistory', 'DmenuLines'] }
"Plug 'airblade/vim-gitgutter'
"Plugin 'ervandew/supertab'
"Plugin 'klen/python-mode'
"Plugin 'vim-scripts/vcscommand.vim'
"Plugin 'vim-scripts/dbext.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'sjl/gundo.vim'
"Plugin 'atweiden/vim-betterdigraphs'
"Plugin 'chrisbra/unicode.vim'
"Plugin 'vim-scripts/vim-auto-save'
"Plugin 'ervandew/eclim'
"Plugin 'airblade/vim-rooter'

call plug#end()

filetype plugin indent on
syntax on

" }}}
" Mappings {{{
let mapleader = ","

" jk as escape
ino jk <esc>
vn jk <esc>

"nn ; :
"nn <leader>r :so $MYVIMRC<cr> use for dispatch
"se verbose=0

" switching vim window buffer
" TODO: c-j conflict utilsnip
"map <c-j> <c-w>j<c-w>_
"map <c-k> <c-w>k<c-w>_
"map <c-h> <c-w>h<c-w>_
"map <c-l> <c-w>l<c-w>_

" this good but i familiar with shift ;
nn ; :
nn : ;

nn v <C-V>
nn <C-V> v

vn v <C-V>
vn <C-V> v

" map copy/paste
vm <C-c> "+y
nn <C-v> "+p

" resize vim
"nn <silent> <F11> :exe "vert res -2" <cr>
"nn <silent> <F12> :exe "vert res +2" <cr>
"nn <silent> <F9>  :exe "res -2" <cr>
"nn <silent> <F10> :exe "res +2" <cr>

" Toggle wrap
nn <Leader>W :setl nowrap! <CR>

" Case insensitive search use easy motion instead
nn / /\v
vn / /\v

" match bracket pairs with tab is a hell of a lot easier than %
map <tab> %

" clear search match
nn <silent> <leader><space> :nohl<cr>

" Quick quit
nn <silent> q :q<cr>
nn <silent> - :bd<cr>

" Quick save
nn <leader>w :update<cr>

" copy full directory path of opened file to clipboard
nmap cpd :let @+ = expand("%:p:h")<CR>
" copy full file path of opened file to clipboard
nmap cpf :let @+ = expand("%:p")<CR>

" conceal
"let g:tex_conceal="adgm"

" format paragrath, see textwidth
vm Q gq
nma Q gqap

" clear trailing space
nn <leader>y :%s/\s\+$//<cr>

" }}}
" Options {{{
if v:version >= 600
    se autoread
    se foldmethod=marker
    se printoptions=paper:letter
    se sidescrolloff=5
    se mouse=nvi
en

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    en
    scriptencoding utf-8,latin1
    se encoding=utf-8
    setg fileencoding=utf-8
    se fileencodings=ucs-bom,utf-8,latin1
en


"se relativenumber
se t_Co=256
se sw=4
se autowrite
se title
se list
set listchars=tab:\|\ ,extends:>,precedes:<,nbsp:~,trail:.

se ttyfast
se ttyscroll=3
se lazyredraw
se synmaxcol=174

" No swap files
se nobackup
se nowritebackup
se noswapfile

se hidden
se ignorecase
se smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
se smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop

se showmatch " set show matching parenthesis
se incsearch " show search matches as you type
se hlsearch " highlight search terms

se noai " always set autoindenting on
se nosi " no smart indenting
se copyindent " copy the previous indentation on autoindenting

" windows stuffs
se equalalways
"se eadirection

se backspace=indent,eol,start " allow backspacing over everything in insert mode
se showmode " always show what mode we're currently editing in
se showcmd "
se scrolloff=4 " keep 4 lines off the edges of the screen when scrolling
se virtualedit=all " allow the cursor to go in to "invalid" places
se mouse=a " enable mouse

se pastetoggle=<F2> " when in insert mode, press <F2> to go to paste mode, where you can paste mass data that won't be autoindented
se fileformats="unix,dos,mac"
se wildmenu " make tab completion for files/buffers act like bash
se ruler " Show the cursor position all the time
se laststatus=2
se gdefault " :%s/foo/bar/g by default

se history=700 " remember more commands and search history
se undolevels=700 " use many muchos levels of undo

se softtabstop=4 shiftwidth=4 tabstop=4 " not tabs, but spaces

se expandtab
se shiftround " use multiple of shiftwidth when indenting with '<' and '>'

"se number " turn on number
"se nonumber " turn on number
se cursorline " highlight current light
"se cursorcolumn

" paragraph {{{
se nowrap
se textwidth=80 " for coding
se wrapmargin=0
se formatoptions=vt " t: automatetic text wrapping
"}}}

se makeprg=make

" fold {{{
se foldenable
se foldmethod=manual
se foldlevelstart=0   " close all fold by default
nnoremap <space> za  " space open/closes folds
"}}}

se sidescroll=1
se sidescrolloff=10

se wildignore+=*.so,*.swp,*.zip,*.class,*.jar,*.gz,*pom.xml.org,*pyc,*.xls,*.svn
se wildignore+=*_build/*,*/coverage/*,*/target/*,*/tmp/*,*/lib/*,*/.settings/*,*/.git/*

" completeopt {{{
se dict=/usr/share/dict/cracklib-small
set complete=.,b,u,]
set wildmode=longest,list:longest
"set completeopt=menu,preview
set completeopt=menuone,menu,longest
" }}}
" color {{{
set background=dark
colo solarized
"}}}
"}}}
" Functions {{{
" strip \r (^M)
fu! DoStripCM()
    exe ":silent %s/\r//g"
endf
com! StripCM cal DoStripCM()

fu! MvnTest()
   exe "Mvn test -Dtest=" . expand("%:t:r")
endf
com! DoMvnTest cal MvnTest()

fu! MvnTestDebug()
    let l:cmd = "Mvn org.apache.maven.plugins:maven-surefire-plugin:2.9:test "
    let l:cmd = l:cmd . "-Dmaven.surefire.debug=\"-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=1111 -Xnoagent -Djava.compiler=NONE\" test "
    "let l:cmd = l:cmd . "-Dtest=" . expand("%:t:r")
    exe l:cmd
endf
com! DoMvnTestDebug cal MvnTestDebug()

" }}}
" Auto Groups {{{
aug configgroup
    au!
    au BufRead,BufNewFile *.html,*.xhtml,*.xml setl foldmethod=indent foldlevel=0
    au BufRead,BufNewFile *.vim setl shiftwidth=2 tabstop=2 foldmethod=marker foldlevel=0
    au BufNewFile,BufRead *.otl setl listchars=tab:\|\ ,extends:>,precedes:<,nbsp:~,trail:.
    au BufRead,BufNewFile *rc setl foldmethod=marker
    au BufRead,BufNewFile *.c,*.h,*.hh setl tabstop=4 softtabstop=4 expandtab foldmethod=manual foldlevel=0
    au BufRead,BufNewFile *.h,*.hpp,*.cc,*.cpp setl tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab foldmethod=manual foldlevel=0

aug END
" }}}
" Tag bar {{{
let g:tagbar_autofocus = 1
nn <silent> <leader>t :TagbarToggle<cr>

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

let g:tagbar_type_tex = {
    \ 'ctagstype' : 'latex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ]
\ }

" }}}
" Nerd Tree {{{
nn <leader>no :NERDTreeToggle<CR>
nn <leader>nf :NERDTreeFind<CR>

let g:NERDTreeDirArrows=0
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks") " Store the bookmarks file
let NERDTreeShowBookmarks=1 " Show the bookmarks table on startup
let NERDTreeShowFiles=1 " Show hidden files, too
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=2 " Quit on opening files from the tree
let NERDTreeWinSize = 40
let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree
let NERDTreeMouseMode=2 " Use a single click to fold/unfold directories and a double click to open files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '\.svn$', '^target$', '^\.settings$', '^\.classpath$', '^\.project$', '^\.hg', '.pydevproject'  ]
" }}}
" Fzf {{{

nn <silent> <c-p>     :CtrlP<CR>
"nn <silent> <leader>f :DmenuFM<CR>
nn <silent> <Leader>z :CtrlPBuffer<CR>
nn <silent> <Leader>m :CtrlPMRUFiles<CR>
nn <silent> <Leader>o :CtrlPBufTag<CR>
nn <silent> <Leader>q :CtrlPHistory<CR>
nn <silent> <Leader>l :CtrlPLines<CR>

if exists('$DISPLAY')
    let g:dmenu_backend = "fzf"
    let g:dmenu_launcher= 'st -c Fzf -e sh -c'
elsei exists('$TMUX')
    let g:dmenu_backend = "fzf-tmux"
    let g:dmenu_launcher= ''
el
    "nn <silent> <c-p>     :Dmenu<CR>
    "nn <silent> <leader>f :DmenuFM<CR>
    "nn <silent> <Leader>z :DmenuBuffer<CR>
    "nn <silent> <Leader>m :DmenuMRU<CR>
    "nn <silent> <Leader>o :DmenuBufTag<CR>
    "nn <silent> <Leader>q :DmenuHistory<CR>
    "nn <silent> <Leader>l :DmenuLines<CR>
    nn <silent> <c-p>     :CtrlP<CR>
    "nn <silent> <leader>f :DmenuFM<CR>
    nn <silent> <Leader>z :CtrlPBuffer<CR>
    nn <silent> <Leader>m :CtrlPMRUFiles<CR>
    nn <silent> <Leader>o :CtrlPBufTag<CR>
    nn <silent> <Leader>q :CtrlPHistory<CR>
    nn <silent> <Leader>l :CtrlPLines<CR>
en


" }}}
" Databse {{{
"let g:dbext_default_profile_192_168_95_227_replaceme='type=MYSQL:user=root:passwd=mysql:dbname=replaceme:host=192.168.95.227'
"let g:dbext_default_profile_192_168_95_228_replaceme='type=MYSQL:user=root:passwd=mysql:dbname=replaceme:host=192.168.95.228'
"let g:dbext_default_profile_192_168_95_111_NI='type=MYSQL:user=root:passwd=mysql:dbname=NI:host=192.168.95.111:port=3307'
"let g:dbext_default_profile_192_168_99_246_NI='type=MYSQL:user=root:passwd=mysql:dbname=NI:host=192.168.99.246'
" }}}
" Eclim {{{

nn <silent> <Leader>el :LocateFile<CR>
nn <silent> <Leader>es :JavaSearchContext<CR>
nn <silent> <Leader>ei :JavaImport<CR>
nn <silent> <Leader>ep :ProjectsTree<CR>
nn <silent> <Leader>eh :JavaHierarchy<cr>
xn <silent> <Leader>ef :JavaFormat<cr>
nn <silent> <Leader>ej :JavaDocComment<cr>

let g:EclimJavaSearchSingleResult='edit'
let g:EclimLocateFileDefaultAction='edit'
let g:EclimLocateFileScope = 'workspace'
let g:EclimCompletionMethod = 'omnifunc'

fu! CopyBreakPoint()
    let @+ = GetBreakPoint()
endf
com! DoCopyBreakPoint cal CopyBreakPoint()

fu! GetBreakPoint()
    return 'stop at ' . GetQualiedName() . ':' . line(".")
endf

fu! ClearAllBreakPoint()
    call writefile([], $HOME . "/.jdbrc")
endf
com! DoClearAllBreakPoint cal ClearAllBreakPoint()

fu! SetBreakPoint()
    cal AppendToFile($HOME . "/.jdbrc", [GetBreakPoint()])
    cal CopyBreakPoint()
endf
com! DoSetBreakPoint cal SetBreakPoint()

fu! GetQualiedName()
    let l:bp = substitute(split(getline("1"))[1], ';', '.', '')
    let l:bp = l:bp . substitute(expand('%:t'), '.java', '', '')
    return l:bp
endf

" }}}
" Drag visuals {{{
vm <expr> H DVB_Drag('left')
vm <expr> L DVB_Drag('right')
vm <expr> J DVB_Drag('down')
vm <expr> K DVB_Drag('up')
vm <expr> D DVB_Duplicate()
" }}}
" Better Digraphs {{{
"inoremap <expr>  <C-K>  BDG_GetDigraph()
" }}}
" Ack {{{
nn <silent> <Leader>a :Ack <cword><cr>
if executable('ag')
    let g:ackprg = "ag --nocolor --nogroup --column"
elseif executable('ack-grep')
    let g:ackprg = "ack-grep --nocolor --nogroup --column"
elseif executable('ack')
    let g:ackprg = "ack --nocolor --nogroup --column"
endif
" }}}
" Util snippet {{{
" - latex: only type key words, not the forwards slash
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
let g:UltiSnipsExpandTrigger = "<c-g>i" " a little bit slow to trigger!
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets = "<c-s-s>"
" }}}
" YouCompleteMe {{{
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>pg :YcmCompleter GoTo<CR>
nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>

"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1

" default search for current directory for ycm_extra_conf
let g:ycm_global_ycm_extra_conf = "./.ycm_extra_conf.py"

" avoid conflict with other plugins use tab (snippets)
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']


" auto close preview
let g:ycm_autoclose_preview_window_after_completion=1

" debug
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
" }}}
" Syntastic {{{
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
" }}}
" SuperTab {{{
"let g:SuperTabDefaultCompletionType = '<C-Tab>'
" }}}
" Pencil {{{
" soft mode use 1 line even if it is long line
let g:pencil#mode_indicators = {'hard': 'PH', 'soft': 'PS', 'off': ''}
aug pencil
    autocmd!
    autocmd FileType tex,latex
                \   call pencil#init({'wrap': 'soft', 'textwidth': 80, 'conceallevel': 3})
                \ | call litecorrect#init()
                \ | setl spell spl=en_us noru nonu nornu
                \ | setl fdo+=search
                \ | setl nocursorcolumn
                \ | let b:dispatch = "sh /usr/local/bin/preview '%:p'"
    autocmd FileType markdown,mkd,md
                \   call pencil#init({'wrap': 'soft', 'textwidth': 80, 'conceallevel': 3})
                \ | call litecorrect#init()
                \ | setl spell spl=en_us noru nonu nornu
                \ | setl fdo+=search
                \ | let b:dispatch = "sh /usr/local/bin/preview '%:p'"
    autocmd Filetype git,gitsendemail,*commit*,*COMMIT*
                \   call pencil#init({'wrap': 'soft', 'textwidth': 72})
                \ | call litecorrect#init()
                \ | setl spell spl=en_us et sw=2 ts=2 noai
    autocmd Filetype mail
                \   call pencil#init({'wrap': 'soft', 'textwidth': 60})
                \ | call litecorrect#init()
                \ | setl spell spl=en_us et sw=2 ts=2 noai nonu nornu
aug END
" }}}
" Airline {{{
let g:airline_section_x = '%{PencilMode()}'
" }}}
" Gui {{{
if has('gui_running')
    se guioptions-=m  "remove menu bar
    se guioptions-=T  "remove toolbar
    se guioptions-=r  "remove right-hand scroll bar
    se guioptions-=L  "remove left-hand scroll bar
    "set guifont=Cousine\ 10
    se guifont="Times New Roman 12"
    se nocursorcolumn

    se background=dark
    colo solarized
endif
" }}}
" Numbers {{{
nn <leader>N :NumbersToggle<cr>
let g:enable_numbers = 0
" }}}
" Goyo {{{
"let g:goyo_width = 150
"let g:goyo_margin_top = 2
"let g:goyo_margin_bottom = 2
"let g:goyo_linenr = 0
" }}}
" Latex {{{
let g:tex_conceal= 'admgS' " do not conceal 'textit' as there is a bug conceal 2 textit on the same line, only first match is conceal
" }}}
" Dispatch {{{
nn <leader>r :silent Dispatch!<CR>
" }}}
" Startify {{{
let g:startify_relative_path          = 0
let g:startify_files_number           = 8
let g:startify_session_persistence    = 1
let g:startify_session_autoload       = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir          = 1
let g:startify_enable_special         = 0
let g:startify_enable_unsafe          = 1
" }}}
" }}}
