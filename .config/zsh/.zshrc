eval "$(starship init zsh)"

source ~/.config/zsh/.installed_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

TERM=xterm-256color  # support 256 colors; also on  remote hosts
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'    # color of suggestions
alias ls='ls --color=auto'                  # enable color for ls
