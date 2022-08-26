#!/usr/bin/env zsh
alias ls='ls -lFGgh'
alias gs='git status'

function vim-fzf {
  local f="$(fzf)"
  if [[ ! -z $f ]]; then
    # overwrite history
    fc -W
    sed -i '' -e '$d' "$HISTFILE"
    echo "vim \"$f\"" >> $HISTFILE
    fc -R
    vim $f
  fi
}

bindkey -s '^O' 'vim-fzf^M'
alias config='/opt/homebrew/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
