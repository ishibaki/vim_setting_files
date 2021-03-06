# vim_setting_files

[Latest on github](https://github.com/ishibaki/vim_setting_files)

My VIM setting files.

---

When you want to use both vim & neovim, it is pretty nice to share the same setting files.  
However, the commands to use dein.vim are different in them, and it makes difficult to simply share the files.  
In order to commonly use the vim-nvim-common setting files, I split .vimrc.

In this repo, I only commit the setting files of vim **not neovim.**

```
~/
├── .vimrc  @ -> ~/dotfiles/vim_setting_files/.vimrc ─────┐
├── .gvimrc @ -> ~/dotfiles/vim_setting_files/.gvimrc ─┐  │
├── .vim/   @ -> ~/dotfiles/vim_setting_files/.vim/ ┐  │  │
├── dotfiles/                                       │  │  │
│   ├── vim_setting_files/                          │  │  │
│   │   ├── .git/                                   │  │  │
│   │   ├── .vimrc <────────────────────────────────┼──┼──┘
│   │   ├── .gvimrc <───────────────────────────────┼──┘
│   │   └── .vim/ <─────────────────────────────────┘
│   │       ├── rc/
│   │       │   ├── dein.toml <─────────────────────────────────────────────────────┐
│   │       │   └── dein_lazy.toml <────────────────────────────────────────────────┼─┐
│   │       │                                                                       │ │
│   │       └── settings/ <─────────────────────────────────────────────────────────┼─┼─┐
│   │           ├── basic.vim                                                       │ │ │
│   │           ├── color.vim                                                       │ │ │
│   │           ├── keymap.vim                                                      │ │ │
│   │           └── plugins.vim                                                     │ │ │
│   │                                                                               │ │ │
│   └── neovim_setting_files/ <─────────────────────────────────────────────────────┼─┼─┼─┐
│       ├── .git/                                                                   │ │ │ │
│       ├── init.vim                                                                │ │ │ │
│       ├── dein.toml        @ -> ~/dotfiles/vim_setting_files/.vim/rc/dein.toml ───┘ │ │ │
│       ├── dein_lazy.toml   @ -> ~/dotfiles/vim_setting_files/.vim/rc/dein_lazy.toml ┘ │ │
│       └── neovim_settings/ @ -> ~/dotfiles/vim_setting_files/.vim/settings/ ──────────┘ │
│                                                                                         │
└── .config/                                                                              │
    └──  nvim/ @ ─> ~/dotfiles/neovim_setting_files/ ─────────────────────────────────────┘
```

Additionally, splitting the files makes easy to manage them.

## [.vimrc](./.vimrc)

The vim specific setting file.  
The symbolic link file locates in the home directory, and it links to `~/dotfiles/vim_setting_files/.vimrc`.  
In this file,

- Read the all setting files (`runtime! settings/*.vim`)
- Adjust dein.vim setting
- Set spell-checking
- Set Color-scheme (I don't know why, but I failed to set color-scheme in color.vim)

## [.gvimrc](./.gvimrc)

The GUI vim setting file.  
The symbolic link file locates in the home directory, and it links to `~/dotfiles/vim_setting_files/.gvimrc`.  
In this file,

- Set window hight & width
- Set font
- Set colors
- Set transparency

## [.vim/rc/](./.vim/rc/)

This directory includes the plug-in TOML files.

## [.vim/settings/](./.vim/settings)

This directory includes the split .vimrc files.

- basic.vim
- color.vim
- keymap.vim
- plugins.vim
