alias ls='ls --color=auto'
alias ll='ls -l'
alias ll='ls -lhp'
alias la='ll -a'
alias tree='tree -C' # show filesizes in tree output and colorize output
alias cp='cp -i'
alias grep='grep -E --color' # force grep to always use extended regexp

alias conf='cd ~/.config'
alias nvconf='cd ~/.config/nvim/ && nvim'
alias zshconf='nvim ~/.zshrc'

# Update brewfile
alias brupdate='~/.config/homebrew/update.sh'

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

## Python
alias python='python3'
alias pip='uv pip'
