#!/bin/zsh

##############
# Base
##############
export TERM=xterm-256color
export EDITOR="${EDITOR:-nvim}"
export PAGER="${PAGER:-less}"


################
# History
################
HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY_TIME


##############
# Tools
##############

# Starship Prompt
eval "$(starship init zsh)"

# FZF
if [[ ! "$PATH" == */home/ewilazarus/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/ewilazarus/.fzf/bin"
fi

# TMUX
if [ "$TMUX" = "" ]; then tmux -u new-session -A -s main; fi


################
# Utilities
################

bindkey -e

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line


##############
# Aliases
##############

# NVIM
alias vi="nvim"
alias vim="nvim"

# GIT
alias gs="git status -sb"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gco="git checkout"
alias gp="git push"
alias gl="git log --oneline"
alias gr="git rebase"
alias gri="git rebase -i"
alias gdiff="git difftool"
alias gwip="git add . && git commit -m '**WIP'"
alias gnvm="git checkout -- . && git clean -df"

# Misc
alias l="ls"
alias ll="ls -al"

