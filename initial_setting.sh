#!/bin/sh

DIRPATH_REPO="~/dotfiles/vim_setting_files"

if [ ! -e ${DIRPATH_REPO} ]; then
    if [ ! -e ~/dotfiles ]; then
        makedir ~/dotfiles
    fi
    mv ../vim_setting_files ${DIRPATH_REPO}
    ln -s ${DIRPATH_REPO}/.vimrc ~/.vimrc
    ln -s ${DIRPATH_REPO}/.gvimrc ~/.gvimrc
    ln -s ${DIRPATH_REPO}/.vim/ ~/.vim/
fi

