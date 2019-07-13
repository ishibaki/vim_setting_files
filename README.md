# vim_setting_files

[Latest on github](https://github.com/ishibaki/vim_setting_files)

ビギナー向けのvim settings.


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
