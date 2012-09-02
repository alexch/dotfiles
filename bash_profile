# personal or OS-specific settings
export JAVA_HOME=/Library/Java/Home
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/libexec:/usr/local/mysql/bin:$HOME/bin:$JAVA_HOME/bin:$PATH"
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export TZ="America/Los_Angeles"
export CACHE=~/.rvm/gems/cache
export INLINEDIR=~/.ruby_inline
export TODO_FILE=~/docs/todo/todo.txt

# more general settings
export EDITOR="mate -wl1"
export LESS="-RXfFi"
export GIT_EDITOR=vim

# functions and aliases
source $HOME/dotfiles/functions.sh

# shell extensions
source "$HOME/dotfiles/git_completion.sh"

if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi
[ -f ~/.git-bash-completion.sh ] && . ~/.git-bash-completion.sh

# disable .bash_history
unset HISTFILE

source $HOME/dotfiles/prompt.sh

# load RVM
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi
rvm use default

