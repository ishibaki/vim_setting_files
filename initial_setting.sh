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
ln -s "${DIRPATH_REPO}/.vimrc" "~/.vimrc"
ln -s "${DIRPATH_REPO}/.gvimrc" "~/.gvimrc"
ln -s "${DIRPATH_REPO}/.vim" "~/.vim"
