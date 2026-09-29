# PATH and toolchain environment. `typeset -U path` (in .zshrc) dedupes.
: "${HOMEBREW_PREFIX:=/opt/homebrew}"

path=(
  "$HOME/bin"
  "$HOME/.local/bin"                                  # uv tool / pipx
  "$HOME/go/bin"
  "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin"     # GNU coreutils without g-prefix
  "$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin"
  "$HOMEBREW_PREFIX/opt/llvm/bin"
  "$HOMEBREW_PREFIX/opt/libxml2/bin"
  $path
)
export MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:${MANPATH:-}"

# C/C++: Homebrew LLVM for CMake + clangd
export CC="$HOMEBREW_PREFIX/opt/llvm/bin/clang"
export CXX="$HOMEBREW_PREFIX/opt/llvm/bin/clang++"
export CMAKE_PREFIX_PATH="$HOMEBREW_PREFIX"
export CMAKE_C_COMPILER="$CC"
export CMAKE_CXX_COMPILER="$CXX"
export CMAKE_FIND_FRAMEWORK=LAST
export CMAKE_FIND_APPBUNDLE=NEVER
export CMAKE_EXPORT_COMPILE_COMMANDS=ON

export GOPATH="$HOME/go"
export GPG_TTY=$TTY
