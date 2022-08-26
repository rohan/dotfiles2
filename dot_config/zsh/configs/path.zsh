# remove duplicates
typeset -U path fpath

# add fzf
if ! whence fzf >/dev/null && [[ -d "/usr/local/opt/fzf/bin" ]]; then
  path=("/usr/local/opt/fzf/bin" $path)
fi

# add manual functions to fpath
fpath+=("${XDG_CONFIG_HOME:-$HOME/.config}/zsh/functions/")
autoload -Uz ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/functions/*

export PATH="$(yarn global bin):$PATH"
