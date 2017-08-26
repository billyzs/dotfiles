export DEV=$HOME/dev
export CONFIG_HOME=$HOME/.config
source $CONFIG_HOME/zplug/init.zsh

# Common Plugins
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "denysdovhan/spaceship-zsh-theme, use:spaceship.zsh, from:github, as:theme"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose
# git completion
fpath=($CONFIG_HOME $fpath)
