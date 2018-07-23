"   _  /   _  ._   _
"  /_///_//_/// /_\ 
" /       _/

" ---------- my own --------- {{{
autocmd BufNewFile,BufRead *GTD.txt call GenerateTaskDone()

:function! GenerateTaskDone()
    :function! TaskDone() " {{{
        :let done_task_str = getline(".")
        :let done_task_str = done_task_str[match(done_task_str, "- ") : -1]
        :let now_day = "; " . strftime("%Y/%m/%d", localtime())
        :call append(line("$"), done_task_str . now_day)
        :normal dd
    :endfunction
    " }}}
    :function! GoToInbox() " {{{
        :call search('^<a id="1_inbox"></a>')
        :normal 2jzz
    :endfunction
    " }}}
    :function! GoToJustDoIt() " {{{
        :call search('^<a id="2_just_do_it"></a>')
        :normal 2jzz
    :endfunction
    " }}}
    :function! GoToNextActions() " {{{
        :call search('^<a id="3_next_actions"></a>')
        :normal 2jzz
    :endfunction
    " }}}
    :function! GoToProjects() " {{{
        :call search('^<a id="4_projects"></a>')
        :normal 2jzz
    :endfunction
    " }}}
    :function! GoToWaitingFor() " {{{
        :call search('^<a id="5_waiting_for"></a>')
        :normal 2jzz
    :endfunction
    " }}}
    :function! GoToCalendar() " {{{
        :call search('^<a id="6_calendar"></a>')
        :normal 2jzz
    :endfunction
    " }}}
    :function! GoToNotes() " {{{
        :call search('^<a id="7_notes"></a>')
        :normal 2jzz
    :endfunction
    " }}}
    :function! GoToDone() " {{{
        :call search('^<a id="8_done"></a>')
        :normal 2jzz
    :endfunction
    " }}}
    " key mapping " {{{
    :nnoremap <leader>td :call TaskDone()<CR>
    :nnoremap <leader>ti :call GoToInbox()<CR>
    :nnoremap <leader>tj :call GoToJustDoIt()<CR>
    :nnoremap <leader>ta :call GoToNextActions()<CR>
    :nnoremap <leader>tp :call GoToProjects()<CR>
    :nnoremap <leader>tw :call GoToWaitingFor()<CR>
    :nnoremap <leader>tc :call GoToCalendar()<CR>
    :nnoremap <leader>tn :call GoToNotes()<CR>
    :nnoremap <leader>tD :call GoToDone()<CR>
    " }}}
:endfunction
" }}}

" --------- folding setting ---------- {{{
if expand('<sfile>:p')!=#expand('%:p') && exists('g:loaded_foldCC')| finish| endif| let g:loaded_foldCC = 1
let s:save_cpo = &cpo| set cpo&vim
scriptencoding utf-8
"=============================================================================
let g:foldCCtext_maxchars = get(g:, 'foldCCtext_maxchars', 78)
let g:foldCCtext_head = get(g:, 'foldCCtext_head', 'v:folddashes. " "')
let g:foldCCtext_tail = get(g:, 'foldCCtext_tail', 'v:foldend - v:foldstart+1')
let g:foldCCtext_enable_autofdc_adjuster = get(g:, 'foldCCtext_enable_autofdc_adjuster', 0)
let g:foldCCnavi_maxchars = get(g:, 'foldCCnavi_maxchars', 60)


"=============================================================================
"Main:
function! FoldCCtext() "{{{
  if g:foldCCtext_enable_autofdc_adjuster && v:foldlevel > &fdc-1
    let &fdc = v:foldlevel + 1
  endif
  let headline = getline(v:foldstart)
  let head = g:foldCCtext_head=='' ? '' : eval(g:foldCCtext_head)
  let tail = g:foldCCtext_tail=='' ? '' : ' '. eval(g:foldCCtext_tail)
  let headline = s:_adjust_headline(headline, strlen(head)+strlen(tail))
  return substitute(headline, '^\s*\ze', '\0'. head, ''). tail
endfunction
"}}}

function! FoldCCnavi() "{{{
  let foldheads = FoldCCnavi_get_headlines()
  if empty(foldheads)
    return ''
  endif
  return join(foldheads, ' > ')
endfunction
"}}}
function! FoldCCnavi_get_headlines() "{{{
  if !foldlevel('.')
    return []
  endif
  let save_view = winsaveview()
  let gatherer = s:newFoldGatherer()
  try
    call gatherer.gather_headlines()
    return gatherer.get_headlines()
  finally
    call winrestview(save_view)
  endtry
endfunction
"}}}


"=============================================================================
"Misc:
function! s:_remove_commentstring_and_foldmarkers(str) "{{{
  let cms = matchlist(&cms, '\(.\{-}\)%s\(.\{-}\)')
  let [cmsbgn, cmsend] = cms==[] ? ['', ''] : [substitute(cms[1], '\s', '', 'g'), cms[2]]
  let foldmarkers = split(&foldmarker, ',')
  return substitute(a:str, '\%('.cmsbgn.'\)\?\s*'.foldmarkers[0].'\%(\d\+\)\?\s*\%('.cmsend.'\)\?', '','')
endfunction "}}}
function! s:_get_colwidth() "{{{
  return winwidth(0) - &foldcolumn - (!&number ? 0 : max([&numberwidth, len(line('$'))])) - 1
endfunction
"}}}
function! s:_remove_multibyte_garbage(str) "{{{
  return substitute(substitute(strtrans(a:str), '^\%(<\x\x>\)\+\|\%(<\x\x>\)\+$', '', 'g'), '\^I', "\t", 'g')
endfunction
"}}}
function! s:_adjust_headline(headline, reducelen) "{{{
  let headline = s:_remove_commentstring_and_foldmarkers(a:headline)
  let colwidth = s:_get_colwidth()
  let truncatelen = (colwidth < g:foldCCtext_maxchars ? colwidth : g:foldCCtext_maxchars) - a:reducelen
  let dispwidth = strdisplaywidth(headline)
  if dispwidth < truncatelen
    let multibyte_widthgap = strlen(headline) - dispwidth
    let headlinewidth = truncatelen + multibyte_widthgap
    return printf('%-*s', headlinewidth, headline)
  end
  let ret = ''
  let len = 0
  for char in split(headline, '\zs')
    let len += strdisplaywidth(char)
    if len > truncatelen
      break
    end
    let ret .= char
  endfor
  return strdisplaywidth(ret)==truncatelen ? ret : ret.' '
endfunction
"}}}

let s:FoldGatherer = {}
function! s:newFoldGatherer() "{{{
  let obj = copy(s:FoldGatherer)
  let obj.headlines = []
  return obj
endfunction
"}}}
function! s:FoldGatherer._register_headline(headline) "{{{
  let headline = s:_remove_commentstring_and_foldmarkers(a:headline)
  let headline = substitute(substitute(headline, '^\s*\|\s$', '', 'g'), '\s\+', ' ', 'g')
  let multibyte_widthgap = len(headline) - strdisplaywidth(headline)
  let truncatelen = g:foldCCnavi_maxchars + multibyte_widthgap
  let headline = s:_remove_multibyte_garbage(headline[:truncatelen])
  call insert(self.headlines, headline)
endfunction
"}}}
function! s:FoldGatherer._gather_outer_headlines() "{{{
  if mode() =~ '[sS]' "FIXME:selectmodeでnormal!コマンドを使うとE523が出る問題の暫定的解消
    return
  endif
  let row = 0
  try
    while 1
      keepj normal! [z
      if row == line('.') "FIXME:同一行にFoldingMarkerが重なってると無限ループになる問題の暫定的解消
        break
      endif
      call self._register_headline(getline('.'))
      if foldlevel('.') == 1
        break
      endif
      let row = line('.')
    endwhile
  catch
    ec 'foldCCnavi: 何かしらのエラーが起こりました g:foldCC_err参照'
    let g:foldCC_err = v:exception
  endtry
endfunction
"}}}
function! s:FoldGatherer.gather_headlines() "{{{
  let closed_row = foldclosed('.')
  if closed_row == -1
    call self._gather_outer_headlines()
    return
  endif
  call self._register_headline(getline(closed_row))
  if foldlevel('.') == 1
    return
  endif
  "閉じた折り畳みの中の、途中の行にいた場合
  keepj normal! [z
  if foldclosed('.') == closed_row
    return
  endif
  call self._gather_outer_headlines()
  return
endfunction
"}}}
function! s:FoldGatherer.get_headlines() "{{{
  return self.headlines
endfunction
"}}}

"=============================================================================
let &cpo = s:save_cpo| unlet s:save_cpo
set foldtext=FoldCCtext()
" }}}

" --------------- Unite --------------- {{{
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
" }}}

" --------------- neocomplete --------------- {{{
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
" }}}

" inoremap <expr><C-x>s neocomplete#start_manual_complete('look')

" vim: set foldmethod=marker :
