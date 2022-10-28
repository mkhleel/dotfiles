# SHELL
alias ll='ls -GFhl --color=tty'
alias lsa='ls -GFhla --color=tty'
alias c='clear'

alias i='sudo apt-get install --yes'

# set PHP
alias setphp81='sudo update-alternatives --set php /usr/bin/php8.1'
alias setphp74='sudo update-alternatives --set php /usr/bin/php7.4'

# Quick Open
alias aliases='code ~/.zsh_aliases'
alias zshfile='code ~/.zshrc'
alias hosts='sudo vi /etc/hosts'


# LARAVEL
alias pa="APP_ENV=local php artisan"
alias tartisan="APP_ENV=testing php artisan"
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'



# GIT
alias gs='git status -s'
alias ga='git add'

alias gbr='git branch'
alias gbf='git branch | cut -c3- | fzf | xargs git checkout'
alias gcl='git clone'
alias gco='git checkout'

alias gd='git diff --color $@'
alias gdc='git diff --cached --color $@'
alias gdm='git diff master..HEAD'

alias gci='git commit'
alias gme='git merge'
alias grb='git rebase'
alias grbm='git fetch && git rebase origin/master'

alias gls='git ls'
alias gld='git ld'

alias gsh='git show'

alias gwtf='git wtf'
alias gwtfa="git branch | sed 's/^..//' | grep '^\d' | xargs git wtf"

alias gh='git gh'
alias up='git up'


# open vim with mouse support
alias vm='vim "+set mouse=a"'


