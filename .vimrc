" -------------------Glbal Settings-------------------
"文字コードをUFT-8に設定
set fenc=utf-8

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

" 0が前置された数字を，8進数でなく10進数として扱う
" set nrformats="bin,hex"

" 行頭-左・行末-右のカーソル移動で前の行・後ろの行へ移動可能にする
set whichwrap=b,s,<,>,[,],h,l

" 拡張子に応じて，<C-e＞でスクリプトを実行できるようにする
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.mdown set filetype=markdown
autocmd BufNewFile,BufRead *.markdown set filetype=markdown

" スペルチェック辞書を設定
set spelllang=en,cjk
set spell


" w!!でsudo保存
cabbr w!! w !sudo tee > /dev/null %

" スペース+ドットでvimrcを開く
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
nnoremap <Space><Space>. :<C-u>tabedit $MYVIMRC<CR>

" -------------------移動に関する追加コマンド-------------------
" スペースキー+hで行頭へ
nnoremap <Space>h ^

" スペースキー+スペースキー+hで段落頭へ
nnoremap <Space><Space>h {

" スペースキー+lで行末へ
nnoremap <Space>l $

" スペースキー+スペースキー+lで段落末へ
nnoremap <Space><Space>l }

" -------------------終了/保存に関する追加コマンド-------------------
" スペースキー+qで終了
nnoremap <Space>q<CR> :q<CR>

" スペースキー+wで保存
nnoremap <Space>w<CR> :w<CR>

" スペースキー+wqで保存して終了
nnoremap <Space>wq<CR> :wq<CR>

" スペースキー+wqqで強制保存終了
" nnoremap <Space>wqq<CR> :wq!<CR>

" スペースキー+qqで強制終了
nnoremap <Space>qq<CR> :q!<CR>

" -------------------空行の挿入コマンド------------------
" スペースキー+oで空行を現在行の後に挿入
nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>

" スペースキー+Oで空行を現在行の前に挿入
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

" -------------------挿入モードでの移動をemacs風に-------------------
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
" inoremap <C-d> <C-o>x


" 挿入モードでjk入力によりノーマルモードへ戻る
inoremap jk <Esc>

" -------------------対応する括弧を入力してカッコ内に移動-------------------
" doorboy.vimを入れたのでいらない子になりました
" inoremap [ []<Left>
" inoremap ( ()<Left>
" inoremap { {}<Left>

" -------------------見た目系-------------------
" 行番号を表示
set number

" 現在の行を強調表示
set cursorline

" 現在の行を強調表示（縦）
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

  " 折り返し時に表示行単位での移動できるようにする
  "nnoremap j gj
  "nnoremap k gk

" 入力中のコマンドを見えるようにする
set showcmd

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
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" ----------------calendar.vim----------------
let g:calendar_google_calendar = 1
let g:calendar_first_day = 'monday'

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
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" *検索で次の単語に移動しないようにする
nnoremap * *N
nnoremap # #N

"-------------------ビジュアル選択範囲で検索を可能にする-------------------
"ビジュアルモードには適応されるが選択モードではノーマルモードでは適応されないようにキーをリマップ
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
"選択領域で検索
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" ---------常にvery magic------------------
nnoremap / /\v
cnoremap %s/ %s/\v
cnoremap :/ %s/\v
vnoremap / /\v

" -------------------dein.vimの設定-------------------
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

set background=dark
colorscheme hybrid
syntax on
" インデントガイドを常にON
let g:indent_guides_enable_on_vim_startup = 1

" ビジュアルモードで選択し，easy-align 呼んで整形．(e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" easy-align を呼んだ上で，移動したりテキストオブジェクトを指定して整形．(e.g. gaip)
nmap ga <Plug>(EasyAlign)

" easy-motionのLeaderを<Space>fにする
let g:EasyMotion_leader_key = '<Space>f'

" <Leader>をスペースキーダブルタップにする
let mapleader = "\<Space>\<Space>"

" jediとquickrunのcompeteをクリア
let g:jedi#rename_command = "<leader>R"

" " -------------------Unite関係-------------------
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

" ---------- doorboy.vim 関係 ----------
"  add Japanese surrounds
let g:doorboy_additional_quotations = {
    \ 'markdown': ['*'],
    \ }

" let g:doorboy_additional_brackets = {
"     \ '*': ['「」'],
"     \ }

" filetypeをpythonにする
command! Setpython set filetype=python
command! Setpy set filetype=python

" filetypeをmarkdownにする
command! Setmarkdown set filetype=markdown
command! Setmdown set filetype=markdown
command! Setmd set filetype=markdown

nnoremap <Space><Space>o :Unite outline<CR>
let g:memolist_path = "~/OneDrive\ -\ 大阪大学/memolist.vim"
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>
let g:memolist_memo_date = "%Y/%m/%d %H:%M"

map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)
