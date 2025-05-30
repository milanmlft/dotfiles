alias ls='ls --color=auto'

# eza aliases
alias ls='eza'
alias ezaa='eza --icons --git --group-directories-first'
alias ld='ezaa -lD' # only list directories
alias lf='ezaa -lf' # only list files
alias l='ezaa --oneline'
alias ll='ezaa -l'
alias la='ezaa -la' # list all files including hidden
alias lh='ezaa -dl .*' # list hidden files
alias lt='ezaa -T' # tree view
alias lr='ezaa --reverse --sort size' # sort files by size

alias cp='cp -i'
alias grep='grep -E --color' # force grep to always use extended regexp
alias cl='clear'

alias conf='cd ~/.config'
alias nvconf='cd ~/.config/nvim/ && nvim'
alias zshconf='nvim ~/.zshrc'

alias cat='bat'

# Always use nvim
alias vim='nvim'
alias v='nvim'

## R
alias R='R --no-save --no-restore-data'		# never save or restore R workspace
alias bioc-devel='R_LIBS_USER=~/Library/R/x86_64/4.1-Bioc-3.14/library radian' # launch R with bioc-devel library
alias rad='radian'
alias rcheck='Rscript -e "devtools::check()"'
alias rtest='Rscript -e "devtools::test()"'
alias rinstall='Rscript -e "devtools::install()"'

# GitHub
alias tasks='gh issue list --assignee @me' # list all issues assigned to me

# Create a temp dir and change into it
alias cdtemp='cd $(mktemp -d)'

## Use Homebrew gcc compilers
alias gcc="gcc-14"
alias g++="g++-14"

