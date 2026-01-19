function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

# bind ctrl-f 'bash ~/.local/bin/tmux-sessionizer'

starship init fish | source

# Only load QuickShell sequences outside of tmux
if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt; and not set -q TMUX
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
end

# Alias Cheatsheets
alias ct='cat ~/terminal-cheatsheet.md'
alias cv='cat ~/vim-cheatsheet.md'

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

# alias ls 'eza --icons'
alias clear "printf '\033[2J\033[3J\033[1;1H'"
alias q 'qs -c ii'

# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end

set -gx BROWSER qutebrowser
fish_add_path ~/.npm-global/bin
