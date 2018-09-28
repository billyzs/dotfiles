# Imports and env vars
export DEV=$HOME/devel
export CONFIG_HOME=$HOME/.config
source $CONFIG_HOME/zplug/init.zsh
export ZSH_LOCAL_DIR=$CONFIG_HOME/zsh_local
[[ -n `which kitty` ]] && export TERMINAL=`which kitty` # for i3-sensible-terminal

# Virtualenv
export WORKON_HOME=$DEV/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
source /usr/bin/virtualenvwrapper_lazy.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# aliases
alias ll='ls -ahltrBF --group-directories-first --color=auto --block-size=MB'
alias clc=clear
alias quit=exit

