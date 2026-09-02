# load .profile
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# Set default config directory
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Configure askpass helper
# export SUDO_ASKPASS="$HOME/.local/bin/sudo-askpass"

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
zinit light zsh-users/zsh-completions
zinit ice wait lucid atload'zicompinit; zicdreplay'
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

# Load starship prompt (must be eager)
eval "$(starship init zsh)"

# Completions - single compinit, cached for 24h
autoload -Uz compinit
compinit -C
autoload -U +X bashcompinit && bashcompinit

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

# direnv https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"

# mcfly https://github.com/cantino/mcfly
eval "$(mcfly init zsh)"

# Require trusted taps for homebrew
export HOMEBREW_REQUIRE_TAP_TRUST=1

# Welcome message
echo "👋 Welcome, $USER!"

# only run in interactive shells
if [[ $- == *i* ]] ; then
    eval "$(fzf --zsh)"
    eval "$(zoxide init --cmd cd zsh)" # needs to run last
fi

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/milan/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

