# ~/.profile — environment shared by login shells (sourced by .zshrc too)

# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/milan/.docker/bin"
# End of Docker Desktop section.

# Homebrew first, so everything below can rely on $HOMEBREW_PREFIX
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!'

# LANG is enough; LC_ALL overrides everything and breaks per-category tweaks
export LANG=en_US.UTF-8

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
