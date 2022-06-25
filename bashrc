# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.
alias php73="/opt/lampp/bin/php"
alias v="~/Aplicaciones/nightly-nvim.appimage"
alias vimrc="vim ~/Workspace/config_files/vimrc"
alias editsnips="vim ~/Workspace/config_files/UltiSnips/"

test -s ~/.alias && . ~/.alias || true

git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
 }

# PS1='\[\e[32m\]\[\e[1m\]→ \u@\h:\[\e[34m\]\W\[\e[m\]\[\e[33m\]$(git_branch)\[\e[m\]> '
PS1='\[\e[33m\]❯ \[\e[m\]\[\e[36;1m\]\W/\[\e[m\]\[\e[33m\]$(git_branch)\[\e[m\]$ '
# PS2='>'
# export STUDIO_JDK=/usr/java/jdk-16
python="/usr/bin/python3.9"
export PATH="~/.config/composer/vendor/bin:$PATH" 
export EDITOR=vim
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
export VIMDIR="~/.vim/"
export CHROME_EXECUTABLE="/usr/bin/chromium"
export PATH=$JAVA_HOME/bin:$PATH
