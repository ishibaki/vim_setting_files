# vim_setting_files

[Latest on github](https://github.com/ishibaki/vim_setting_files)

ビギナー向けのvim settings.

## チートシート

### 基本事項

- **<重要>** インサートモードで`jk`とするとノーマルモードへ戻る
- 保存，終了系のコマンドは`<Space>`始まり
  - `<Space>w<Enter>`で保存
  - `<Space>q<Enter>`で終了(未保存のファイルがある場合は警告が出て終了しない)
  - `<Space>qq<Enter>`で強制終了(未保存のファイルは保存されずに終了)
  - `<Space>wq<Enter>`で保存して終了(未保存のファイルがある場合は警告が出て終了しない)
  - `<Space>qqa<Enter>`ですべてのファイルを強制終了(危険なので，`:help :qa<Enter>`を読んで理解できてから使うこと)
- `<Space>.`でvim設定ファイル(`.vimrc`)へ移動
  - `.vimrc`内の冒頭にファイルパスが書かれているので，`gf`で各設定ファイルへジャンプできる
  - 戻りたいときは`Ctrl-o`で前いた場所に戻れるので，任意の場所に戻るまで連打する
  - `Ctrl-o`で戻りすぎたときは`Ctrl-i`で再度ジャンプできる
  - 折りたたみ設定がされている部分は，`zo`でその部分の折りたたみを開ける
    - ファイル中のすべての折りたたみを開きたい場合は，`zR`
    - もう一度閉じたいときは`zc`
    - ファイル中のすべての折りたたみを閉じたいときは，`zM`
- 検索した箇所がハイライト表示されるが，その場合は`Ctrl-l`でハイライトを消すことができる
  - `<Esc><Esc>`でも可能
  - `Ctrl-[Ctrl-[`でも可能
- **<重要>** 困ったら`:help<Enter>`でリファレンスを読もう

### プラグインの中でも初期から使いやすいもの

#### 移動関連

- `<Space>j`もしくは`<Space>k`で行移動モード(`vim-easymotion`プラグイン)
  - 行移動モードでハイライト表示されるキーを入力することで，その行に移動できる
- ノーマルモードもしくはインサートモードで`Ctrl-i`を入力すると，自由移動モード(`vim-easymotion`プラグイン)
  - 行移動モードと同じく，ハイライト表示されるキーを入力することで，任意の場所に移動できる

#### プログラム関連

- ファイル中に書いたプログラムを実行したいときの手順
  1. ファイルタイプの設定(`:set filetype=R<Enter>`)
    - Rの場合は，ノーマルモードで`:Setr<Enter>`と入力すればファイルタイプがRに変わる
    - pythonの場合は，ノーマルモードで`:Setpy<Enter>`と入力すればファイルタイプがRに変わる
  2. プログラムを書く
  3. ノーマルモードで`<Space><Space>r`と入力すれば，別タブが開き，実行結果が出力される
    - この時，ファイル全体が実行される
    - ヴィジュアルモードで範囲選択した状態で`<Space><Space>r`と入力すると，選択範囲のみ実行できる
  4. もし実行結果タブが邪魔なら，`Ctrl-wo`と入力すれば現在の編集タブ以外のタブを消せる
- マークダウンをHTMLレンダリングしたいときの手順
  1. ファイルタイプの設定(`:set filetype=markdown<Enter>`)
    - `:Setmd<Enter>`でもできる
  2. 文章を書く
  3. `<Space><Space>P`と入力すれば，ブラウザが開き，レンダリングされたマークダウンが閲覧できる

#### 入力補完関連

- 半角英数を入力していると，入力箇所下部に補完候補が表示される
  - `Ctrl-n`で補完候補の上から，`Ctrl-p`で補完候補の下から自動補完を選択できる
  - 論文書きのときにめちゃ便利

## 勉強になるウェブサイト

### 学習順序

- [Vimをはじめるときのポインタ](http://wakame.hatenablog.jp/entry/2017/12/15/004041)

### Vimの基本的な使い方

- [実践Vim](https://www.amazon.co.jp/実践Vim-思考のスピードで編集しよう-Drew-Neil/dp/4048916599)
- [Learn Vim Progressively](http://mattn.kaoriya.net/software/vim/20110902125512.htm)
- [スパルタン Vim 3.0](http://files.kaoriya.net/docs/SpartanVim/SpartanVim-3.0-online.pdf)
- [実践Vimを読んで学んだ、おすすめVimデフォルト機能36個](http://myenigma.hatenablog.com/entry/2015/12/19/081933)
- [内部専用Vim教本](file:///Volumes/share/personal/Ishibashi/vim/practical_vim.html) `reiwa`へアクセス出来る人専用

### コマンドの覚え方

- [Vimのコマンドの覚え方大全](http://haya14busa.com/vim-mnemonic/)
- [ニーモニックで覚えるVimコマンドチートシート](https://qiita.com/fiftystorm36/items/9da472686cb8e62e9e26)
- [Vimモーション譜](https://qiita.com/kumazo/items/9d334256694c6253944a)
- [Vim日本語チートシート作った](https://qiita.com/zipper/items/8fbed306e203b17be0c3)
- [vimcheatsheet.com](https://external-preview.redd.it/iigrixvxp5aYN9ox7Gr1dfI_rhLRotWlLsCafjJqjEQ.png?auto=webp&s=1594ddc17408cb9186a73c2a6d1a1bf1e00769dd) (Webサイトは消失してしまったが，Redditに残った画像がある)

## 設定方法

1. ホームディレクトリに，`dotfiles`ディレクトリを作る
2. `dotfiles`ディレクトリ内に`vim_setting_files`レポジトリをクローンする
3. ホームディレクトリにある`.vimrc`を削除
4. `ln -s ~/dotfiles/vim_setting_files/.vimrc ~/.vimrc`を実行
5. ホームディレクトリにある`.gvimrc`を削除
6. `ln -s ~/dotfiles/vim_setting_files/.gvimrc ~/.gvimrc`を実行
7. ホームディレクトリに`.vim`ディレクトリを作成
8. `ln -s ~/dotfiles/vim_setting_files/.vim ~/.vim`を実行

結果的に，ディレクトリ構成はこうなるはず

```
~/
├── .vimrc  @ -> ~/dotfiles/vim_setting_files/.vimrc ─────┐
├── .gvimrc @ -> ~/dotfiles/vim_setting_files/.gvimrc ─┐  │
├── .vim/   @ -> ~/dotfiles/vim_setting_files/.vim/ ┐  │  │
└── dotfiles/                                       │  │  │
    └── vim_setting_files/                          │  │  │
        ├── .git/                                   │  │  │
        ├── .vimrc <────────────────────────────────┼──┼──┘
        ├── .gvimrc <───────────────────────────────┼──┘
        └── .vim/ <─────────────────────────────────┘
            ├── rc/
            │   ├── dein.toml
            │   └── dein_lazy.toml
            │
            └── settings/
                ├── basic.vim
                ├── color.vim
                ├── keymap.vim
                └── plugins.vim
```

### 読み込まれ方について解説

1. vimの起動時に`~/.vimrc`がシンボリックリンクを経由して読み込まれる
2. `~/.vimrc`内で，`~/.vim/settings/*.vim`を読み込むように指示しているので，シンボリックリンクを経由して，`~/dotfiles/vim_setting_files/.vim/settings/*.vim`がすべて読み込まれる
3. `~/.vimrc`では，続けて`~/.vim/rc/dein*.toml`にかかれたプラグインの読み込みを指示しているので，シンボリックリンクを経由して，`~/dotfiles/vim_setting_files/.vim/rc/dein.toml`が読み込まれる
4. ソフトウェアの起動の高速のため，遅延読み込み設定されている`~/dotfiles/vim_setting_files/.vim/rc/dein_lazy.toml`が，vim起動後に読み込まれる
5. GUI vimを使っている場合は，`~/.gvimrc`がシンボリックリンクを経由して読み込まれる
