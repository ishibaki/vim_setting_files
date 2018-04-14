" " --------------- Unite ---------------
" " Leaderキー
" nnoremap    [unite]   <Nop>
" nmap    <Space>u [unite]
" 
" " unite.vim keymap
" let g:unite_source_history_yank_enable =1
" nnoremap <silent> [unite]u :<C-u>Unite<Space>file<CR>
" nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
" nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
" nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
" nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
" nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
" nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files
" file<CR>
" nnoremap <silent> ,vr :UniteResume<CR>
" " vinarise
" let g:vinarise_enable_auto_detect = 1 
" " unite-build map
" nnoremap <silent> ,vb :Unite build<CR>
" nnoremap <silent> ,vcb :Unite build:!<CR>
" nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
" 
" let g:unite_source_grep_command = 'ag'
" let g:unite_source_grep_default_opts = '--nocolor --nogroup'
" let g:unite_source_grep_max_candidates = 200
" let g:unite_source_grep_recursive_opt = ''
" " unite-grepの便利キーマップ
" vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

" set runtimepath+=c:/tools/vim/vim74/bundle/neocomplete.vim
" set runtimepath+=c:/tools/vim/vim74/bundle/neco-look

" --------------- neocomplete ---------------
let g:neocomplete#enable_at_startup = 1

if !exists('g:neocomplete#text_mode_filetypes')
        let g:neocomplete#text_mode_filetypes = {}
    endif
    let g:neocomplete#text_mode_filetypes = {
                \ 'nothing': 1,
                \ 'rst': 1,
                \ 'markdown': 1,
                \ 'gitrebase': 1,
                \ 'gitcommit': 1,
                \ 'vcs-commit': 1,
                \ 'hybrid': 1,
                \ 'text': 1,
                \ 'shd': 0,
                \ 'help': 1,
                \ 'changelog': 0,
                \ 'php': '',
                \ 'vim': 1,
                \ 'tex': 1,
                \ }

inoremap <expr><C-x>s neocomplete#start_manual_complete('look')

