" スペース+ドットでvimrcを開く
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
nnoremap <Space><Space>. :<C-u>tabedit $MYVIMRC<CR>

" 挿入モードでjk入力によりノーマルモードへ戻る
inoremap jk <Esc>

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

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
