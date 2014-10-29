se guioptions=-m
se guioptions=+b
se guioptions+=r
se guioptions+=i


if has("gui_gtk2")
    se gfn=Courier\ New\ 10
elsei has("gui_photon")
    se gfn=Courier\ New:s11
elsei has("gui_kde")
    se gfn=Courier\ New/11/-1/5/50/0/0/0/1/0
elsei has("x11")
    se guifont=-misc-fixed-medium-r-normal--15-140-75-75-c-90-iso10646-1
el
    se gfn=Courier_New:h11:cDEFAULT
en

"se background=light
"colors peaksea
"hi CursorLine cterm=NONE ctermbg=153  guibg=#ACCEFC gui=NONE
"hi Normal cterm=NONE ctermbg=white	guifg=#000000	guibg=#FFFFFF  gui=NONE
"hi Search guifg=NONE guibg=#a6caf0 gui=NONE

se background=dark
colo peaksea
"hi CursorLine cterm=NONE ctermbg=237  guibg=#404040 gui=NONE
"hi CursorColumn cterm=NONE ctermbg=237  guibg=#404040 gui=NONE
hi StatusLine cterm=NONE ctermbg=237 ctermfg=226  guibg=#404040 guifg=#ffff00
"hi SignColumn cterm=NONE ctermbg=237  guibg=#404040 gui=NONE
"1}}}---------------------------------------------------------------------------
