# Imports and env vars
export DEV=$HOME/devel
export D=$HOME/devel
export CONFIG_HOME=$HOME/.config
export ZSH_LOCAL_DIR=$CONFIG_HOME/zsh_local
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/bzs/.mujoco/mujoco200/bin
export PATH=$ZSH_LOCAL_DIR/bin:$PATH
[[ -n `which kitty` ]] && export TERMINAL=`which kitty` # for i3-sensible-terminal

# Virtualenv
export WORKON_HOME=$DEV/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
source /usr/bin/virtualenvwrapper_lazy.sh
# export MANPAGER=most

# Load Order    Interactive  Interactive  Script
  # Startup       Only login   Always
  # ------------- -----------  -----------  ------
  #  /etc/zshenv       1            1         1
  #    ~/.zshenv       2            2         2
  # /etc/zprofile      3
  #   ~/.zprofile      4
  # /etc/zshrc         5            3
  #   ~/.zshrc         6            4
  # /etc/zlogin        7
  #   ~/.zlogin        8
  #
  # Shutdown
  # ------------- -----------  -----------  ------
  #   ~/.zlogout       9
  # /etc/zlogout      10
  #
  # Note: ZSH seems to read ~/.profile as well, if ~/.zshrc is not present.

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
alias reload='exec zsh -l'
alias -s {cpp,hpp,c,h,cc,md,MD,txt,csv,json,yaml,yml}=$EDITOR
alias -s git="git clone"

# theme
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0" 
export BROWSER=/usr/bin/firefox

# Colors
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

# Less colors for man pages
export PAGER=less
# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green
