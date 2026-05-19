# default editor
export EDITOR=vim
bindkey -e  # use emacs keybindings in zsh regardless of $EDITOR

# starship: brew install starship
eval "$(starship init zsh)"

# uv: https://docs.astral.sh/uv
. "$HOME/.local/bin/env"

# zsh-completions: brew install zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  # rebuild dump once a day; -C uses cached dump (skips fpath scan + audit)
  if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then compinit; else compinit -C; fi
  # byte-compile dump → ~/.zcompdump.zwc; zsh prefers .zwc when fresh
  [[ -s ~/.zcompdump && (! -s ~/.zcompdump.zwc || ~/.zcompdump -nt ~/.zcompdump.zwc) ]] && zcompile ~/.zcompdump
fi

# gcloud: brew install gcloud-cli
export PATH=/opt/homebrew/share/google-cloud-sdk/bin:"$PATH"
export CLOUDSDK_PYTHON="$(uv python find --no-project 3.12)"

# fnm: brew install fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# edit-command-line
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# psql: brew install libpq
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PGGSSENCMODE=disable  # Skip Kerberos auth (30s timeout on macOS)

# shell history via atuin
unset HISTFILE                  # don't write ~/.zsh_history at all
setopt HIST_IGNORE_SPACE        # space-prefix still skips recording
eval "$(atuin init zsh)"

# zsh-autosuggestions: brew install zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting: brew install zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
