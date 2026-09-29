# ---- listing (eza) -----------------------------------------------------
alias ezaa='eza --icons --git --group-directories-first'
alias ls='eza'
alias l='ezaa --oneline'
alias ll='ezaa -l'
alias la='ezaa -la'
alias ld='ezaa -lD'              # directories only
alias lf='ezaa -lf'              # files only
alias lh='ezaa -dl .*'           # hidden files only
alias lt='ezaa -T'               # tree
alias lr='ezaa -l --reverse --sort size'

# ---- safer / modern defaults -------------------------------------------
alias cp='cp -i'
alias grep='grep -E --color=auto'
alias cat='bat -p'
alias du='dust'
alias cl='clear'
alias cdtemp='cd "$(mktemp -d)"'

# ---- editors & config --------------------------------------------------
alias vim='nvim'
alias v='nvim'
alias conf='cd $XDG_CONFIG_HOME'
alias nvconf='nvim $XDG_CONFIG_HOME/nvim/'
alias zshconf='nvim ~/.zshrc'
alias zjconf='nvim $XDG_CONFIG_HOME/zellij/config.kdl'

# ---- zellij ------------------------------------------------------------
alias zja='zellij attach'
alias zjl='zellij list-sessions'
alias zjk='zellij kill-session'

# ---- R -----------------------------------------------------------------
alias R='R -q --no-save --no-restore-data'
alias rcheck='Rscript -e "devtools::check()"'
alias rtest='Rscript -e "devtools::test()"'
alias rdoc='Rscript -e "devtools::document()"'
alias rinstall='Rscript -e "devtools::install()"'

# ---- misc tools --------------------------------------------------------
alias k='kubectl'
alias tasks='gh issue list --assignee @me'
alias glow='glow -p'
alias ff='fastfetch'
alias boo='ghostty +boo'
