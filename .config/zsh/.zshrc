# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"	# Load aliases
source "$ZDOTDIR/optionrc"					# Load options
source "$ZDOTDIR/pluginrc"					# Load plugins

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
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
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

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'vv' edit-command-line

# Fix backspace after returning to insert mode
bindkey -v '^?' backward-delete-char

### Where I found the prompt: https://github.com/LukeSmithxyz/voidrice/blob/1f7376c805cb57daef05713412f8e562141eead8/.config/zsh/.zshrc#L39-L53
# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
