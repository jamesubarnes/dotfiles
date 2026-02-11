# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# starship
eval "$(starship init zsh)"

# uv
. "$HOME/.local/bin/env"

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# gcloud
export PATH=/opt/homebrew/share/google-cloud-sdk/bin:"$PATH"
export CLOUDSDK_PYTHON="$(uv python find 3.12)"

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# fzf
source <(fzf --zsh)
export FZF_CTRL_R_OPTS="--bind 'enter:accept-or-print-query'"

# edit-command-line
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# kubectl tab completion
source <(kubectl completion zsh)

# psql
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PGGSSENCMODE=disable  # Skip Kerberos auth (30s timeout on macOS)

# shell history
setopt SHARE_HISTORY          # Share history between all sessions
setopt INC_APPEND_HISTORY     # Write to history file immediately, not on shell exit
setopt HIST_IGNORE_ALL_DUPS   # Don't record duplicates
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
