# set default text editor to nvim
export EDITOR='/opt/homebrew/bin/nvim'
export VISUAL='/opt/homebrew/bin/nvim'

# languages
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"

. "$HOME/.cargo/env"

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
