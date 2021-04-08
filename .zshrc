# Common Plugins
## source everything in the local dir
source $CONFIG_HOME/zplug/init.zsh
zplug "$ZSH_LOCAL_DIR/dotfiles", from:local
zplug "zsh-users/zsh-history-substring-search", from:github
zplug "zsh-users/zsh-completions", from:github
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", from:github,  defer:2
zplug "agkozak/zsh-z", from:github
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# local plugins
for f in `find $ZSH_LOCAL_DIR -name "*.plugin.zsh"`; do source $f; done;
source $CONFIG_HOME/zshtheme

# misc options
setopt autocd auto_remove_slash
setopt chase_links correct
setopt extendedglob glob_complete # wildcard globbing
setopt nomatch notify
unsetopt beep bg_nice clobber hist_beep list_beep rm_star_silent
print -Pn "\e]0; %n@%M: %~\a"   # terminal title

# completion 
autoload -Uz compinit
compinit # prompt and promptinit is done by the theme
kitty + complete setup zsh | source /dev/stdin
zmodload -i zsh/complist
setopt always_to_end complete_in_word list_ambiguous completealiases hash_list_all
zstyle ':completion::complete*:' gain-privileges 1
zstyle ':completion::complete*:' use-cache on
zstyle ':completion:*' cache-path ~/.config/zshcache
zstyle ':completion:*' menu select=2 # use a menu if more than 2 candidates exist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # colors
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'  # ignore cases
zstyle ':completion:*' completer _list _complete _history _expand _expand:-glob _ignored _correct _all_matches
zstyle ':completion::expand:*' tag-order expansions
zstyle ':completion:*:expand-glob:*' glob yes
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*:manuals' separate-sections true
zstyle :compinstall filename '~/.zshrc'

compdef _git dtf=git # completion for the dtf plugin
compdef _gnu_generic gcc
compdef _gnu_generic gdb

# Spaceship
SPACESHIP_KUBECONTEXT_SHOW=false

# keybindings
bindkey -v # vim style key binding


# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Pushd
setopt auto_pushd               # make cd push old dir in dir stack
setopt pushd_ignore_dups        # no duplicates in dir stack
setopt pushd_silent             # no dir stack after pushd or popd
setopt pushd_to_home            # `pushd` = `pushd $HOME`

# history
setopt append_history hist_ignore_all_dups hist_reduce_blanks share_history
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000

## history search 
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

### home and end key snafu
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line

# had to do this last, for some reason I was getting a non-zero exit code
spaceship::compose_prompt

