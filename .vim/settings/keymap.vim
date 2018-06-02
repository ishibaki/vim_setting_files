"   __  __  ______ __    _ ____    __  ____    _____
"  |  |/ / |   ___|\ \  //|    \  /  ||    \  |     |
"  |     \ |   ___| \ \// |     \/   ||     \ |    _|
"  |__|\__\|______| /__/  |__/\__/|__||__|\__\|___|

" スペース+ドットでvimrcを開く
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
nnoremap <Space><Space>. :<C-u>tabedit $MYVIMRC<CR>

" スペース+コンマでGTDを拓く
nnoremap <Space>, :tabedit ~/Dropbox/GTD/GTD.txt<CR>
nnoremap <Space><Space>, :tabedit ~/Dropbox/GTD/GTD.txt<CR>

" 挿入モードでjk入力によりノーマルモードへ戻る
inoremap jk <Esc>

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" -------------------移動に関する追加コマンド-------------------
" スペースキー+hで行頭へ
nnoremap <Space>h ^

" スペースキー+スペースキー+hで前段落頭へ
nnoremap <Space><Space>h 2{+

" スペースキー+lで行末へ
nnoremap <Space>l g_

" スペースキー+スペースキー+lで次段落頭へ
nnoremap <Space><Space>l }+

" 行移動をEnterで代用
nnoremap <CR> G

" *検索で次の単語に移動しないようにする
nnoremap * *N
nnoremap # #N

" -------------------- cut/pasteに関するコマンド --------------------
" cut/pasteしたら，自動で末尾に移動する
" vnoremap <silent>y y']
" vnoremap <silent>p p']
" nnoremap <silent>p p']

" -------------------終了/保存に関する追加コマンド-------------------
" スペースキー+qで終了
nnoremap <Space>q<CR> :q<CR>

" スペースキー+wで保存
nnoremap <Space>w<CR> :w<CR>

" スペースキー+wqで保存して終了
nnoremap <Space>wq<CR> :wq<CR>

" スペースキー+wqaで全bufferを保存して終了
nnoremap <Space>wqa<CR> :wqa<CR>

" スペースキー+wqqで強制保存終了
" nnoremap <Space>wqq<CR> :wq!<CR>

" スペースキー+qqで強制終了
nnoremap <Space>qq<CR> :q!<CR>

" スペースキー+qaで全bufferを終了
nnoremap <Space>qa<CR> :qa<CR>

" スペースキー+qqaで強制終了
nnoremap <Space>qqa<CR> :qa!<CR>

" -------------------空行の挿入コマンド------------------
" スペースキー+oで空行を現在行の後に挿入
nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>

" スペースキー+Oで空行を現在行の前に挿入
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

" ----------<Space>*によるその他のキーバインド----------
" \nを含まない1行選択
noremap <Space>v 0v$h
" \nを含まない1行削除
noremap <Space>d 0v$hx
" \nを含まない1行コピー
noremap <Space>y 0v$hy
" 1行コメントアウト (# 形式)
map <Space>co <S-i># <Esc>
" 1行アンコメント (# 形式)
map <Space>uc ^xx<Esc>
" "0レジスタ(削除と関係のない，明示的ヤンクをしたレジスタ)をペースト
map <Space>p "0p

" -------------------挿入モードでの移動をemacs風に-------------------
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
" inoremap <C-f> <C-o>l
" inoremap <C-b> <C-o>h
" inoremap <C-j> <C-o>j
" inoremap <C-k> <C-o>k
" inoremap <C-d> <C-o>x

" ---------常にvery magic------------------
nnoremap / /\v
cnoremap %s/ %s/\v
cnoremap :/ %s/\v
vnoremap / /\v

" ----------行の連結後にスペースをいれない----------
" nnoremap J gJ
" nnoremap gJ J

" --------------- :terminal settings ---------------
" nnoremap :ter<CR> :vertical rightbelow terminal<CR>
" nnoremap :terminal<CR> :vertical rightbelow terminal<CR>
nnoremap <Space>t<Space>t<CR> :vertical rightbelow terminal<CR>

" macro editing
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" --------------- bufferの切り替え ---------------
nnoremap <silent>[b :bprev<CR>
nnoremap <silent>]b :bnext<CR>
