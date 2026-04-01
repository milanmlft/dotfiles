## Personal scripts
export PATH="$PATH:$HOME/bin"

# Determine Homebrew prefix (Apple Silicon: /opt/homebrew, Intel: /usr/local)
if [[ -z "$HOMEBREW_PREFIX" ]]; then
  if [[ -d "/opt/homebrew" ]]; then
    HOMEBREW_PREFIX="/opt/homebrew"
  else
    HOMEBREW_PREFIX="/usr/local"
  fi
fi
export HOMEBREW_PREFIX

export PATH="${HOMEBREW_PREFIX}/opt/libxml2/bin:$PATH"

# allows Coreutils package to be used without 'g' prefix before each command.
export PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnuman:$MANPATH"

## Set C/C++ compilers
export PATH="${HOMEBREW_PREFIX}/opt/llvm/bin:$PATH"
export PATH="${HOMEBREW_PREFIX}/opt/gcc/bin:$PATH"

## For CMake
export CC="${HOMEBREW_PREFIX}/opt/llvm/bin/clang"
export CXX="${HOMEBREW_PREFIX}/opt/llvm/bin/clang++"
export CMAKE_PREFIX_PATH="${HOMEBREW_PREFIX}"
export CMAKE_C_COMPILER="${HOMEBREW_PREFIX}/opt/llvm/bin/clang"
export CMAKE_CXX_COMPILER="${HOMEBREW_PREFIX}/opt/llvm/bin/clang++"
export CMAKE_FIND_FRAMEWORK="LAST"
export CMAKE_FIND_APPBUNDLE="NEVER"
export CMAKE_EXPORT_COMPILE_COMMANDS="ON"

export GPG_TTY=$TTY

## brew autocompletion
FPATH="${HOMEBREW_PREFIX}/share/zsh/site-functions:${FPATH}"

## Use GNU sed
export PATH="${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin:$PATH"

## Go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
