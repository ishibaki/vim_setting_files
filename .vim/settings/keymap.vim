"   __  __  ______ __    _ ____    __  ____    _____
"  |  |/ / |   ___|\ \  //|    \  /  ||    \  |     |
"  |     \ |   ___| \ \// |     \/   ||     \ |    _|
"  |__|\__\|______| /__/  |__/\__/|__||__|\__\|___|

" スペース+ドットでvimrcを開く
nnoremap <silent> <Space>. :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <Leader>. :<C-u>tabedit $MYVIMRC<CR>

" スペース+コンマでGTDを拓く
nnoremap <silent> <Space>, :tabedit ~/Dropbox/GTD/GTD.txt<CR>gg
nnoremap <silent> <Leader>, :tabedit ~/Dropbox/GTD/GTD.txt<CR>gg

" 挿入モードでjk入力によりノーマルモードへ戻る
inoremap jk <Esc>

" ESC連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" <C-l>でハイライト解除と画面のredraw
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" -------------------移動に関する追加コマンド-------------------
" スペースキー+hで行頭へ
noremap <Space>h ^

" スペースキー+スペースキー+hで前段落頭へ
noremap <Space><Space>h 2{+

" スペースキー+lで行末へ
noremap <Space>l g_

" スペースキー+スペースキー+lで次段落頭へ
noremap <Space><Space>l }+

" 行移動をEnterで代用
nnoremap <CR> G

" -------------------- cut/pasteに関するコマンド --------------------
" cut/pasteしたら，自動で末尾に移動する
" vnoremap <silent>y y']
" vnoremap <silent>p p']
" nnoremap <silent>p p']

" DやCコマンドとの一貫性を保つために，Yで行末までヤンクにする
nnoremap Y y$

" PとgPの入れ替え
nnoremap P gP
nnoremap gP P

" -------------------- バッファ全体をモーション範囲に ---------------
omap <silent> ae :<C-u>normal ggVG<CR>
omap <silent> ie :<C-u>normal ggVG<CR>
xnoremap <silent> ie <Esc>ggVG
xnoremap <silent> ae <Esc>ggVG

" -------------------終了/保存に関する追加コマンド-------------------
" スペースキー+qで終了
nnoremap <Space>q<CR> :q<CR>

" スペースキー+wで保存
nnoremap <Space>w<CR> :w<CR>

" スペースキー+wwで強制保存
nnoremap <Space>ww<CR> :w!<CR>

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
noremap <Space>d 0v$hd
" \nを含まない1行コピー
noremap <Space>y 0v$hy
" "0レジスタ(削除と関係のない，明示的ヤンクをしたレジスタ)をペースト
noremap <Space>p "0p

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
vnoremap / /\v

" ----------行の連結後にスペースをいれない----------
" nnoremap J gJ
" nnoremap gJ J

" --------------- :terminal settings ---------------
" nnoremap :ter<CR> :vertical rightbelow terminal<CR>
" nnoremap :terminal<CR> :vertical rightbelow terminal<CR>
nnoremap <silent> <Space>t<Space>t<CR> :vertical rightbelow terminal<CR>

" macro editing
" ex) "q<Leader>m
nnoremap <silent> <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" --------------- bufferの切り替え ---------------
nnoremap <silent>[b :bprev<CR>
nnoremap <silent>]b :bnext<CR>

" -------- visual modeでindentしたときにnormal modeへ戻らない -------
" ドットによる繰り返しもできるが，個人的な直感ではこっちが好き
xnoremap > >gv
xnoremap < <gv

" ------- 全角コンマと全角ピリオドを句読点に変更する ------
nnoremap <silent> <Space>s,. :<C-u>%s/，/、/g<CR>:<C-u>%s/．/。/g<CR>
nnoremap <silent> <Space>S,. :<C-u>%s/、/，/g<CR>:<C-u>%s/。/．/g<CR>

" ------- タイムスタンプの挿入 ------
nnoremap <silent>ZTD O<C-r>=strftime("%Y-%m-%d")<CR><Esc>
nnoremap <silent>ZTd O<C-r>=strftime("%Y/%m/%d")<CR><Esc>
nnoremap <silent>ZTT O<C-r>=strftime("%T")<CR><Esc>
nnoremap <silent>ZTF O<C-r>=strftime("%Y-%m-%d %T")<CR><Esc>
nnoremap <silent>ZTf O<C-r>=strftime("%Y/%m/%d %T")<CR><Esc>

" ------ <C-f>で最後1行に行き過ぎるのをふせぐ -----
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')

" ------ 矩形選択以外でもIやAを使えるようにする -----
vnoremap <expr> I  <SID>force_blockwise_visual('I')
vnoremap <expr> A  <SID>force_blockwise_visual('A')

function! s:force_blockwise_visual(next_key)
  if mode() ==# 'v'
    return "\<C-v>" . a:next_key
  elseif mode() ==# 'V'
    return "\<C-v>0o$" . a:next_key
  else  " mode() ==# "\<C-v>"
    return a:next_key
  endif
endfunction
