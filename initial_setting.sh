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

if [ ! -e "${DIRPATH_REPO}/info" ]; then
    mkdir "${DIRPATH_REPO}/info"
fi

# :%s/\vgithub.com(\/.+)blob\/(.+)/raw.githubusercontent.com\1\2/g
COLOR_LIST=(
    "badwolf.vim"
    "falcon.vim"
    "goodwolf.vim"
    "gruvbox.vim"
    "hybrid.vim"
    "hybrid_material.vim"
    "hybrid_reverse.vim"
    "iceberg.vim"
    "jellybeans.vim"
    "molokai.vim"
    "srcery.vim"
    "stellarized.vim"
    "tender.vim"
    "zenburn.vim"
)

URL_LIST=(
    "https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim"
    "https://raw.githubusercontent.com/fenetikm/falcon/master/colors/falcon.vim"
    "https://raw.githubusercontent.com/sjl/badwolf/master/colors/goodwolf.vim"
    "https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim"
    "https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim"
    "https://raw.githubusercontent.com/kristijanhusak/vim-hybrid-material/master/colors/hybrid_material.vim"
    "https://raw.githubusercontent.com/kristijanhusak/vim-hybrid-material/master/colors/hybrid_reverse.vim"
    "https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim"
    "https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim"
    "https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim"
    "https://raw.githubusercontent.com/srcery-colors/srcery-vim/master/colors/srcery.vim"
    "https://raw.githubusercontent.com/nightsense/stellarized/master/colors/stellarized.vim"
    "https://raw.githubusercontent.com/jacoborus/tender.vim/master/colors/tender.vim"
    "https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim"
)

LIST_LENGTH="${#COLOR_LIST[@]}"

for ((i=1; i<=${LIST_LENGTH}; i++));
do
    curl ${URL_LIST[${i}]} > ${DIRPATH_REPO}/colors/${COLOR_LIST[${i}]}
    sleep 1s
done
