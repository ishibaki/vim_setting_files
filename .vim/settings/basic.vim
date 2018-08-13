"   _               _
"  | |             (_)
"  | |__   __ _ ___ _  ___
"  | '_ \ / _` / __| |/ __|
"  | |_) | (_| \__ \ | (__
"  |_.__/ \__,_|___/_|\___|

"文字コードをUFT-8に設定
set fenc=utf-8

" 改行コードの設定
set fileformats=unix,mac,dos

" スペルチェック辞書を設定
set spelllang=en,cjk
set spell

" viminfoの場所を指定
set viminfo='2000,f1,<500,:1000,@500,/500,n$HOME/.vim/info/viminfo

" バックアップファイルを作らない
" set nobackup

" スワップファイルを作らない
" set noswapfile

" 編集中のファイルが変更されたら自動で読み直す
set autoread

" バッファが編集中でもその他のファイルを開けるように
set hidden

" 入力中のコマンドをステータスに表示する
set showcmd

" 暗号化(:X)のアルゴリズムをvimのバージョンに合わせて変更
if v:version > 704 || (v:version == 704 && has('patch399'))
  set cryptmethod=blowfish2
elseif v:version >= 703
  set cryptmethod=blowfish
else
  set cryptmethod=zip
endif

" 0が前置された数字を，8進数でなく10進数として扱う
" set nrformats="bin,hex"

" 行頭-左・行末-右のカーソル移動で前の行・後ろの行へ移動可能にする
set whichwrap=b,s,<,>,[,],h,l

" " 拡張子に応じて，<C-e＞でスクリプトを実行できるようにする
" autocmd BufNewFile,BufRead *.{py,python,py3,python3} nnoremap <C-e> :!python %
" autocmd BufNewFile,BufRead *.{rb,ruby} nnoremap <C-e> :!ruby %

" マークダウンの拡張子設定
autocmd BufNewFile,BufRead *.{md,mkd,mkdn,mdwn,mdown,markdown,txt} set filetype=markdown

" w!!でsudo保存
cabbr w!! w !sudo tee > /dev/null %

" 絶対行番号を表示
set number

" 相対行番号を表示
set relativenumber

" 現在の行を強調表示
set cursorline

" 現在の行を強調表示(縦)
set cursorcolumn

" 行末の1文字先までカーソルを移動できるように
" set virtualedit=onemore

" インデントはスマートインデント
set smartindent

" ビープ音を可視化
set visualbell

" 括弧入力時の対応する括弧を表示
set showmatch

" ステータスラインを常に表示
set laststatus=2

" コマンドラインの補完
set wildmode=list:longest

" 入力中のコマンドを見えるようにする
set showcmd

" コマンドモードの補完
set wildmenu

" ◯や■などの記号が崩れるのを防ぐ
set ambiwidth=double

" python設定
let g:python3_host_prog = expand('usr/local/bin/python3')

" -------------------CSVカラムのハイライト:Csvhl \d-------------------
function! CSVH(x)
    execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
    execute 'normal ^'.a:x.'f,'
endfunction
command! -nargs=1 Csvhl :call CSVH(<args>)

" -------------------Tab系-------------------
" 不可視文字を可視化(タブが▸-, 改行が↲, ノーブレークスペース
" が%として表示される)
set list
set listchars=tab:»-,eol:↲,nbsp:%

" Tab文字を半角スペースにする
set expandtab

" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4

" 行頭でのTab文字の表示幅
set shiftwidth=4

" 拡張子によってタブ文字の字下げ数を調節
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.{html,css,rb,R,q} setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.{py,python,py3,python3,md,mdown,mkdn,markdown,c,h} setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

" -------------------検索系-------------------
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch

"-------------------ビジュアル選択範囲で検索を可能にする-------------------
"ビジュアルモードには適応されるが選択モードではノーマルモードでは適応されないようにキーをリマップ
" xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
" xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
" "選択領域で検索
" function! s:VSetSearch()
"     let temp = @s
"     norm! gv"sy
"     let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
"     let @s = temp
" endfunction

" インデントガイドを常にON
let g:indent_guides_enable_on_vim_startup = 1

" <Leader>をスペースキーダブルタップにする
let mapleader = "\<Space>\<Space>"

" filetypeをpythonにする
command! Setpython set filetype=python
command! Setpy set filetype=python

" filetypeをmarkdownにする
command! Setmarkdown set filetype=markdown
command! Setmdown set filetype=markdown
command! Setmd set filetype=markdown

command! Datetime read !date '+\%Y/\%m/\%d \%H:\%M:\%S'

" ---------------- netrw settings ----------------
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" activeウィンドウだけでステータスラインを表示
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
