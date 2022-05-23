" Notes {{{
" open all fold: zr, close all: zm
" set digraph
" help digraph-table
" search PLUS-MINUS
" c^k +-
" C-o jump back previous location
" C-i jump back again location
" C-e: scroll up
" C-y: scroll down

" do: get changes from other window into the current window
" dp: put the changes from current window into the other window
" ]c: jump to the next change
" [c: jump to the previous change
" zo: open fold
" zc: close fold
" zr: reducing folding level
" zm: one more folding level, please
" zR: unfold everything

" urlview
" gx: open cursor url

" spell
"zg to add a word to the word list.
"zw to reverse.
"zug to remove a word from the word list.
"z= to get list of possible spellings.
" }}}

" Vimplug {{{

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

 call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'
Plug 'masukomi/vim-markdown-folding'
Plug 'gavinbeatty/dragvisuals.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode'
Plug 'easymotion/vim-easymotion'
Plug 'simeji/winresizer'
Plug 'liuchengxu/vim-which-key'
Plug 'airblade/vim-rooter'
Plug 'liuchengxu/vista.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-lexical'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'jceb/vim-orgmode'
Plug 'rhysd/git-messenger.vim'
Plug 'uiiaoo/java-syntax.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'chunkhang/vim-mbsync'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'puremourning/vimspector'
" Plug 'sheerun/vim-polyglot'
" Plug 'godlygeek/tabular'
" Plug 'machakann/asyncomplete-ezfilter.vim'
"Plug 'chrisbra/unicode.vim'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'scrooloose/nerdtree'
" Plug 'ryanoasis/vim-devicons'
" Plug 'itchyny/lightline.vim'
"Plug 'jaxbot/semantic-highlight.vim'
"Plug 'clarke/vim-renumber'
"Plug 'morhetz/gruvbox'
"Plug 'kana/vim-metarw'
"Plug 'mattn/webapi-vim'
"Plug 'mattn/vim-metarw-gdrive'
"Plug 'itchyny/calendar.vim'
"Plug 'Shougo/deoplete.nvim'
"Plug 'lighttiger2505/deoplete-vim-lsp'
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'dense-analysis/ale'
"Plug 'rhysd/vim-lsp-ale'
"Plug 'wellle/tmux-complete.vim' " as I use tmux-comp script with fzf
" go get -u github.com/high-moctane/nextword
"Plug 'high-moctane/asyncomplete-nextword.vim'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'mattn/ctrlp-lsp'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'majutsushi/tagbar'

call plug#end()
filetype plugin indent on
syntax on

" }}}

" tabline {{{
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    let tabnr = i + 1 " range() starts at 0
    let winnr = tabpagewinnr(tabnr)
    let buflist = tabpagebuflist(tabnr)
    let bufnr = buflist[winnr - 1]
    let bufname = fnamemodify(bufname(bufnr), ':t')

    let s .= '%' . tabnr . 'T'
    let s .= (tabnr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tabnr

    let n = tabpagewinnr(tabnr,'$')
    if n > 1 | let s .= ':' . n | endif

    let s .= empty(bufname) ? ' [No Name] ' : ' ' . bufname . ' '

    let bufmodified = getbufvar(bufnr, "&mod")
    if bufmodified | let s .= '+ ' | endif
  endfor
  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!MyTabLine()
set showtabline=2 " always show tabline
" }}}

" Mappings {{{
let mapleader = ","

" disable jk as escape because it cause slow down in virtual selection mode.
ino <leader><leader> <esc>
vn <leader><leader> <esc>

" change : to ;
nn ; :
nn : ;

" Toggle wrap
nn <Leader>W :setl nowrap! <CR>

" Case insensitive search use easy motion instead
nn / /\v
vn / /\v

" match bracket pairs with tab is a hell of a lot easier than %
" map <tab> %

" clear search match
nn <silent> <leader><space> :nohl<cr>

" Quick quit
" nn <silent> q :q<cr>
nn <silent> - :bp\|bd #<cr>

"com! BW :bp|:bd#
"nn <silent> - :BW<cr>


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

se nocompatible
se t_Co=256
se sw=4
se autowrite
se title
se list
se listchars=tab:\|\ ,extends:>,precedes:\ ,nbsp:~,trail:.
se signcolumn=no

se ttyfast
" se ttyscroll=3  "dont have this in neovim
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

se rnu
se nu" turn on number
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
se cpt=.,b,u,] " this specifies how key word complete works when using <c-p><c-n>
se wildmode=longest,list:longest
" set completepopup=height:10,width:60,highlight:Pmenu,border:on  "don't have this in neovim

" remove preview, as i don't want see my windows move because of scratch
" use popup to show preview info
" se completeopt=menuone,menu,longest,noselect,popup   "don't have this in neovim

" sameple popup menu
"     let s:popup_id = popup_atcursor(a:lines, {
"           \ 'padding': [0, 0, 0, 0],
"           \ 'border': [1, 1, 1, 1],
"           \ 'moved': 'any',
"           \ 'borderchars': ['─', '│', '─ ', '│', '╭', '╮', '╯', '╰'],
"           \ })

" color
se background=dark
colo solarized

" changing cursor in insert mode and normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[4 q"

"}}}

" tabs {{{
nn <silent> tt :tabedit %<CR>
nn <silent> [g :tabprevious<CR>
nn <silent> ]g :tabnext<CR>
nn <silent> [G :tabrewind<CR>
nn <silent> ]G :tablast<CR>
" }}}

" fillchars {{{
" open :UnicodeTable
" in insert mode <C-v> and type U00B7
se fcs=vert:│
se fcs+=fold:·
se fcs+=diff:\ "the leading space is used
"se fcs+=stl:┈
"se fcs+=stlnc:┈
" }}}

" Status line {{{
se ls=2

function! NearestMethodOrFunction() abort
    let l:func = get(b:, 'vista_nearest_method_or_function', '')
    if l:func != ''
        return ' > ' . get(b:, 'vista_nearest_method_or_function', '') . ' '
    endif
    return ''
endfunction

" status line
hi StatusLine ctermbg=none cterm=underline term=none ctermfg=250
hi StatusLineNC ctermbg=NONE cterm=underline term=NONE ctermfg=10
hi User1 ctermbg=8 ctermfg=2 cterm=bold,underline
hi User2 ctermfg=250 ctermbg=8 cterm=underline


se statusline=[%n]\ %<%.99f%{NearestMethodOrFunction()}\ %y%h%w%m%r%=%-14.(%l,%c%V%)\ %P\ %L\  " one line status line
" se stl=
" se stl+=%1*\ %{StatuslineGit()}\  "current mode
" se stl+=%2*\ %f " show current file
" se stl+=\ %{NearestMethodOrFunction()} " vista show curent function
" se stl+=%0*
" se stl+=%=  " right align
" se stl+=\ %l:%c\  " line number and  column
" se stl+=%2*\ \ \ \ \ \ %p%%  " percentage through file
" se stl+=\ %L  " percentage through file

" }}}

" Auto Groups {{{
aug configgroup
    au!
    au BufRead,BufNewFile *.html,*.xhtml,*.xml setl foldmethod=indent foldlevel=0 tabstop=2 shiftwidth=2
    au BufRead,BufNewFile *.vim setl shiftwidth=2 tabstop=2 foldmethod=marker foldlevel=0
    au BufNewFile,BufRead *.otl setl listchars=tab:\|\ ,extends:>,precedes:\ ,nbsp:~,trail:.
    au BufRead,BufNewFile *rc setl foldmethod=marker
    au BufRead,BufNewFile *.c,*.h,*.hh setl tabstop=4 softtabstop=4 expandtab foldmethod=manual foldlevel=0
    au BufRead,BufNewFile *.h,*.hpp,*.cc,*.cpp setl tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab foldmethod=manual foldlevel=0
    au BufRead,BufNewFile *.conf setl tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab foldmethod=marker foldlevel=0
aug END
"}}}

" Tag bar {{{
"let g:tagbar_autofocus = 1
"nn <silent> <leader>t :TagbarToggle<cr>

"let g:tagbar_type_markdown = {
    "\ 'ctagstype' : 'markdown',
    "\ 'kinds' : [
        "\ 'h:Heading_L1',
        "\ 'i:Heading_L2',
        "\ 'k:Heading_L3'
    "\ ]
"\ }

"let g:tagbar_type_tex = {
    "\ 'ctagstype' : 'latex',
    "\ 'kinds'     : [
        "\ 's:sections',
        "\ 'g:graphics:0:0',
        "\ 'l:labels',
        "\ 'r:refs:1:0',
        "\ 'p:pagerefs:1:0'
    "\ ]
"\ }

" }}}

" Vista {{{
nn <silent> <leader>l :Vista<cr>
let g:vista_executive_for = {
        \ 'cpp': 'vim_lsc',
        \ 'c': 'vim_lsc',
        \ 'python': 'vim_lsc',
        \ 'java': 'vim_lsc',
        \ 'vim': 'vim_lsc'
        \ }
" let g:vista_executive_for = {
"         \ 'cpp': 'vim_lsp',
"         \ 'c': 'vim_lsp',
"         \ 'python': 'vim_lsp',
"         \ 'java': 'vim_lsp',
"         \ 'vim': 'vim_lsp'
"         \ }
let g:vista_ignore_kinds = ['Variable']
nn <silent> <leader>o :Vista finder<CR>
aug vistahidecwd
    autocmd!
    autocmd bufenter * if winnr("$") == 1 && vista#sidebar#IsOpen() | q | endif
aug end
" }}}

" Nerd Tree, fern {{{
"nn <leader>no :NERDTreeToggle<CR>
"nn <leader>nf :NERDTreeFind<CR>

"on mac to display correct use nerd font
"brew tap homebrew/cask-fonts
"brew cask install font-hack-nerd-font
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
"let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks") " Store the bookmarks file
"let NERDTreeShowBookmarks=1 " Show the bookmarks table on startup
"let NERDTreeShowFiles=1 " Show hidden files, too
"let NERDTreeShowHidden=1
"let NERDTreeQuitOnOpen=2 " Quit on opening files from the tree
"let NERDTreeWinSize = 30
"let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree
"let NERDTreeMouseMode=2 " Use a single click to fold/unfold directories and a double click to open files
"let g:NERDTreeDirArrowExpandable = "\u00a0"
"let g:NERDTreeDirArrowCollapsible = "\u00a0"
"let g:NERDTreeStatusline = '%#NonText#'

"let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            "\ '\.o$', '\.so$', '\.egg$', '^\.git$', '\.svn$', '^target$', '^\.settings$', '^\.classpath$', '^\.project$', '^\.hg', '.pydevproject'  ]
" Disable arrow icons at the left side of folders for NERDTree.
" hide nerd tree first line
"aug nerdtreehidecwd
    "autocmd!
    "autocmd FileType nerdtree setl conceallevel=3 | syntax match NERDTreeHideCWD #^[</].*$# conceal
aug end

" automatically close nerd tree when it is the only one left
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" netrw
"let g:netrw_banner = 0 " enable bannle to learn command for now
"let g:netrw_altv = 1
"let g:netrw_liststyle = 0
"let g:netrw_browse_split = 4
"let g:netrw_winsize = 20
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END
" aug netrw_
"     autocmd!
"     autocmd filetype netrw call Fix_netrw_maps_for_dvorak()
" aug END
" fu! Fix_netrw_maps_for_dvorak()
"     noremap <buffer> - :bd
"     " and any others...
" endf

" use netrw
nn <Leader>nf :let @/=expand("%:t") <Bar> execute 'Ex' expand("%:h") <Bar> normal n<CR>
nn <Leader>nt :Fern . -reveal=% -drawer<CR>

" fern
" search for current file in directory: :Fern . -reveal=% -drawer
let g:fern#renderer = "nerdfont"
aug fernaug
    au!
    au FileType fern setl nonumber norelativenumber
aug end
" }}}

" FZF {{{
" indicate how fzf buffer is opened
" open in popup windows
"let g:fzf_layout = { 'down': '20%' }
" let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.3, 'yoffset': 1.0, 'border': 'horizontal'} }

" dont open fzf in some special buffer
"au BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif

function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
endfunction

let g:fzf_action = {
            \ 'ctrl-q': function('s:build_quickfix_list'),
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" On FZF popup
" - C-t to open file in a new tab
" - C-x to split
" - C-v to v split

" FZF go up directory upon doing :Files
fu! FzfExplore(...)
    let inpath = substitute(a:1, "'", '', 'g')
    if inpath == "" || matchend(inpath, '/') == strlen(inpath)
        execute "cd" getcwd() . '/' . inpath
        let cwpath = getcwd() . '/'
        call fzf#run(fzf#wrap(fzf#vim#with_preview({'source': 'ls -1ap', 'dir': cwpath, 'sink': 'FZFExplore', 'options': ['--prompt', cwpath]})))
    else
        let file = getcwd() . '/' . inpath
        execute "e" file
    endif
endfunction
command! -nargs=* FZFExplore call FzfExplore(shellescape(<q-args>))

function! s:format_qf_line(line)
  let parts = split(a:line, ':')
  return { 'filename': parts[0]
         \,'lnum': parts[1]
         \,'col': parts[2]
         \,'text': join(parts[3:], ':')
         \ }
endfunction

function! s:qf_to_fzf(key, line) abort
  let l:filepath = expand('#' . a:line.bufnr . ':p')
  return l:filepath . ':' . a:line.lnum . ':' . a:line.col . ':' . a:line.text
endfunction

function! s:fzf_to_qf(filtered_list) abort
  let list = map(a:filtered_list, 's:format_qf_line(v:val)')
  if len(list) > 0
    call setqflist(list)
    copen
  endif
endfunction

command! FzfQF call fzf#run(fzf#wrap({
      \ 'source': map(getqflist(), function('<sid>qf_to_fzf')),
      \ 'sink*':   function('<sid>fzf_to_qf'),
      \ 'options': '--reverse --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all --prompt "quickfix> "',
      \ }))

" search for core vim script: :FZF /usr/local/Cellar/vim
"
nn <silent> <leader>ff :FZF<CR>
nn <silent> <leader>p  :FZFExplore<CR>
nn <silent> <leader>z :Buffers<CR>
nn <silent> <leader>m :History<CR>
nn <silent> <leader>xx :Command<CR>
nn <silent> <leader>fo :BTags<CR>
nn <silent> <leader>fh :History:<cr>
nn <silent> <leader>f/ :History/<cr>
nn <silent> <leader>fl :BLines<CR>
nn <silent> <leader>fw :Windows<CR>
nn <silent> <leader>fg :GFiles<CR>
nn <silent> <leader>fc :Commits<CR>
nn <silent> <leader>ft :Helptags<CR>
nn <silent> <leader>fa :Ag<CR>
nn <silent> <leader>fr :Rg<CR>
nn <leader>fq :FzfQF<cr>
" }}}

" Drag visuals {{{

vm <expr> <c-h> DVB_Drag('left')
vm <expr> <c-l> DVB_Drag('right')
vm <expr> <c-j>  DVB_Drag('down')
vm <expr> <c-k>  DVB_Drag('up')
vm <expr> D DVB_Duplicate()
hi Visual cterm=NONE ctermbg=0 ctermfg=NONE term=NONE
" }}}

" Syntastic {{{
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
" }}}

" Pencil {{{
" soft mode use 1 line even if it is long line
let g:pencil#mode_indicators = {'hard': 'PH', 'soft': 'PS', 'off': ''}

aug pencil
    autocmd!
    autocmd FileType tex,latex
                \ setl spell spl=en_us fdo+=search nocursorcolumn
                \ |  cal pencil#init({'wrap': 'soft', 'textwidth': 80, 'conceallevel': 2})
                \ | cal litecorrect#init() | cal lexical#init()
    autocmd FileType markdown,mkd,md
                \ setl nowrap spell spl=en_us foldexpr=NestedMarkdownFolds() foldtext=_foldtext() fdo+=search
                \ | cal pencil#init({'wrap': 'soft', 'textwidth': 200, 'conceallevel': 2})
                \ | cal litecorrect#init() | cal lexical#init()
    autocmd Filetype git,gitsendemail,*commit*,*COMMIT*
                \ setl spell spl=en_us et sw=2 ts=2 noai
                \ | cal pencil#init({'wrap': 'soft', 'textwidth': 72})
                \ | cal litecorrect#init() | cal lexical#init()
    autocmd Filetype mail
                \ setl spell spl=en_us spf=~/.vim/spellfile.add et sw=2 ts=2 noai nonu nornu
                \ |  cal pencil#init({'wrap': 'soft', 'textwidth': 60})
                \ | cal litecorrect#init() | cal lexical#init()
aug END
" }}}

" Dispatch {{{
nn <leader>r :silent Dispatch!<CR>
" }}}

" {{{ fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gvdiffsplit<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gmv :Gmove<Space>
nnoremap <leader>gbb :Git branch<Space>
nnoremap <leader>gbl :Git blame<cr>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpl :Git pull<CR>
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
    " close all windows console windows
    call win_gotoid( g:vimspector_session_windows.output ) | q
    " dont use winbar
    call win_gotoid( g:vimspector_session_windows.watches )
    nunmenu WinBar
    call win_gotoid( g:vimspector_session_windows.code )
    nunmenu WinBar
endfunction

augroup MyVimspectorUICustomistaion
    autocmd!
    autocmd User VimspectorUICreated call CustomiseUI()
augroup END

" to see sign, uncomment below line
se signcolumn=number

nn <leader>vl :call vimspector#Launch()<cr>
nn <leader>vk :call vimspector#Reset()<cr>
nm <leader>vc   <Plug>VimspectorContinue
nm <leader>vs   <Plug>VimspectorStop
nm <leader>vr   <Plug>VimspectorRestart
nm <leader>vp   <Plug>VimspectorPause
nm <leader>vb   <Plug>VimspectorToggleBreakpoint
nm <leader>vbc  <Plug>VimspectorToggleConditionalBreakpoint
nm <leader>vbf  <Plug>VimspectorAddFunctionBreakpoint
nm <leader>vbr  <Plug>VimspectorRunToCursor
nm <leader>vn   <Plug>VimspectorStepOver
nm <leader>vs   <Plug>VimspectorStepInto
nm <leader>vo   <Plug>VimspectorStepOut


hi WarningMsg term=NONE cterm=NONE ctermfg=136 guifg=Red
hi MatchParen term=NONE cterm=NONE ctermfg=136 ctermbg=NONE

sign define vimspectorBP         text=o texthl=WarningMsg
sign define vimspectorBPCond     text=o? texthl=WarningMsg
sign define vimspectorBPDisabled text=o! texthl=LineNr
sign define vimspectorPC         text=\ > texthl=MatchParen linehl=CursorLine
sign define vimspectorPCBP       text=o>  texthl=MatchParen linehl=CursorLine

fu! EchoMessageCallback(data)
  echom a:data
  " vim-lsp return a map
  " cal vimspector#LaunchWithSettings( { 'DAPPort':
  "     \ has_key(a:data['response'], 'result') ? a:data['response']['result']  : 0 } )

  " vim-lsc return the integer of the port
  " cal vimspector#LaunchWithSettings({ 'DAPPort' : a:data })
endf

" sending executeCommand for request lsp server for debug port
fu JavaStartDebug()
    cal lsc#server#userCall('workspace/executeCommand', {'command': 'vscode.java.startDebugSession'}, function('EchoMessageCallback'))
endf

" vim-lsp
" fu JavaStartDebug()
"   cal lsp#send_request('eclipse-jdt-ls', {'method':
"       \ 'workspace/executeCommand', 'params': {'command':
"       \ 'vscode.java.startDebugSession'}, 'on_notification':
"       \ function('s:JavaStartDebugCallback')}
"       \)
" endf
nn<silent> <buffer> <Leader>vlj :call JavaStartDebug()<CR>

" }}}

" utilsnip {{{
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
"}}}

" vim-lsp {{{

" nn <leader>jd :LspDefinition<cr>
" nn <leader>jf :LspReferences<cr>
" nn <leader>ji :LspImplementation<cr>
" nn <leader>jn :LspNextError<cr>
" nn <leader>jp :LspPreviousError<cr>
" nn <leader>js :LspWorkspaceSymbol<cr>
" nn <leader>ji :LspImplementation<cr>
" nn <leader>jh :LspTypeHierarchy<cr>
" nn <leader>jr :LspRename<cr>
" nn <leader>jc :LspCodeAction<cr>
"set foldmethod=expr
  "\ foldexpr=lsp#ui#vim#folding#foldexpr()
  "\ foldtext=lsp#ui#vim#folding#foldtext()

" enable diagnostics for cursor
" let g:lsp_diagnostics_enable = 1
" let g:lsp_diagnostics_echo_cursor = 1

" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/.vim-lsp.log')
" let g:lsp_highlight_references_enabled = 1
" hi lspReference cterm=underline ctermfg=33 ctermbg=0
" }}}

" easymotion {{{
map <Leader>s <Plug>(easymotion-bd-f)
map <leader>e <Plug>(easymotion-prefix)
" }}}

" vim-easy-align {{{
" https://hackernoon.com/how-easily-align-your-code-in-vim-s16p3ysp
xmap <leader>d <Plug>(EasyAlign)
nmap <leader>d <Plug>(EasyAlign)
" }}}

" {{{ teaks split window border
hi VertSplit ctermfg=10 ctermbg=NONE guibg=NONE
hi ErrorMsg term=NONE cterm=NONE  ctermbg=NONE ctermfg=12
hi Comment cterm=italic

"se foldcolumn=1
" }}}

" {{{ foldtext
fu! _foldtext()
    " clean up first line
    let line = substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '

    let foldchar = matchstr(&fillchars, 'fold:\zs.')

    " shorten first line, and added fold char ahead of first line
    "let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)

    " simply use a portion of first line
    let foldtextstart = strpart(line, 0, (winwidth(0)*2)/3)

    let lines_count_text = printf("%10s", v:foldend - v:foldstart + 1 . ' lines') . ' '
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    retu foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endf
hi Folded cterm=italic ctermbg=NONE ctermfg=12 guifg=Cyan guibg=DarkGrey
hi FoldColumn ctermbg=NONE
set foldtext=_foldtext()
" }}}

" windows {{{
nn <C-w>\| <C-w>v
nn <C-w>" <C-w>s
" windows stuffs
se equalalways
"se eadirection

" windows moving
"nn <C-J> <C-W><C-J>
"nn <C-K> <C-W><C-K>
"nn <C-L> <C-W><C-L>
"nn <C-H> <C-W><C-H>
nn <C-H> 2zh
nn <C-L> 2zl
nn <C-J> <C-E>
nn <C-K> <C-Y>

nn <leader><leader>h <C-W>h
nn <leader><leader>j <C-W>j
nn <leader><leader>k <C-W>k
nn <leader><leader>l <C-W>l

" window resize
"C-w _ : Max out the height of the current split
"C-w | : Max out the width of the current split
"C-w =  Normalize all split sizes, which is very handy when resizing terminal
"C-w - : reduce horizontal size
"C-w + : increase horizontal size
"C-w > : increate vertical size
"C-w < : increate vertical size
let g:winresizer_start_key='<C-w>e'
" }}}

" Use man page inside vim {{{
ru! ftplugin/man.vim
" :se nolist | Man mbsync
" C-] to following link
" C-t to go back
" }}}

" vim-which-key {{{
autocmd FileType which_key highlight WhichKeyFloating ctermbg=0 ctermfg=12
nnoremap <silent> <leader> :WhichKey ','<CR>
" }}}

" Personalize highlighting {{{
hi SignColumn ctermfg=12 ctermbg=NONE
hi Search ctermbg=8 ctermfg=72 cterm=italic,underline,bold
hi IncSearch cterm=underline ctermbg=136 ctermfg=0

"make popup menu looks nicer
hi Pmenu cterm=NONE ctermfg=12 ctermbg=8
hi PmenuSel ctermfg=2 cterm=none ctermbg=0
hi PmenuThumb ctermfg=2 cterm=none ctermbg=12
hi PmenuSbar ctermfg=2 cterm=none ctermbg=0
hi TabLineSel ctermfg=2 cterm=underline,bold ctermbg=0

" CursorColumn, CursorLine, and CursorLineNr
hi CursorLineNr cterm=bold,italic ctermbg=NONE ctermfg=64
hi CursorLine ctermbg=0 cterm=none
hi CursorColumn ctermbg=NONE
hi LineNr ctermbg=NONE

" heading title looks better with yellow
hi Title term=NONE cterm=bold ctermfg=136
hi htmlH1 cterm=NONE cterm=NONE ctermfg=33
hi htmlH2 cterm=NONE cterm=NONE ctermfg=2
hi htmlH3 cterm=NONE cterm=NONE ctermfg=136


" spell error, warning, etc
hi Error cterm=italic,underline ctermfg=166 ctermbg=0
hi SpellBad cterm=italic,underline ctermfg=136
hi SpellCap cterm=none ctermfg=64

" function, identifier
hi Identifier ctermfg=14
hi Function ctermfg=251
" }}}

" semantic highlighting {{{
"nn<Leader>xs :SemanticHighlightToggle<cr>
"let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]
" }}}

" quick fix buffer {{{ use vim-unimpaired now
" nn <leader>] :cnext<cr>
" nn <leader>[ :cprev<cr>
" nn <leader>j] :lnext<cr>
" nn <leader>j[ :lprevious<cr>
" }}}

"devicons {{{

"let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
"let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
"let g:webdevicons_conceal_nerdtree_brackets = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:DevIconsEnableFoldersOpenClose = 1
"let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" }}}

" vim-markdown {{{
" disable of conceal regardless of conceallevel
"let g:vim_markdown_conceal = 0
let g:markdown_folding = 1
let g:markdown_enable_folding = 1
" }}}

" Goyo {{{
let g:goyo_width=100
" }}}

" lspconfig {{{

lua <<EOF
  require 'lspconfig'.pyright.setup{}
  require 'lspconfig'.vimls.setup{}
  require 'lspsaga'.init_lsp_saga {
    error_sign = '', -- 
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
  }

  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = false;

    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      spell = true;
      tags = true;
      snippets_nvim = true;
      treesitter = true;
    };
  }
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
      local col = vim.fn.col('.') - 1
      if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          return true
      else
          return false
      end
  end

  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
      return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn['compe#complete']()
    end
  end
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
      return t "<Plug>(vsnip-jump-prev)"
    else
      -- If <S-Tab> is not working in your terminal, change it to <C-h>
      return t "<S-Tab>"
    end
  end

  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

  require'vim.lsp.protocol'.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
EOF

" }}}
