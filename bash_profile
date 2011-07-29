export JAVA_HOME=/Library/Java/Home
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/libexec:/usr/local/mysql/bin:$HOME/bin:$JAVA_HOME/bin:$PATH" 
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export TZ="America/Los_Angeles"
export EDITOR="mate -wl1"
export LESS="-RXfFi"
export SVN=https://svn.pivotallabs.com/subversion
export GIT_EDITOR=vim
export INLINEDIR=~/.ruby_inline
export CACHE=~/.rvm/gems/cache
export TODO_FILE=~/docs/todo/todo.txt

# See http://beckism.com/2009/02/better_bash_prompt/
export Normal='\[\e[0m\]'
export Bright='\[\e[1m\]'
export Red='\[\e[0;31m\]'
export Green='\[\e[0;32m\]'
export BrightGreen='\[\e[1;32m\]'

source "$HOME/bin/git_completion.sh"

# git: show current branch in prompt
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
GIT_PS1_SHOWDIRTYSTATE=true

export PS1="\h:${Bright}\W${Normal} [${BrightGreen}\`which_ruby\`${Normal}]\`__git_ps1\` \u\$ "

alias ls='gls --color=tty'
alias cd..='cd ..'
alias clojure='java -cp clojure.jar clojure.main'
alias diff='diff -ub'
alias reload='. ~/.bash_profile && rvm reload' 
alias get="curl -fsSLk"
alias rake="bundle exec rake"
alias rspec="bundle exec rspec"
alias push="git push && git push heroku"

# see also http://offbytwo.com/2011/06/26/things-you-didnt-know-about-xargs.html
function fx {
  dir=.
  pattern=$*
  find "$dir" -type f -print0 | xargs -0 grep $pattern
}

function drop {
    active=$HOME/.bash_profile
    archive=$HOME/Dropbox/dotfiles/bash_profile
    from_file=$active
    to_file=$archive
    diff -ub $to_file $from_file
    echo "Copying $from_file to $to_file"
    read -p "Are you sure? " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      cp "$from_file" "$to_file"
    fi
}

function . {
    if [ "" = "$1" ]
        then
        source ~/.bash_profile
    else
        source "$1"
    fi
}

function which_ruby {
	echo $GEM_HOME | sed -e 's/.*\///'
}

function whats-on-port {
  lsof -i TCP:$1
}

if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi
[ -f ~/.git-bash-completion.sh ] && . ~/.git-bash-completion.sh
unset HISTFILE

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi
rvm use 1.9.2
