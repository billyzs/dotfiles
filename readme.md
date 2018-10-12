Git for dotfile management

## Installation on a new system
Fisrt do 
```bash
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare https://github.com/billyzs/dotfiles.git $HOME/.dotfiles
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

## Maintenance 
### Subtrees
* [zplug](https://github.com/zplug/zplug)
* [dein](https://github.com/Shougo/dein.vim) 
* [tmux plugin manager](https://github.com/tmux-plugins/tpm)
Subtrees have the following prefixes:
```bash
# first add the remotes so we can use short hand
dtf remote add dein https://github.com/Shougo/dein.vim.git
dtf remote add zplug https://github.com/zplug/zplug.git
dtf remote add tpm https://github.com/tmux-plugins/tpm.git
dtf subtree pull -P .config/nvim/repos/dein dein master --squash
dtf subtree pull -P .config/zplug zplug master --squash
dtf subtree pull -P .config/tpm tpm master --squash
```

## Frequently used packages
```
aria2 git kitty htop neovim most nmap tmux python3-neovim zsh python-virtualenv python-virtualenvwrapper redshift polybar
```

## Arch/Manjaro setup notes
### Brightness Fn key not working
* add `acpi_osi= ` to kernel params [source](https://www.reddit.com/r/thinkpad/comments/5whn9v/thinkpad_p50_arch_linux_brightness_issue/)
