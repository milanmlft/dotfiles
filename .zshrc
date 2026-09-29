# ~/.zshrc — interactive shell config

# Environment (EDITOR, locale, Homebrew, cargo) lives in .profile
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export HOMEBREW_REQUIRE_TAP_TRUST=1

# Nested zellij panes re-source this file: keep PATH/FPATH free of duplicates
typeset -U path fpath

# ---- PATH & toolchain --------------------------------------------------
source "$XDG_CONFIG_HOME/zsh/paths.zsh"

# ---- History -----------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt extended_history share_history hist_ignore_space \
       hist_ignore_all_dups hist_save_no_dups hist_find_no_dups hist_reduce_blanks

# ---- vi mode -----------------------------------------------------------
bindkey -v
KEYTIMEOUT=1   # 10ms: Esc feels instant

# ---- Plugins (zinit) ---------------------------------------------------
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
  mkdir -p "${ZINIT_HOME:h}"
  git clone --depth 1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

# Completion definitions must be on fpath *before* compinit runs
zinit ice blockf
zinit light zsh-users/zsh-completions
fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" "$HOME/.docker/completions" $fpath)

# One compinit; full rebuild of the dump at most once a day
autoload -Uz compinit bashcompinit
() {
  setopt local_options extended_glob
  local dump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
  [[ -d ${dump:h} ]] || mkdir -p "${dump:h}"
  if [[ -n $dump(#qN.mh+24) || ! -f $dump ]]; then compinit -d "$dump"; else compinit -C -d "$dump"; fi
}
bashcompinit

# fzf-tab: after compinit, before anything that wraps widgets
zinit light Aloxaf/fzf-tab

# Deferred: these wrap ZLE widgets, so they load last
zinit wait lucid for \
  atload'_zsh_autosuggest_start' zsh-users/zsh-autosuggestions \
  zdharma-continuum/fast-syntax-highlighting

# bash-style completers for the infra CLIs
(( $+commands[aws_completer] )) && complete -C aws_completer aws
(( $+commands[terraform] ))     && complete -o nospace -C terraform terraform
(( $+commands[tofu] ))          && complete -o nospace -C tofu tofu

# ---- Completion styling ------------------------------------------------
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no                      # let fzf-tab take over
zstyle ':fzf-tab:complete:(cd|ls|eza|__zoxide_z):*' fzf-preview 'eza -1 --color=always --icons $realpath'

# ---- Tools -------------------------------------------------------------
source "$XDG_CONFIG_HOME/zsh/aliases.zsh"

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
source <(fzf --zsh)                                   # Ctrl-R history, Ctrl-T files, Alt-C dirs
(( $+commands[zellij] )) && source <(zellij setup --generate-completion zsh)

# ---- OSC 133 semantic prompts ------------------------------------------
# Lets zellij 0.45+ jump between prompts (Alt a, [ then [ / ]) and copy
# the last command's output (… then c). Ghostty does this itself, but its
# integration isn't loaded in shells spawned by zellij.
if [[ -n $ZELLIJ ]]; then
  autoload -Uz add-zsh-hook
  typeset -g _osc133_ran=0
  _osc133_precmd() {
    local ret=$?
    (( _osc133_ran )) && print -n "\e]133;D;${ret}\a"
    _osc133_ran=0
    print -n "\e]133;A\a"
  }
  _osc133_preexec() { _osc133_ran=1; print -n "\e]133;C\a"; }
  add-zsh-hook precmd _osc133_precmd
  add-zsh-hook preexec _osc133_preexec
  PROMPT="${PROMPT}%{$(print -n '\e]133;B\a')%}"
fi

# zoxide hooks cd, so it goes last
eval "$(zoxide init --cmd cd zsh)"
