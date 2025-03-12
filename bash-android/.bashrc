#
# ~/.bashrc
#

eval "$(starship init bash)"

bind -x '"\C-f": "~/.local/bin/tmux-sessionizer"'
bind -x '"\C-n": "~/notes/find_files.sh"'
bind -x '"\C-g": "~/notes/live_grep.sh"'

# Alias Nvim and Tmux shortcuts
alias n=nvim
alias t=tmux

# Git shortcuts
alias gits='git status'
alias gita='git add -u'
alias gitp='git push'
alias gitu='git commit -m "Update $(date +%F)"'
# Use gitm to add, update, and push any modified files. Excludes any new files
alias gitm='git add -u && git commit -m "Update $(date +%F)" && git push'
# Use gitq to add, update, and push ALL files, including new files
alias gitq='git add . && git commit -m "Update $(date +%F)" && git push'

# Obsidian mappings
alias vo='cd ~/vaults'
alias vr='nvim ~/vaults/inbox/*.md'
alias vn='~/bin/vn'
alias vs='~/bin/vs'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
