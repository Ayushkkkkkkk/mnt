# ~/.zshrc: executed by zsh for interactive shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
setopt APPEND_HISTORY

# For setting history length
HISTSIZE=1000
SAVEHIST=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
setopt CHECK_JOBS

# Enable extended globbing (similar to globstar in Bash)
setopt EXTENDED_GLOB

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below)
if [[ -z "${debian_chroot:-}" && -r /etc/debian_chroot ]]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color)
autoload -Uz colors && colors
if [[ $TERM == xterm-color || $TERM == *-256color ]]; then
    color_prompt=yes
fi

# Uncomment for a colored prompt, if the terminal has the capability
if [[ $color_prompt == yes ]]; then
    PS1='%{$fg[green]%}${debian_chroot:+($debian_chroot)}%n@%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}%# '
else
    PS1='${debian_chroot:+($debian_chroot)}%n@%m:%~%# '
fi

# If this is an xterm set the title to user@host:dir
if [[ $TERM == xterm* || $TERM == rxvt* ]]; then
    PS1="%{$terminfo[bold] %} ${debian_chroot:+($debian_chroot)}%n@%m: %~ %{$terminfo[reset] %}%# "
fi

# Enable color support for ls and also add handy aliases
if command -v dircolors >/dev/null; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands
alias alert='notify-send --urgency=low -i "$([[ $? = 0 ]] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions
# You may want to put all your additions into a separate file like
# ~/.zsh_aliases, instead of adding them here directly.

# Load custom aliases if they exist
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

# Enable programmable completion features
if [[ -f /usr/share/zsh/site-functions/_completion ]]; then
    source /usr/share/zsh/site-functions/_completion
elif [[ -f /etc/zsh_completion ]]; then
    source /etc/zsh_completion
fi

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [[ -d "$FNM_PATH" ]]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env)"
fi

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/usr/local/go/bin
source "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/zig

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# HIST_STAMPS="mm/dd/yyyy"

# Custom folder for Oh My Zsh
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes.
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
