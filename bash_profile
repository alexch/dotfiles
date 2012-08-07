export JAVA_HOME=/Library/Java/Home
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/libexec:/usr/local/mysql/bin:$HOME/bin:$JAVA_HOME/bin:$PATH" 
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export TZ="America/Los_Angeles"
export EDITOR="mate -wl1"
export LESS="-RXfFi"
export GIT_EDITOR=vim
export INLINEDIR=~/.ruby_inline
export CACHE=~/.rvm/gems/cache
export TODO_FILE=~/docs/todo/todo.txt

# functions and aliases
source $HOME/Dropbox/dotfiles/functions.sh

# shell extensions
source "$HOME/bin/git_completion.sh"
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi
[ -f ~/.git-bash-completion.sh ] && . ~/.git-bash-completion.sh
unset HISTFILE

## Prompt

# Colors - see http://beckism.com/2009/02/better_bash_prompt/
export Normal='\[\e[0m\]'
export Bright='\[\e[1m\]'
export Red='\[\e[0;31m\]'
export Green='\[\e[0;32m\]'
export BrightGreen='\[\e[1;32m\]'

# git: show current branch in prompt
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\h:${Bright}\W${Normal} [${BrightGreen}\`which_ruby\`${Normal}]\`__git_ps1\` \u\$ "

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi
