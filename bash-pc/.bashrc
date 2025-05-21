#
# ~/.bashrc
#

eval "$(starship init bash)"

bind -x '"\C-f": "~/.local/bin/tmux-sessionizer"'

# Misc aliases
alias la='ls -la'
alias tg='tree --gitignore'

# Alias Nvim and Tmux shortcuts
alias n=nvim
alias t=tmux
alias h=helix

# Git shortcuts
alias gits='git status'
alias gita='git add .'
alias gitp='git pull'
alias gitu='git commit -m "Update $(date +%F)"'
# Use gitm to add, update, and push any modified files. Excludes any new files
alias gitm='git add -u && git commit -m "Update $(date +%F)" && git push'
# Use gitq to add, update, and push ALL files, including new files
alias gitq='git add . && git commit -m "Update $(date +%F)" && git push'
# Run Git Backdate script
alias gitb="~/.local/bin/gitb"

# Obsidian mappings
alias vo='cd ~/vaults'
alias vr='nvim ~/vaults/inbox/*.md'
alias vn='~/.local/bin/vn'
alias vs='~/.local/bin/vs'
alias vu='~/.local/bin/vu'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
