# Common Plugins
## source everything in the local dir
for f in `find $ZSH_LOCAL_DIR -name "*.plugin.zsh"`; do source $f; done;
zplug "$ZSH_LOCAL_DIR/dotfiles", from:local
zplug "zsh-users/zsh-history-substring-search", from:github
zplug "zsh-users/zsh-completions", from:github
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", from:github,  defer:2
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# misc options
setopt autocd auto_remove_slash
setopt chase_links correct
setopt extendedglob glob_complete # wildcard globbing
setopt nomatch notify print_exit_value 
unsetopt beep bg_nice clobber hist_beep list_beep rm_star_silent
print -Pn "\e]0; %n@%M: %~\a"   # terminal title

# completion 
autoload -Uz compinit
compinit # prompt is done by the theme
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

# Pushd
setopt auto_pushd               # make cd push old dir in dir stack
setopt pushd_ignore_dups        # no duplicates in dir stack
setopt pushd_silent             # no dir stack after pushd or popd
setopt pushd_to_home            # `pushd` = `pushd $HOME`

# history
setopt append_history hist_ignore_all_dups hist_reduce_blanks share_history
HISTFILE=~/.history
HISTSIZE=100
SAVEHIST=100
## history search 
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "$key[Up]" ]] && bindkey -- "$key[Up]" up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

### home and end key snafu
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line

# had to do this last, for some reason I was getting a non-zero exit code
spaceship::compose_prompt
