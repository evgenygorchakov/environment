# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.local/share/history/histfile
setopt appendhistory
setopt inc_append_history
setopt hist_ignore_all_dups

# Colors
autoload -U colors && colors

# Key bindings
bindkey -e
bindkey ';5D' backward-word # Ctrl+Left
bindkey ';5C' forward-word  # Ctrl+Right
[[ -t 0 ]] && stty intr '^X'            # Ctrl+C is copy in terminal, so interrupt is Ctrl+X

# Completion
autoload -Uz compinit
compinit -i -d ~/.cache/zcompcache

# Zsh plugins
export HISTORY_BASE=~/.cache/zsh_directory_history
for plugin in \
  zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  zsh-autosuggestions/zsh-autosuggestions.zsh \
  per-directory-history/per-directory-history.zsh
do
  [[ -f ~/.local/lib/zsh/$plugin ]] && source ~/.local/lib/zsh/$plugin
done

# Local binaries
export PATH="$HOME/.local/bin:$PATH"

# Prompt
if command -v starship > /dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# History search (Ctrl+R)
if command -v atuin > /dev/null 2>&1; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

# Aliases
alias ..='cd ..'
if command -v eza > /dev/null 2>&1; then
  alias ls='eza'
  alias l='eza --all'
  alias ll='eza --long --all --git'
fi
if command -v bat > /dev/null 2>&1; then
  alias cat='bat'
  export BAT_THEME=ansi
fi
