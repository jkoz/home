" Notes {{{
" open all fold: zr, close all: zm
" set digraph
" help digraph-table
" search PLUS-MINUS
" c^k +-
" C-o to jump back previous location
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

" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"     silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" call plug#begin('~/.vim/plugged')

" Plug 'altercation/vim-colors-solarized'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-rsi'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-abolish'
" Plug 'masukomi/vim-markdown-folding'
" Plug 'gavinbeatty/dragvisuals.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
" Plug 'junegunn/vim-easy-align'
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'easymotion/vim-easymotion'
" Plug 'simeji/winresizer'
" Plug 'liuchengxu/vim-which-key'
" Plug 'airblade/vim-rooter'
" Plug 'liuchengxu/vista.vim'
" Plug 'puremourning/vimspector'
" Plug 'airblade/vim-gitgutter'
" Plug 'natebosch/vim-lsc'
" Plug 'Yggdroot/indentLine'
" Plug 'reedes/vim-pencil'
" Plug 'reedes/vim-litecorrect'
" Plug 'reedes/vim-lexical'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'godlygeek/tabular'
" Plug 'jceb/vim-orgmode'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
" Plug 'machakann/asyncomplete-ezfilter.vim'
"Plug 'chrisbra/unicode.vim'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'scrooloose/nerdtree'
" Plug 'lambdalisue/fern.vim'
" Plug 'ryanoasis/vim-devicons'
"Plug 'itchyny/lightline.vim'
"Plug 'tpope/vim-speeddating'
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

" call plug#end()
filetype plugin indent on
syntax on

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
nn <silent> q :q<cr>
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
se complete=.,b,u,]
se wildmode=longest,list:longest

" remove preview, as i don't want see my windows move because of scratch
se completeopt=menuone,menu,longest,noselect

" color
se background=dark
colo solarized

" changing cursor in insert mode and normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[4 q"

"}}}

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
"se stl=\ %f\  " Path to the file
"se stl+=%=        " Switch to the right side
"se stl+=[%l]        " Current line
"se stl+=/         " Separator
"se stl+=[%L]        " Total lines


function! StatuslineGit()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

se stl=
se stl+=%#PmenuSel# " enable highlight for git info
se stl+=%{StatuslineGit()} " show git info
se stl+=%#Visual# " use Visual highlight for remaining status line
se stl+=\ %f " show current file
se stl+=%m\  " do not know
se stl+=%=  " right align
"set stl+=%#CursorColumn#
"set stl+=\ %y " file type
"set stl+=\ %{&fileencoding?&fileencoding:&encoding}  "encoding
"set stl+=\[%{&fileformat}\] " file format
se stl+=\ %p%%  " percentage through file
se stl+=\ %l:%c\  " line number and  column

" }}}

" Auto Groups {{{
aug configgroup
    au!
    au BufRead,BufNewFile *.html,*.xhtml,*.xml setl foldmethod=indent foldlevel=0
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
let g:vista_ignore_kinds = ['Variable']
nn <silent> <leader>o :Vista finder<CR>
aug vistahidecwd
    autocmd!
    autocmd bufenter * if winnr("$") == 1 && vista#sidebar#IsOpen() | q | endif
aug end
" }}}

" Nerd Tree {{{
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
nn <Leader>nf :let @/=expand("%:t") <Bar> execute 'Ex' expand("%:h") <Bar> normal n<CR>
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
" }}}

" FZF {{{
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
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
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
fu LSCJavaStartDebug()
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
nn<silent> <buffer> <Leader>vlj :call LSCJavaStartDebug()<CR>

" }}}

" Utilsnip {{{
" let g:UltiSnipsExpandTrigger           = '<tab>'
" let g:UltiSnipsJumpForwardTrigger      = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
"}}}

" vim-vsnip {{{
" imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
imap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
smap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
imap <expr> <C-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-k>'
smap <expr> <C-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-k>'
" }}}

" supertab {{{
"let g:SuperTabCrMapping                = 0
"let g:SuperTabDefaultCompletionType    = '<C-n>'
"let g:SuperTabMappingForward='<c-j>'
"let g:SuperTabMappingBackward='<c-k>'
" c-h to delete character
" }}}

" asyncomplete {{{
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" autocmd User asyncomplete_setup cal asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
"             \ 'name': 'ultisnips',
"             \ 'allowlist': ['*'],
"             \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
"             \ }))
"call asyncomplete#register_source(asyncomplete#sources#nextword#get_source_options({
            "\   'name': 'nextword',
            "\   'allowlist': ['*'],
            "\   'args': ['-n', '10000'],
            "\   'completor': function('asyncomplete#sources#nextword#completor')
            "\   }))


" let g:asyncomplete_auto_completeopt = 1
" let g:asyncomplete_auto_popup = 1
" imap <expr> <C-Space> <Plug>(asyncomplete_force_refresh)

" }}}

" YCM {{{
"let g:ycm_semantic_triggers =  {'VimspectorPrompt': [ '.', '->', ':', '<' ]}
"let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
"let g:ycm_always_populate_location_list = 1

"nn <leader>jf :YcmCompleter GoToReferences<cr>
"nn <leader>ji :YcmCompleter GoToImplementation<cr>
"nn <leader>jd :YcmCompleter GoToDefinition<cr>
"nn <leader>js :YcmCompleter GoToSymbol *<cr> " load all symbol of the workspace
"nn <leader>jj :YcmDiags<cr>
"nn <leader>j] :lnext<cr>
"nn <leader>j[ :lprevious<cr>
"nn <leader>jr :YcmCompleter RefactorRename<cr>
"nn <leader>jc :YcmCompleter FixIt<cr>

"let g:ycm_enable_diagnostic_signs = 1
"let g:ycm_log_level = 'info'
"let g:ycm_autoclose_preview_window_after_completion = 1
"se completeopt-=preview
" }}}

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
" let g:asyncomplete_log_file = expand('~/.asyncomplete.log')
" let g:lsp_highlight_references_enabled = 1
" hi lspReference cterm=underline ctermfg=33 ctermbg=0
" }}}

" vim-lsc {{{
" vim: sudo npm install -g vim-language-server
" java: eclipse-jdt-ls use java >= 11
" javascript:  sudo npm install -g javascript-typescript-langserver
let g:lsc_server_commands = {
 \ 'c': {
 \    'command': 'clangd'
 \  },
 \  'vim': {
 \    'command': 'vim-language-server --stdio'
 \  },
 \  'javascript': {
 \    'command': 'javascript-typescript-stdio'
 \  },
 \  'java': {
 \    'command': 'java -Declipse.application=org.eclipse.jdt.ls.core.id1
 \                     -Dosgi.bundles.defaultStartLevel=4
 \                     -Declipse.product=org.eclipse.jdt.ls.core.product
 \                     -Dlog.protocol=true -Dlog.level=INFO -Xmx1G
 \                     -jar /home/tait/lsp/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.100.v20201223-0822.jar
 \                     -configuration /home/tait/lsp/jdt-language-server/config_linux
 \                     -data /home/tait/lsp/jdt-language-server/workspace',
 \    'message_hooks': {
 \        'initialize': {
 \            'initializationOptions': {
 \                 'bundles': [ '/home/tait/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.32.0/com.microsoft.java.debug.plugin-0.32.0.jar' ]
 \             }
 \        }
 \    }
 \  }
 \}

let g:lsc_auto_map = v:true
nn <silent> gD :LSClientAllDiagnostics<CR>

" re-trigger with c-x c-u
let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:true
let g:lsc_reference_highlights = v:true
let g:lsc_trace_level          = 'off'
hi lscReference cterm=underline ctermfg=33 ctermbg=0
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
hi VertSplit ctermfg=3 ctermbg=NONE guibg=NONE
hi ErrorMsg term=NONE cterm=NONE  ctermbg=NONE ctermfg=12
hi Error cterm=bold ctermbg=NONE ctermfg=2 ctermbg=NONE
hi Comment cterm=italic

"se foldcolumn=1
" }}}

" python3/dyn {{{
"
"se pythonthreehome=/usr/local/Cellar/python@3.9/3.9.5/Frameworks/Python.framework/Versions/3.9
"se pythonthreedll=/usr/local/Cellar/python@3.9/3.9.5/Frameworks/Python.framework/Versions/3.9/lib/python3.9/config-3.9-darwin/libpython3.9.dylib
"
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

" fzf hack for quick fix {{{
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
nn <leader>fq :FzfQF<cr>
"}}}

" vim-which-key {{{
autocmd FileType which_key highlight WhichKeyFloating ctermbg=0 ctermfg=12
nnoremap <silent> <leader> :WhichKey ','<CR>
" }}}

" Personalize highlighting {{{
hi SignColumn ctermfg=12 ctermbg=NONE
hi Search cterm=underline ctermbg=136 ctermfg=234
hi IncSearch cterm=underline ctermbg=164 ctermfg=234

"make popup menu looks nicer
hi Pmenu cterm=NONE ctermfg=12 ctermbg=0

" CursorColumn, CursorLine, and CursorLineNr
hi CursorLineNr cterm=bold,italic ctermbg=NONE ctermfg=64
hi CursorLine ctermbg=NONE
hi CursorColumn ctermbg=NONE
hi LineNr ctermbg=NONE

" heading title looks better with yellow
hi Title term=NONE cterm=bold ctermfg=136
hi htmlH1 cterm=NONE cterm=bold ctermfg=136
hi htmlH2 cterm=NONE cterm=NONE ctermfg=33
hi htmlH3 cterm=NONE cterm=italic ctermfg=2

" status line
hi StatusLine ctermbg=NONE cterm=NONE ctermfg=3
hi StatusLineNC ctermbg=NONE cterm=NONE ctermfg=11
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

"calendar {{{
" to be autoground

"autocmd FileType calendar
    "\ cal calendar#color#syntax('Sunday', has('gui') ? '#ff0000' : 136, 'NONE', 'NONE')
    "\ | cal calendar#color#syntax('Saturday', has('gui') ? '#ff0000' : 136, 'NONE', 'NONE')
    "\ | cal calendar#color#syntax('DayTitle', has('gui') ? '#ff0000' : 64, 'NONE', 'NONE')
    "\ | cal calendar#color#syntax('SundayTitle', has('gui') ? '#ff0000' : 136, 'NONE', 'NONE')
    "\ | cal calendar#color#syntax('SaturdayTitle', has('gui') ? '#ff0000' : 136, 'NONE', 'NONE')
    "\ | cal calendar#color#syntax('Today', has('gui') ? '#ff0000' : 33, '0', 'NONE')
    "\ | cal calendar#color#syntax('TodaySunday', has('gui') ? '#ff0000' : 33, 'NONE', 'NONE')
    "\ | cal calendar#color#syntax('TodaySaturday', has('gui') ? '#ff0000' : 33, 'NONE', 'NONE')
    "\ | cal calendar#color#syntax('Select', has('gui') ? '#ff0000' : 33, '0', 'NONE')
    "\ | cal calendar#color#syntax('OtherMonth', has('gui') ? '#ff0000' : 245, '0', 'NONE')
    "\ | cal calendar#color#syntax('OtherMonthSelect', has('gui') ? '#ff0000' : 245, '0', 'NONE')
    "\ | cal calendar#color#syntax('NormalSpace', has('gui') ? '#ff0000' : 255, '0', 'NONE')
    "\ | cal calendar#color#syntax('CommentSelect', has('gui') ? '#ff0000' : 232, '0', 'NONE')
    "\ | setl conceallevel=3

"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1
"}}}

" vim-markdown {{{
" disable of conceal regardless of conceallevel
"let g:vim_markdown_conceal = 0
let g:markdown_folding = 1
let g:markdown_enable_folding = 1
" }}}

" Goyo {{{
let g:goyo_width=100
" }}}

" Ale, deoplete {{{
" let g:ale_linters = {
"         \   'java': ['vim-lsc']
"     \ }
"let g:ale_completion_enabled=1

" turn this on to use deoplete
"let g:deoplete#enable_at_startup = 1

"nn <leader>jd :ALEGoToDefinition<cr>
"nn <leader>jf :ALEFindReferences<cr>
"nn <leader>js :ALESymbolSearch<cr>
"nn <leader>jr :ALERename<cr>
"nn <leader>jn :ALENext<cr>
"nn <leader>jp :ALEPrevious<cr>

"nn <leader>ji :LspImplementation<cr>
"nn <leader>ji :LspImplementation<cr>
"nn <leader>jh :LspTypeHierarchy<cr>
"nn <leader>jc :LspCodeAction<cr>

" }}}
