Git for dotfile management

## Installation on a new system
Fisrt do 
```bash
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare <git-repo-url> $HOME/.dotfiles
```

Then, remove and backup existing doftiles with
```bash
mkdir -p .dotfiles_backup && \
dtf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles_backup/{}
```
Finally, run
```bash
dtf-checkout
```

Optionally, set `showUntrackedFiles` for this repo to no:

```bash
dtf config --local status.showUntrackedFiles no
```

## Maintenance 
[zplug](https://github.com/zplug/zplug) and [dein](https://github.com/Shougo/dein.vim) are managed as subtrees of this repo, and are set up as remotes (called zplug and dein respectively). To update, do 
```bash
# first add the remotes so we can use short hand
dtf remote add dein https://github.com/Shougo/dein.vim.git
dtf remote add zplug https://github.com/zplug/zplug.git
dtf subtree pull -P .config/nvim/repos/dein dein master --squash
dtf subtree pull -P .config/zplug zplug master --squash
```

## Required packages
```
git vim htop tmux wget curl pip python-neovim python3-neovim zsh awk
