#!/bin/zsh

# Defines the `XDF_CONFIG_HOME` env variable
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

# Defines the `ZDOTDIR` env variable
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}