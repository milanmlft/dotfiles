# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# load .profile
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

## set defaulft config directory
export XDG_CONFIG_HOME="$HOME/.config"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    colored-man-pages
    python
    pyenv
    virtualenv
    extract
    z
    docker
    zsh-autosuggestions
    zsh-syntax-highlighting
)

## brew autocompletion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh

# User configuration
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshconfig="nvim ~/.zshrc"

# Set vi-mode as default for shell interaction
set -o vi

# Load starship
eval "$(starship init zsh)"


# ALIASES
# -------

alias conf='cd ~/.config'
alias nvconf='cd ~/.config/nvim/ && nvim'
alias zshconf='nvim ~/.zshrc'

# Project shortcuts
alias projects='cd ~/Projects'
alias ppixl='cd ~/Projects/UCLH-Foundry/PIXL && nvim'
alias ptodo='cd ~/Projects/todo/ && nvim'
alias pnotes='cd ~/obsidian-notes/'

alias ls='ls -GFhp'
alias ll='ls -lhp'
alias la='ll -a'
alias tree='tree -C'   # show filesizes in tree output and colorize output
alias cp='cp -i'
alias grep='grep -E'		# force grep to always use extended regexp

alias cat='bat'

# Always use nvim
alias vim='nvim'
alias v='nvim'

## R
alias R='R --no-save --no-restore-data'		# never save or restore R workspace
alias bioc-devel='R_LIBS_USER=~/Library/R/x86_64/4.1-Bioc-3.14/library radian' # launch R with bioc-devel library
alias rad='radian'

## Python
alias python='python3'
alias pip='noglob pip'

## Misc
alias ls-dot='ls -a | grep "^\."'   # List dot-files
alias homepath='realpath --relative-to=$HOME'

## Disable zsh autocorrect for some commands
alias git='nocorrect git'

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Paths
# -----

export PATH="/usr/local/opt/libxml2/bin:$PATH"

## Set C++ compilers
export PATH="$(brew --prefix)/opt/llvm/bin:$PATH"
export PATH="$(brew --prefix)/opt/gcc/bin:$PATH"
export PATH="$(brew --prefix)/opt/ccache/libexec:$PATH"

## Use Homebrew gcc compilers
alias gcc="gcc-13"
alias g++="g++-13"

## For CMake
export CMAKE_PREFIX_PATH="$(brew --prefix)"
export CMAKE_C_COMPILER="$(brew --prefix)/opt/gcc/bin/gcc-13"
export CMAKE_CXX_COMPILER="$(brew --prefix)/opt/gcc/bin/g++-13"
export CMAKE_FIND_FRAMEWORK="LAST"
export CMAKE_FIND_APPBUNDLE="NEVER"
export CMAKE_EXPORT_COMPILE_COMMANDS="ON"
export C="gcc-13"
export CXX="g++-13"

export LDFLAGS="-L/opt/homebrew/opt/libomp/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libomp/include"

export GPG_TTY=$TTY

## aws code completion
# autoload bashcompinit && bashcompinit
# autoload -Uz compinit && compinit
# complete -C '/opt/homebrew/bin/aws_completer' aws
#
# export AWS_PROFILE=playpen

## terraform code completion
# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /opt/homebrew/bin/terraform terraform

## Use GNU sed
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

## pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# Created by `pipx` on 2024-01-27 14:59:53
export PATH="$PATH:/Users/milan/.local/bin"
