#!/bin/zsh

# Runs cht.sh in a new temporary tmux pane
# Uses fzf to select a topic interactively

all_topics=$(curl -s cht.sh/:list)
selected=$(echo $all_topics | fzf --height 40% --reverse --inline-info --header "Select topic:")

tmux -h splitw zsh -c "curl -s cht.sh/$selected | bat --paging=always"
