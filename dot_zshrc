# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U colors && colors

# Use menu for autocompletion when number of items >= 2
zstyle ':completion:*' menu select=2
# Colors for files
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Verbose completion results
zstyle ':completion:*' verbose true
# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true
# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'

# Share history between all sessions.
setopt share_history
# Delete old recorded entry if new entry is a duplicate
setopt hist_ignore_all_dups


if [[ -f "/usr/local/opt/fzf/shell/key-bindings.zsh" ]]; then
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

eval "$(pyenv init --no-rehash -)"
eval "$(/opt/homebrew/bin/brew shellenv)"

export GOPATH=$HOME/src/go # don't forget to change your path correctly!
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# source all configs
source ~/.config/zsh/configs/configs.zsh

# source all plugins
source ~/.config/zsh/plugins/plugins.zsh

