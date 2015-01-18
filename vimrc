" Bundles {{{
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'

Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/peaksea'

Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'gavinbeatty/dragvisuals.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'myusuf3/numbers.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'suy/vim-ctrlp-commandline'
Plugin 'christoomey/vim-tmux-navigator' " http://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
Plugin 'bling/vim-airline'

Plugin 'klen/python-mode'
Plugin 'scrooloose/Syntastic'


" pandoc
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
"Plugin 'vim-pandoc/vim-pandoc-after'
Plugin 'junegunn/goyo.vim'

"Plugin 'jkoz/dmenu.vim'
"Plugin 'vimoutliner/vimoutliner'
"Plugin 'vim-scripts/vcscommand.vim'
"Plugin 'vim-scripts/dbext.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'sjl/gundo.vim'
"Plugin 'naquad/ctrlp-digraphs.vim'
"Plugin 'atweiden/vim-betterdigraphs'
"Plugin 'chrisbra/unicode.vim'
"Plugin 'vim-scripts/vim-auto-save'
"Plugin 'ervandew/eclim'
"Plugin 'airblade/vim-rooter'

call vundle#end()
filetype plugin indent on
syntax on

"...All your other bundles...
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" }}}
" Mappings {{{
let mapleader = ","

" jk as escape
ino jk <esc>
vn jk <esc>

"nn ; :
nn <leader>s :so $MYVIMRC<cr>
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
nn <silent> <F11> :exe "vert res -2" <cr>
nn <silent> <F12> :exe "vert res +2" <cr>
nn <silent> <F9>  :exe "res -2" <cr>
nn <silent> <F10> :exe "res +2" <cr>

" Toggle wrap
nn <Leader>W :setl nowrap! <CR>

" Case insensitive search use easy motion instead
nn / /\v
vn / /\v

" match bracket pairs with tab is a hell of a lot easier than %
nn <tab> %
vn <tab> %

" clear search match
nn <silent> <leader><space> :nohl<cr>

" Quick quit
nn <silent> q :q<cr>
nn <silent> - :bd<cr>

" copy full directory path of opened file to clipboard
nmap cpd :let @+ = expand("%:p:h")<CR>
" copy full file path of opened file to clipboard
nmap cpf :let @+ = expand("%:p")<CR>


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
se cursorcolumn

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
"se dict=/usr/share/dict/words
set complete=.,b,u,]
set wildmode=longest,list:longest
"set completeopt=menu,preview
set completeopt=menuone,menu,longest
" }}}
" color {{{
colo solarized
set background=dark
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

    " handle for note taking files
    au BufRead,BufNewFile notes setl textwidth=139 " for coding

    au BufRead,BufNewFile *.c,*.h,*.hh setl tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab foldmethod=manual foldlevel=0
    au BufRead,BufNewFile *.h,*.hpp,*.cc,*.cpp setl tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab foldmethod=manual foldlevel=0
augroup END
" }}}
" Plugins {{{
" Tag bar {{{
let g:tagbar_autofocus = 1
nn <silent> <leader>t :TagbarToggle<cr>
" }}}
" Nerd tree {{{
nn <leader>n :NERDTreeToggle<CR>
nn <leader>nf :NERDTreeFind<CR>
" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let g:NERDTreeDirArrows=0
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
" Quit on opening files from the tree
" let NERDTreeQuitOnOpen=2
let NERDTreeWinSize = 40
" Highlight the selected entry in the tree
"let NERDTreeHighlightCursorline=1
" Use a single click to fold/unfold directories and a double click to open files
let NERDTreeMouseMode=2
" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '\.svn$', '^target$', '^\.settings$', '^\.classpath$', '^\.project$', '^\.hg', '.pydevproject'  ]
" }}}
" Ctrlp {{{
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_max_height = 5
let g:ctrlp_max_files=100000
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_use_caching = 0

nn <silent> <Leader>o :CtrlPBufTag<CR>
nn <silent> <Leader>b :CtrlPBookmarkDir<CR>
nn <silent> <Leader>z :CtrlPBuffer<CR>
nn <silent> <Leader>m :CtrlPMRUFiles<CR>

let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'commandline',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
" CtrlPCommandline
com! CtrlPCommandline cal ctrlp#init(ctrlp#commandline#id())
nn <silent> <Leader>q :CtrlPCommandline<CR>
" CtrlPUnicode
com! CtrlPUnicode call ctrlp#init(ctrlp#unicode#id())
" }}}
" Dmenu {{{
let g:dmenu_backend = "dmenu -l 10"
" }}}
" dbext {{{
let g:dbext_default_profile_192_168_95_227_replaceme='type=MYSQL:user=root:passwd=mysql:dbname=replaceme:host=192.168.95.227'
let g:dbext_default_profile_192_168_95_228_replaceme='type=MYSQL:user=root:passwd=mysql:dbname=replaceme:host=192.168.95.228'
let g:dbext_default_profile_192_168_95_111_NI='type=MYSQL:user=root:passwd=mysql:dbname=NI:host=192.168.95.111:port=3307'
let g:dbext_default_profile_192_168_99_246_NI='type=MYSQL:user=root:passwd=mysql:dbname=NI:host=192.168.99.246'
" }}}
" Eclim {{{
nn <silent> <Leader>l :LocateFile<CR>
nn <silent> <Leader>s :JavaSearchContext<CR>
nn <silent> <Leader>i :JavaImport<CR>
nn <silent> <Leader>p :ProjectsTree<CR>
nn <silent> <Leader>h :JavaHierarchy<cr>
" FIXME: conflict with dmenufm
"xn <silent> <Leader>f :JavaFormat<cr>
nn <silent> <Leader>j :JavaDocComment<cr>

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
" dragvisuals {{{
vm <expr> H DVB_Drag('left')
vm <expr> L DVB_Drag('right')
vm <expr> J DVB_Drag('down')
vm <expr> K DVB_Drag('up')
vm <expr> D DVB_Duplicate()
" }}}
" betterdigraphs {{{
"inoremap <expr>  <C-K>  BDG_GetDigraph()
" }}}
" Ack {{{
nn <silent> <Leader>a :Ack <cword><cr>
let g:ackprg = 'ag'
let g:ack_default_options = " -H --nocolor --nogroup --column"
" }}}
" utilsnip{{{
"let g:UltiSnipsExpandTrigger="<c-g>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
" }}}
" YouCompleteMe {{{
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1

" default search for current directory for ycm_extra_conf
let g:ycm_global_ycm_extra_conf = "./.ycm_extra_conf.py"

" avoid conflict with other plugins use tab (snippets)
"let g:ycm_key_list_previous_completion=['<Up>']
"let g:ycm_key_list_select_completion=['<Down']
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']


" auto close preview
let g:ycm_autoclose_preview_window_after_completion=1

" debug
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
" }}}
" SuperTab {{{
let g:SuperTabDefaultCompletionType = '<C-Tab>'
" }}}
" gui {{{
if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    "set guifont=Consolas\ 12
endif
" }}}
" numbers {{{
nn <leader>N :NumbersToggle<cr>
let g:enable_numbers = 0
" }}}
" pandoc {{{
let g:pandoc#after#modules#enabled = ["supertab", "ultisnips", "goyo"]

"Markdown to HTML
"nmap <leader>md :%!/usr/local/bin/markdown --html4tags <cr>

function! Vim_Markdown_Preview()
  let curr_file = expand('%:p')
  call system('markdown ' . curr_file . ' > /tmp/vim-markdown-preview.html')
  let chrome_wid = system("xdotool search --name 'vim-markdown-preview.html - Chromium'")
  if !chrome_wid
    "sleep 300m
    call system('chromium /tmp/vim-markdown-preview.html &> /dev/null &')
    let chrome_wid = system("xdotool search --name 'vim-markdown-preview.html - Chromium'")
    call system('xdotool windowactivate ' . chrome_wid)
  else
    let curr_wid = system('xdotool getwindowfocus')
    call system('xdotool windowmap ' . chrome_wid)
    call system('xdotool windowactivate ' . chrome_wid)
    call system("xdotool key 'ctrl+r'")
    "call system('xdotool windowactivate ' . curr_wid)
  endif
  "sleep 700m
  "call system('rm /tmp/vim-markdown-preview.html')
endfunction

"autocmd Filetype markdown,md map <buffer> <C-p> :call Vim_Markdown_Preview()<CR>
"autocmd BufWritePost *.markdown,*.md :call Vim_Markdown_Preview()
" }}}
" Goyo {{{
let g:goyo_width = 140
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
let g:goyo_linenr = 0
" }}}
"
