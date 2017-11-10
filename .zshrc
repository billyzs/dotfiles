# Imports and env vars
export TERM="xterm-256color"
export DEV=$HOME/devel
export CONFIG_HOME=$HOME/.config
source $CONFIG_HOME/zplug/init.zsh
export ZSH_LOCAL_DIR=$CONFIG_HOME/zsh_local


# Common Plugins
for f in `find $ZSH_LOCAL_DIR -name "*.plugin.zsh"`; do zplug $f, from:local; done;
zplug "$ZSH_LOCAL_DIR/dotfiles", from:local
zplug "zsh-users/zsh-history-substring-search", from:github
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", from:github,  defer:2
# zplug "aperezdc/virtualz"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Virtualenv
export WORKON_HOME=$DEV/.virtualenvs                                                                                                           

# Spaceship
SPACESHIP_KUBECONTEXT_SHOW=false

# Completion
zstyle ':completion:*' menu_complete select auto_list
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'  # ignore cases
setopt GLOB_COMPLETE   # wildcard globbing

# git completion
fpath=($CONFIG_HOME $fpath)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

### PyCharm
alias pycharm='nohup charm &> /dev/null &'

### CLion
alias clion='nohup clion &> /dev/null &'

### home and end key snafu
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
