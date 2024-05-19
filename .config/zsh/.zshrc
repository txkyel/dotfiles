autoload -U colors && colors  		# Enable colours
stty stop undef   			# Disable ctrl-s to freeze terminal
setopt extendedglob nomatch notify
unsetopt autocd beep

### HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_STATE_HOME/zsh/history"
setopt append_history

### ALIASES
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

### AUTOCOMPLETE
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

### KEYBINDS
bindkey -v
