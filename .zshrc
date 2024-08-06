# load .profile
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# Set vi-mode as default for shell interaction
set -o vi

## set defaulft config directory
export XDG_CONFIG_HOME="$HOME/.config"

# https://youtu.be/ud7YxC33Z3w?si=oBp68ABoP5NrMJB8
# Root dir for zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Zsh plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab # bring fzf into tab completion

# Load starship
eval "$(starship init zsh)"

# Load completions
autoload -Uz +X compinit && compinit
zinit cdreplay -q


# Track zsh history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUPE=erase # erase duplicates
setopt appendhistory
setopt sharehistory # share history across terminals
setopt hist_ignore_space # ignore commands starting with space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # make completioon case-insensitive
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}' # use LS_COLORS for completion colors
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # preview files in fzf-tab
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'ls --color $realpath' # preview files in fzf-tab
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'ls --color $realpath' # preview files in fzf-tab
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath' # make file preview work with zoxide


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Aliases 
source $HOME/.config/zsh/aliases.zsh

# Paths
source $HOME/.config/zsh/paths.zsh

## Set config location for tms
export TMS_CONFIG_FILE="$XDG_CONFIG_HOME/tms/config.toml"

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# Disable virtualenv prompt as this is handled by starship
export PYENV_VIRTUALENV_DISABLE_PROMPT=1 

# Created by `pipx` on 2024-01-27 14:59:53
export PATH="$PATH:/Users/milan/.local/bin"

