#!/bin/sh

DIRPATH_REPO="~/dotfiles/vim_setting_files"
DIRPATH_PARENT="~/dotfiles"

if [ ! -e "${DIRPATH_REPO}" ]; then
    if [ ! -e "${DIRPATH_PARENT}" ]; then
        mkdir "${DIRPATH_PARENT}"
    fi
    mkdir "${DIRPATH_REPO}"
fi

cp "../vim_setting_files" "${DIRPATH_REPO}"

if [ -e ~/.vimrc ]; then
    rm ~/.vimrc
fi
ln -s "${DIRPATH_REPO}/.vimrc" "~/.vimrc"

if [ -e ~/.gvimrc ]; then
    rm ~/.gvimrc
fi
ln -s "${DIRPATH_REPO}/.gvimrc" "~/.gvimrc"

if [ -e ~/.vim ]; then
    rm -rf ~/.vim
fi
ln -s "${DIRPATH_REPO}/.vim" "~/.vim"
