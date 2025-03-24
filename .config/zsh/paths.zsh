## Set config location for tms
export TMS_CONFIG_FILE="$XDG_CONFIG_HOME/tms/config.toml"

## Personal scripts
export PATH="$PATH:$HOME/bin"

export PATH="$(brew --prefix)/opt/libxml2/bin:$PATH"

# allows Coreutils package to be used without 'g' prefix before each command.
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix)/opt/coreutils/libexec/gnuman:$MANPATH"

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
export CC="gcc-13"
export CXX="g++-13"

export GPG_TTY=$TTY

## brew autocompletion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

## Use GNU sed
export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"

## Go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
