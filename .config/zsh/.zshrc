autoload -U colors && colors  		# Enable colours
stty stop undef   			# Disable ctrl-s to freeze terminal
setopt extendedglob nomatch notify
unsetopt autocd beep

### HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_STATE_HOME/zsh/history"
setopt append_history			# Parallel zsh sessions will add entries to the history list

### ALIASES
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

### AUTOCOMPLETE
autoload -Uz compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files

### KEYBINDS
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char

### PLUGINS
[ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] \
	&& source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f "${ZDOTDIR}/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ] \
	&& source "${ZDOTDIR}/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
