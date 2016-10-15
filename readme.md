#Git for dotfile management
## Installation on a new system
Fisrt do 
```bash
alias dtf = '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Then, remove and backup existing doftiles with
```bash
mkdir -p .dotfiles_backup && \
dtf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles_backup/{}
```
Finally, run
```bash
dtf checkout
```

Optionally, set `showUntrackedFiles` for this repo to no:

```bash
dtf config --local status.showUntrackedFiles no
```
