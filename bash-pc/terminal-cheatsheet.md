### Terminal Commands ###

# File finding
find . -name "*pattern*" -type f
rg --files | rg pattern

# Code search  
rg --vimgrep "TODO"
grep -rn "pattern" .

# Git workflow
git diff --name-only --diff-filter=U
git log -L 42,42:file.rs

# Steam OS initialization
passwd
sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo
