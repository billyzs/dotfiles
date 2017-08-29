# Imports and env vars
export TERM="xterm-256color"
export DEV=$HOME/devel
export CONFIG_HOME=$HOME/.config
source $CONFIG_HOME/zplug/init.zsh
export ZSH_LOCAL_DIR=$CONFIG_HOME/zsh_local

if [ -d $ZSH_LOCAL_DIR ]; then
    for dir in $ZSH_LOCAL_DIR; do 
        if [ -d $dir ]; then
            for file in $dir; do
                source $file
            done
        fi
    done
fi
source $ZSH_LOCAL_DIR/irobot-zsh/iRobot.plugin.zsh

# Common Plugins
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
# zplug "aperezdc/virtualz"

source $CONFIG_HOME/dotfiles.zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Virtualenv
export WORKON_HOME=$DEV/.virtualenvs                                                                                                           

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}'

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

