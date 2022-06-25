#! /usr/bin/zsh

FILES=()
NEOVIM_VIMRC="$HOME/.config/nvim/init.vim"
VIM_VIMRC="$HOME/.vim/vimrc"

if test -f $NEOVIM_VIMRC;then
    rm $NEOVIM_VIMRC
    echo "$NEOVIM_VIMRC borrado"
    ln vimrc $NEOVIM_VIMRC
fi

if test -f $VIM_VIMRC;then
    rm $VIM_VIMRC
    echo "$VIM_VIMRC borrado"
    ln vimrc $VIM_VIMRC
fi
