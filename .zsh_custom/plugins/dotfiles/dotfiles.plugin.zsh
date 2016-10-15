function dtf {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

function dtf-checkout {
  dtf checkout
  if [ $? = 0 ]; then
    echo "checked out dotfiles";
    else
      echo "Backing up existing dotfiles";
      mkdir -p $HOME/.doftiles_backup
      dtf checkout 2>&1 | egrep "s+\." | awk{'print $1'} | xargs -I{} mv {} $HOME/.dotfiles_backup/{}
  fi;
  dtf checkout
}

alias dtf-add="dtf add -f"
