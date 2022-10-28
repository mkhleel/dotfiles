
# Always sets the tab title to current dir (requires DISABLE_AUTO_TITLE enabled in oh-my-zsh)
precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'


