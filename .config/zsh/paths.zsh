## Personal scripts
export PATH="$PATH:$HOME/bin"

export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"

# allows Coreutils package to be used without 'g' prefix before each command.
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"

## Set C/C++ compilers
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/gcc/bin:$PATH"

## For CMake
export CC="/opt/homebrew/opt/llvm/bin/clang"
export CXX="/opt/homebrew/opt/llvm/bin/clang++"
export CMAKE_PREFIX_PATH="/opt/homebrew"
export CMAKE_C_COMPILER="/opt/homebrew/opt/llvm/bin/clang"
export CMAKE_CXX_COMPILER="/opt/homebrew/opt/llvm/bin/clang++"
export CMAKE_FIND_FRAMEWORK="LAST"
export CMAKE_FIND_APPBUNDLE="NEVER"
export CMAKE_EXPORT_COMPILE_COMMANDS="ON"

export GPG_TTY=$TTY

## brew autocompletion
FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"

## Use GNU sed
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

## Go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
