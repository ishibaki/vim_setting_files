" ウィンドウの縦幅
" ウィンドウの横幅

if system('uname') == "Darwin\n" " Mac setting
    set guifont=Cica:h24
    set lines=20 " window height
    set columns=83 " window width
elseif has('win64') || has('win32') " Windows setting
    set guifont=Ricty\ Diminished\ Discord:h24
    set transparency=15
elseif system('uname') == "Linux\n" " Linux setting
    set guifont=Ricty\ Diminished\ Discord\ 18
    " set lines=23 " window height
    " set columns=90 " window width
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

" " Read toggle {{{
" augroup readModeCheck
"     autocmd!
"     autocmd BufNewFile,BufRead *.{R} set readonly
"     autocmd BufNewFile,BufRead *.{R} call ChangeReadMode()
"     autocmd BufNewFile,BufRead *.{mk,mdown,mkdn,markdown,py,python,py3,python3,c,h} let g:is_read_mode=0
" augroup END
" 
" :function! ChangeReadMode()
"     :set readonly
"     :set guifont=Cica:h16
"     :let g:is_read_mode = 1
" :endfunction
" 
" :function! ChangeWriteMode()
"     :set noreadonly
"     :set guifont=Cica:h24
"     :let g:is_read_mode = 0
" :endfunction
" 
" :function! ToggleReadWriteMode()
"     :if g:is_read_mode
"         :call ChangeWriteMode()
"     :else
"         :call ChangeReadMode()
"     :endif
" :endfunction
" 
" nnoremap g<C-R> :call ToggleReadWriteMode()<CR>
" "}}}
