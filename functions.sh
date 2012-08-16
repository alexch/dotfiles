# aliases for existing commands
alias ls='gls --color=tty'
alias cd..='cd ..'
alias diff='diff -ub'
alias rake="bundle exec rake"
alias rspec="bundle exec rspec"
alias guard="bundle exec guard"

# functions (and function-like aliases)
alias get="curl -fsSLk"
alias p="git pull origin master && git push origin master"
alias push="git push && git push heroku"
alias s="git status"
alias d="(echo '=== Staged changes: ===' && git diff --staged --color=always && echo '' && echo '=== Unstaged changes: ===' && git diff --color=always) | less"
alias l="git log --graph --pretty='%Cred%h %Cgreen%ad%Creset%x09%s%x09%Creset%C(bold)%d %an' --date=short --no-merges"
alias r="rake run"
# rw = random word
alias rw="ruby -e 'a=File.read(\"/usr/share/dict/words\").split; puts a[rand(a.length)];'"
alias clojure='java -cp clojure.jar clojure.main'
alias h="history"

# see also http://offbytwo.com/2011/06/26/things-you-didnt-know-about-xargs.html
function fx {
  dir=.
  pattern=$*
  find "$dir" -type f -print0 | xargs -0 grep $pattern
}

function drop {
    pwd | grep "dev" && dest="$HOME/Dropbox/dev" || dest="$HOME/Dropbox/docs"

    for x in $*; do
      echo "Moving $x to $dest"
      mv -n $x $dest || exit
      echo "Linking $dest/$x"
      ln -s "$dest/$x" .
    done
}

function dot {
    active=$HOME/.bash_profile
    archive=$HOME/Dropbox/dotfiles/bash_profile


    if [ "save" = "$1" ]; then
      action="Saving"
      from_file=$active
      to_file=$archive
    elif [ "load" = "$1" ]; then
      action="Loading"
      from_file=$archive
      to_file=$active
    else
      action="Comparing"
      from_file=$archive
      to_file=$active
    fi

    diff -ub $to_file $from_file | less -E

    if  [ "$1" == "save"  ] || [ "$1" == "load" ]; then
      echo
      echo "$action $from_file to $to_file"
      read -p "Are you sure? " -n 1
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]
      then
        cp "$from_file" "$to_file"
        echo "Copied $from_file to $to_file"
        echo "Re-sourcing"
        .
      fi
    else
      echo
      echo "Run 'dot save' or 'dot load' to copy .bash_profile into or out of Dropbox"
    fi
}

function . {
    if [ "" = "$1" ]; then
        rvm reload
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

