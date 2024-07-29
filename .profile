# set default text editor to nvim
export EDITOR='/opt/homebrew/bin/nvim'
export VISUAL='/opt/homebrew/bin/nvim'

# languages
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"

. "$HOME/.cargo/env"

# Add Homebrew-installed bins to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
