"   _  /   _  ._   _
"  /_///_//_/// /_\ 
" /       _/

" ---------- my own ---------
autocmd BufNewFile,BufRead GTD.txt call GenerateTaskDone()
autocmd BufNewFile,BufRead GTD.txt nnoremap <leader>td :call TaskDone()<CR>
autocmd BufNewFile,BufRead GTD.txt nnoremap <leader>ti :call GoToInbox()<CR>
autocmd BufNewFile,BufRead GTD.txt nnoremap <leader>tj :call GoToJustDoIt()<CR>
autocmd BufNewFile,BufRead GTD.txt nnoremap <leader>ta :call GoToNextActions()<CR>
autocmd BufNewFile,BufRead GTD.txt nnoremap <leader>tp :call GoToProjects()<CR>
autocmd BufNewFile,BufRead GTD.txt nnoremap <leader>tw :call GoToWaitingFor()<CR>
autocmd BufNewFile,BufRead GTD.txt nnoremap <leader>tc :call GoToCalendar()<CR>
autocmd BufNewFile,BufRead GTD.txt nnoremap <leader>tn :call GoToNotes()<CR>
autocmd BufNewFile,BufRead GTD.txt nnoremap <leader>tD :call GoToDone()<CR>

:function! GenerateTaskDone()
    :function! TaskDone()
        :let done_task_str = getline(".")
        :let done_task_str = done_task_str[match(done_task_str, "- ") : -1]
        :let now_day = "; " . strftime("%Y/%m/%d", localtime())
        :call append(line("$"), done_task_str . now_day)
        :normal dd
    :endfunction

    :function! GoToInbox()
        :call search('^<a id="1_inbox"></a>')
        :normal 2jzz
    :endfunction

    :function! GoToJustDoIt()
        :call search('^<a id="2_just_do_it"></a>')
        :normal 2jzz
    :endfunction

    :function! GoToNextActions()
        :call search('^<a id="3_next_actions"></a>')
        :normal 2jzz
    :endfunction

    :function! GoToProjects()
        :call search('^<a id="4_projects"></a>')
        :normal 2jzz
    :endfunction

    :function! GoToWaitingFor()
        :call search('^<a id="5_waiting_for"></a>')
        :normal 2jzz
    :endfunction

    :function! GoToCalendar()
        :call search('^<a id="6_calendar"></a>')
        :normal 2jzz
    :endfunction

    :function! GoToNotes()
        :call search('^<a id="7_notes"></a>')
        :normal 2jzz
    :endfunction

    :function! GoToDone()
        :call search('^<a id="8_done"></a>')
        :normal 2jzz
    :endfunction

:endfunction

" " --------------- Unite ---------------
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
