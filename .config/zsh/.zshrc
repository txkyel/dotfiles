source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"	# Load aliases
source "$ZDOTDIR/optionrc"					# Load options
source "$ZDOTDIR/pluginrc"					# Load plugins

# Prompt
PS1="%F{cyan}%~ $%(?.%F{green}.%F{red})%#%f "

# History
HISTSIZE=100000
SAVEHIST=100000
[ -d "$XDG_STATE_HOME/zsh" ] || mkdir -p "$XDG_STATE_HOME/zsh"
HISTFILE="$XDG_STATE_HOME/zsh/history"

# zsh-history-substring-search keybindings
zmodload zsh/terminfo
bindkey "terminfo[kcuu1]" history-substring-search-up
bindkey "terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down
bindkey -M vicmd '^[[A' history-substring-search-up
bindkey -M vicmd '^[OA' history-substring-search-up
bindkey -M vicmd '^[[B' history-substring-search-down
bindkey -M vicmd '^[OB' history-substring-search-down
bindkey -M viins '^[[A' history-substring-search-up
bindkey -M viins '^[OA' history-substring-search-up
bindkey -M viins '^[[B' history-substring-search-down
bindkey -M viins '^[OB' history-substring-search-down

# Autocomplete
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)	# Include hidden files

# Tab menu keybinds
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
