" Notes {{{
"set digraph
" help digraph-table
" search PLUS-MINUS
" c^k +-
" }}}

" Bundles {{{

if empty(glob('~/.vim/bundle/Vundle.vim'))
    sil !mkdir -p ~/.vim/bundle
    sil !git clone http://github.com/VundleVim/Vundle.Vim ~/.vim/bundle/Vundle.vim
en

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'gavinbeatty/dragvisuals.vim'
Plugin 'kana/vim-metarw'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/vim-metarw-gdrive'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/Syntastic'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-litecorrect'
Plugin 'tpope/vim-dispatch'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'liuchengxu/vista.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'puremourning/vimspector'
Plugin 'easymotion/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'chrisbra/unicode.vim'
Plugin 'simeji/winresizer'
Plugin 'jceb/vim-orgmode'

call vundle#end()
filetype plugin indent on
syntax on

" }}}

" Mappings {{{
let mapleader = ","

" jk as escape
ino jk <esc>
vn jk <esc>

" change : to ;
nn ; :
nn : ;

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
se signcolumn=no

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


" paragraph
se nowrap
se textwidth=80 " for coding
se wrapmargin=0
se formatoptions=vt " t: automatetic text wrapping

se makeprg=make

" fold
se foldenable
se foldmethod=manual
se foldlevelstart=0   " close all fold by default
nnoremap <space> za  " space open/closes folds

se sidescroll=1
se sidescrolloff=10

se wildignore+=*.so,*.swp,*.zip,*.class,*.jar,*.gz,*pom.xml.org,*pyc,*.xls,*.svn
se wildignore+=*_build/*,*/coverage/*,*/target/*,*/tmp/*,*/lib/*,*/.settings/*,*/.git/*

" completion
se dict=/usr/share/dict/cracklib-small
se complete=.,b,u,]
se wildmode=longest,list:longest
"set completeopt=menu,preview
set completeopt=menuone,menu,longest

" color
se background=dark
colo solarized

"}}}

" fillchars {{{
" open :UnicodeTable
" in insert mode <C-v> and type U00B7
se fcs=vert:│
se fcs+=fold:·
se fcs+=diff:\ "the leading space is used
se fcs+=stl:-
se fcs+=stlnc:-
" }}}

" Statusline {{{
se ls=0
se stl=-
"se stl=[%f]\ " Path to the file
"se stl+=%=        " Switch to the right side
"se stl+=[%l]        " Current line
"se stl+=/         " Separator
"se stl+=[%L]        " Total lines

hi StatusLine ctermbg=NONE cterm=NONE ctermfg=2
hi StatusLineNC ctermbg=NONE cterm=NONE ctermfg=11

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
aug pencil
    autocmd!
    autocmd FileType tex,latex
                \   call pencil#init({'wrap': 'soft', 'textwidth': 80, 'conceallevel': 3})
                \ | call litecorrect#init()
                \ | setl spell spl=en_us noru nonu nornu
                \ | setl fdo+=search
                \ | setl nocursorcolumn
    autocmd FileType markdown,mkd,md
                \   call pencil#init({'wrap': 'soft', 'textwidth': 80, 'conceallevel': 3})
                \ | call litecorrect#init()
                \ | setl spell spl=en_us noru nonu nornu
                \ | setl fdo+=search
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

"let g:NERDTreeDirArrows=0
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

let g:NERDTreeStatusline = '%#NonText#'
" }}}

" FZF {{{
nn <silent> <c-p>     :FZF<CR>
nn <silent> <leader>z :Buffers<CR>
nn <silent> <leader>m :History<CR>
nn <silent> <leader>o :Tags<CR>
nn <silent> <leader>g :Command<CR>
nn <silent> <leader>l :Lines<CR>
nn <silent> <leader>f :History:<cr>
" }}}

" Drag visuals {{{
" TODO: tempory disable visual effect as we need to use J for join multiple lines
vm <expr> <c-h> DVB_Drag('left')
vm <expr> <c-l> DVB_Drag('right')
vm <expr> <c-j>  DVB_Drag('down')
vm <expr> <c-k>  DVB_Drag('up')
"vm <expr> D DVB_Duplicate()
" }}}

" Syntastic {{{
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
" }}}

" Pencil {{{
" soft mode use 1 line even if it is long line
let g:pencil#mode_indicators = {'hard': 'PH', 'soft': 'PS', 'off': ''}
" }}}

" Dispatch {{{
nn <leader>r :silent Dispatch!<CR>
" }}}

" {{{ fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gpl :Gpull<CR>
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
el
    " TODO: not sure why it doesnt work when I put it in Option section, somethings
    " need to load first!
    " Hack Disable tilder column "~" by change its color
    hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
en
" }}}

" vimspector{{{
let g:vimspector_enable_mappings = 'HUMAN'
func! CustomiseUI()
    call win_gotoid( g:vimspector_session_windows.code )
    nunmenu WinBar
    "nnoremenu WinBar.Kill :call vimspector#Stop()<CR>
    "nnoremenu WinBar.Continue :call vimspector#Continue()<CR>
    "nnoremenu WinBar.Pause :call vimspector#Pause()<CR>
    "nnoremenu WinBar.Step\ Over  :call vimspector#StepOver()<CR>
    "nnoremenu WinBar.Step\ In :call vimspector#StepInto()<CR>
    "nnoremenu WinBar.Step\ Out :call vimspector#StepOut()<CR>
    "nnoremenu WinBar.Restart :call vimspector#Restart()<CR>
    "nnoremenu WinBar.Exit :call vimspector#Reset()<CR>
endfunction

augroup MyVimspectorUICustomistaion
    autocmd!
    autocmd User VimspectorUICreated call CustomiseUI()
augroup END

let g:ycm_semantic_triggers =  {'VimspectorPrompt': [ '.', '->', ':', '<' ]}

nn <leader>vl :call vimspector#Launch()<cr>
nn <leader>ve :call vimspector#Reset()<cr>
nm <leader>vc   <Plug>VimspectorContinue
nm <leader>vs   <Plug>VimspectorStop
nm <leader>vt   <Plug>VimspectorRestart
nm <leader>vp   <Plug>VimspectorPause
nm <leader>vb   <Plug>VimspectorToggleBreakpoint
nm <leader>vbc  <Plug>VimspectorToggleConditionalBreakpoint
nm <leader>vbf  <Plug>VimspectorAddFunctionBreakpoint
nm <leader>vbr  <Plug>VimspectorRunToCursor
nm <leader>vn   <Plug>VimspectorStepOver
nm <leader>vs   <Plug>VimspectorStepInto
nm <leader>vo   <Plug>VimspectorStepOut
" }}}

" Ycm {{{
nmap <leader>jd :YcmCompleter GoTo<CR>
" }}}

" easymotion {{{
map <Leader>s <Plug>(easymotion-bd-f)
" }}}

" supertab {{{
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
" }}}

" {{{ teaks split window border
hi VertSplit ctermbg=NONE guibg=NONE
hi ErrorMsg term=NONE cterm=NONE  ctermbg=NONE ctermfg=12
hi Error cterm=NONE  ctermbg=NONE ctermfg=7 ctermbg=9

"se foldcolumn=1
" }}}

" python3/dyn {{{
"
"$ ls /usr/local/Cellar/python@3.8/3.8.6/Frameworks/Python.framework/Versions/3.8
"Headers   Python    Resources bin       include   lib       share
"
se pythonthreehome=/usr/local/Cellar/python@3.8/3.8.6/Frameworks/Python.framework/Versions/3.8
se pythonthreedll=/usr/local/Cellar/python@3.8/3.8.6/Frameworks/Python.framework/Versions/3.8/lib/python3.8/config-3.8-darwin/libpython3.8.dylib
" }}}

" {{{ foldtext
fu! _foldtext()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    retu foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endf
set foldtext=_foldtext()
hi Folded term=bold,underline cterm=bold ctermfg=12 ctermbg=0 guifg=Cyan guibg=DarkGrey
" }}}

" windows {{{
nn <C-w>\| <C-w>v
nn <C-w>" <C-w>s
" windows stuffs
se equalalways
"se eadirection

" windows moving
nn <C-J> <C-W><C-J>
nn <C-K> <C-W><C-K>
nn <C-L> <C-W><C-L>
nn <C-H> <C-W><C-H>

" window resize
"C-w _ : Max out the height of the current split
"C-w | : Max out the width of the current split
"C-w =  Normalize all split sizes, which is very handy when resizing terminal
"C-w - : reduce horizontal size
"C-w + : increase horizontal size
"C-w > : increate vertical size
"C-w < : increate vertical size

" }}}

" Use man page inside vim {{{
ru! ftplugin/man.vim
" C-] to following link
" C-t to go back
" }}}
