# start tmux if not already in tmux
if [ -z "$TMUX" ]; then
  tmux new -A -s main
  exit 0
fi


# Enable vim mode
bindkey -v
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

# colored output for ls
alias ls='ls --color=auto'
alias ll='ls -al'

# Enable starship prompt
eval "$(starship init zsh)"

# Enable plugin zsh-autosuggestion
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# if existing source artifactory_env.sh
 if [ -f ~/artifactory_env.sh ]; then
  source ~/artifactory_env.sh
  echo "Artifactory environment variables loaded"
fi


export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PATH=$PATH:/mnt/c/Program\ Files/Beyond\ Compare\ 4



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(atuin init zsh)"
