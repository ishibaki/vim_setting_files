" ウィンドウの縦幅
" ウィンドウの横幅

if system('uname') == "Darwin\n" " Mac setting
    set guifont=Ricty\ Diminished\ Discord:h28
    set lines=23 " window height
    set columns=90 " window width
elseif has('win64') || has('win32') " Windows setting
    set guifont=Ricty\ Diminished\ Discord:h28
    set transparency=15
elseif system('uname') == "Linux\n" " Linux setting
    set guifont=Ricty\ Diminished\ Discord\ 18
endif

" set linespace=2.5
set background=dark
colorscheme iceberg
syntax on

if has('kaoriya')
    set transparency=15
endif

" gVimでのみ効くタブ移動
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
