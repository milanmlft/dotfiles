# load .profile
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

## Colors
export TERM="xterm-256color"

## set defaulft config directory
export XDG_CONFIG_HOME="$HOME/.config"

# Set vi-mode as default for shell interaction
set -o vi

# Load starship
eval "$(starship init zsh)"


# ALIASES
# -------

alias conf='cd ~/.config'
alias nvconf='nvim ~/.config/nvim/'
alias zshconf='nvim ~/.zshrc'

# Project shortcuts
alias projects='cd ~/Projects'
alias pixl='cd ~/Projects/UCLH-Foundry/PIXL'
alias notes='cd ~/obsidian-notes/'

alias ls='ls -GFhp'
alias ll='ls -lhp'
alias cp='cp -i'
alias tree='tree -C'   # show filesizes in tree output and colorize output
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
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/gcc/bin:$PATH"
export PATH="/opt/homebrew/opt/ccache/libexec:$PATH"

## Use Homebrew gcc compilers
alias gcc="gcc-13"
alias g++="g++-13"

## For CMake
export CMAKE_PREFIX_PATH="/opt/homebrew"
export CMAKE_FIND_FRAMEWORK="LAST"
export CMAKE_FIND_APPBUNDLE="NEVER"
export CMAKE_EXPORT_COMPILE_COMMANDS="ON"
export C="gcc-13"
export CXX="g++-13"

export GPG_TTY=$TTY

## aws code completion
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/opt/homebrew/bin/aws_completer' aws

export AWS_PROFILE=playpen

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.3.7/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)

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
