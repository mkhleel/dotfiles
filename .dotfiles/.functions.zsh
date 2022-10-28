function e() {
  if [ "$1" = "" ]
  then
    exec $EDITOR .
  else
    exec $EDITOR "$1"
  fi
}

# Switch projects
function p() {
  proj=$(ls ~/Sites | fzf --query="$1")
  if [[ -n "$proj" ]]; then
      cd ~/Sites/$proj
      clear
  fi
}

# all history
f() {
  eval $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# find file byname
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-code} "$file"
}


lemp() {
    echo "WSL LEMP: $1 Nginx, MySQL and PHP for Linux (LEMP)"
    sudo service nginx "$1"
    sudo service mysql "$1"
    sudo service php8.1-fpm "$1"
    echo "Done..."
}


# Extract most know archives with one command
extract () {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar e "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.lzma)      unlzma "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.xz)        unxz "$1"        ;;
      *.zip)       unzip "$1"       ;;  
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      exe)         cabextract "$1"  ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
