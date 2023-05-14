eval "$(starship init zsh)"

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'    # color of suggestions

alias ls='ls --color=auto'                  # enable color for ls
alias ll='ls -al'

bindkey -v
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

