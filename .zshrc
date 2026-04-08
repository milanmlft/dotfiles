# load .profile
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# Set default config directory
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Set vi-mode as default for shell interaction
set -o vi

# Root dir for zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Zsh plugins - turbo mode (deferred loading)
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions
zinit ice wait lucid
zinit light zsh-users/zsh-completions
zinit ice wait lucid atload'zicompinit; zicdreplay'
zinit light zsh-users/zsh-syntax-highlighting
zinit ice wait lucid
zinit light Aloxaf/fzf-tab

# Load starship prompt (must be eager)
eval "$(starship init zsh)"

# Completions - single compinit, cached for 24h
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi
autoload -U +X bashcompinit && bashcompinit
zinit cdreplay -q

# Track zsh history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUPE=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Paths and aliases
source $HOME/.config/zsh/paths.zsh
source $HOME/.config/zsh/aliases.zsh

# Set config location for tms
export TMS_CONFIG_FILE="$XDG_CONFIG_HOME/tms/config.toml"

# pipx
export PATH="$PATH:/Users/milan/.local/bin"

# --- Cached shell init ---
# Caches eval output and regenerates when the binary is updated.
# To force regeneration: rm ~/.cache/zsh/*.zsh
_zsh_cache="$HOME/.cache/zsh"
[[ -d "$_zsh_cache" ]] || mkdir -p "$_zsh_cache"

_cached_source() {
    local name=$1; shift
    local cache="$_zsh_cache/${name}.zsh"
    local bin_path="${commands[$name]}"
    if [[ ! -f "$cache" ]] || [[ -n "$bin_path" && "$bin_path" -nt "$cache" ]]; then
        eval "$@" > "$cache" 2>/dev/null
    fi
    source "$cache"
}

# Shell integrations (fast — keep as direct eval)
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Slow completions — cached
_cached_source uv "uv generate-shell-completion zsh"
_cached_source uvx "uvx --generate-shell-completion zsh"
_cached_source kubectl "kubectl completion zsh"

# direnv https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"

# terraform
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Tab completion for cht.sh
# https://github.com/chubin/cheat.sh?tab=readme-ov-file#zsh-tab-completion
fpath=(~/.zsh.d/ $fpath)

# mcfly https://github.com/cantino/mcfly
eval "$(mcfly init zsh)"

# Welcome message
echo "👋 Welcome, $USER!"
