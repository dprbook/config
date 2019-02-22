#!/bin/zsh

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' completions 1
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' substitute 0
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/d/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep nomatch notify
unsetopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install


# ------------------------------------- KEYBINDS -----------------------------------

bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal

# ------------------------------------ KEYBINDS END --------------------------------


# --------------------------------------- ZPLUG ------------------------------------

# Install zplug if not installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh


# PLUGINS INSTALL
zplug "hcgraf/zsh-sudo"
zplug "mafredri/zsh-async", from:github, defer:0
zplug "desyncr/auto-ls"
zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "dprbook/pure", use:pure.zsh, as:theme

# Install packages
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi


# PLUGIN CONFIG

# Auto-ls config
auto-ls-ll () {
    ls -l --color=auto
    echo
}
AUTO_LS_COMMANDS=(ll git-status)

# Fzf config
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Init packages
zplug load

# -------------------------------------- ZPLUG END ----------------------------------


# ------------------------------------- USER ADDED ----------------------------------

# Aliases
source /home/d/bin/aliases/basics
source /home/d/bin/aliases/vim
source /home/d/bin/aliases/docker
source /home/d/bin/aliases/random

# Environment variables
export TERM=xterm-256color
# Path
export PATH=$PATH:~/bin:/usr/local/share/npm/bin
export HIST_STAMPS='yyyy-mm-dd'
# Qt
export QT_VERSION=5.10.1
export QT_DIR=$HOME/Qt5.10.1
export QT_PKG_CONFIG=true
# JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# Functions (not applicable to be custom scripts)
function mcd() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 [DIR-NAME]" 1>&2
    else
        mkdir $1 && cd $1
    fi
}

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#if [[ ! $TERM =~ screen ]]; then
#    exec tmux
#fi

# ----------------------------------- USER ADDED END --------------------------------
