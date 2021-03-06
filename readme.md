Git for dotfile management

## Installation on a new system
Fisrt do 
```bash
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare https://github.com/billyzs/dotfiles.git $HOME/.dotfiles
```

Then, remove and backup existing doftiles with
```bash
mkdir -p .dotfiles_backup && dtf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} tar --remove-files -zcvf .dotfiles_backup/backup.tar.gz {}
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
### user name
user shall always be called `bzs`
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
NOT from AUR
```
aria2 git kitty htop neovim most nmap tmux python-neovim zsh python-virtualenv python-virtualenvwrapper redshift openssh sshpass yad gsimplecal fcitx{,-googlepinyin,-cloudpinyin,-configtool} xarchiver numlockx xclip
```
from AUR:
```
jsoncpp libmpd libmpdclient polybar
```

## Arch/Manjaro setup notes
### Brightness Fn key not working
* add `acpi_osi= ` to kernel params [source](https://www.reddit.com/r/thinkpad/comments/5whn9v/thinkpad_p50_arch_linux_brightness_issue/) (might not be necessary after kernel 4.18.16)
### change makepkg make flag
* uncommentd the line about `MAKEFLAGS` in `/etc/makepkg.conf`& set to sensible number
### user & group 
* `sudo groupadd docker && sudo groupadd dialout && sudo groupadd plugdev`
* `visudo` and uncomment the line that allows WHEEL to execute sudo without password
* `sudo usermod -g docker bzs sudo usermod -g dialout bzs && sudo usermod -g plugdev bzs`
### enable docker
* `systemctl enable --now docker && sudo reboot`
### redshift
* `systemctl --user enable --now geoclue-agent redshift`
### [screen tearing with Nvidia cards](https://wiki.archlinux.org/index.php/NVIDIA/Troubleshooting#Avoid_screen_tearing)
* in `nvidia-settings` -> X Server Display Configuration,set either _Force Composition Pipeline_ or _Force Full Composition Pipeline_ to true
* `sudo ln -s -T ~/.config/20-nvidia.conf /etc/x11/xorg.conf.d/20-nvidia.conf`
