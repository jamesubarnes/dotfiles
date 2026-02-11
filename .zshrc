# homebrew: https://brew.sh
eval "$(/opt/homebrew/bin/brew shellenv)"

# starship: brew install starship
eval "$(starship init zsh)"

# uv: https://docs.astral.sh/uv
. "$HOME/.local/bin/env"

# zsh-completions: brew install zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# gcloud: brew install gcloud-cli
export PATH=/opt/homebrew/share/google-cloud-sdk/bin:"$PATH"
export CLOUDSDK_PYTHON="$(uv python find 3.12)"

# fnm: brew install fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# fzf: brew install fzf
source <(fzf --zsh)
export FZF_CTRL_R_OPTS="--bind 'enter:accept-or-print-query'"

# edit-command-line
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# kubectl tab completion
source <(kubectl completion zsh)

# psql: brew install postgresql@15
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PGGSSENCMODE=disable  # Skip Kerberos auth (30s timeout on macOS)

# shell history
setopt SHARE_HISTORY          # Share history between all sessions
setopt INC_APPEND_HISTORY     # Write to history file immediately, not on shell exit
setopt HIST_IGNORE_ALL_DUPS   # Don't record duplicates
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# zsh-autosuggestions: brew install zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting: brew install zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
