# aliases for existing commands
alias ls='ls -Gp'  # http://apple.stackexchange.com/a/33678
alias cd..='cd ..'
alias diff='diff -ub'
alias be="bundle exec"
alias rake="bundle exec rake"    # if this messes up, do `unalias rake` and try again
alias rspec="bundle exec rspec"
alias spork="bundle exec spork"
alias guard="bundle exec guard"
# alias locate=mdfind  # on Mac OS X only -- mdfind is command-line Spotlight search
alias ss="spring stop"
alias r="bin/rails"

# git aliases
alias get="curl -fsSLk"
alias p="git pull"
alias s="git status"
alias pp="git pull && git push origin HEAD"
alias push="git push origin HEAD"
alias d="(echo '=== Staged changes: ===' && git diff --staged --color=always && echo '' && echo '=== Unstaged changes: ===' && git diff --color=always) | less"
alias l="git log --graph --pretty='%Cred%h %Cgreen%ad%Creset%x09%s%x09%Creset%C(bold)%d %an' --date=short"

# functions (and function-like aliases)
alias run="(bundle check || bundle install) && (bin/run || bundle exec rake run)"
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
	# echo $GEM_HOME | sed -e 's/.*\///'
	ruby --version | cut -f 1-2 -d ' '
}

function whats-on-port {
  lsof -i TCP:$1
}

function thisBranch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}


function blam() {
  git push origin $(thisBranch)
}

function kablam() {
  git push -f origin $(thisBranch)
}
function dash {
  ruby -e "puts gets.chomp.downcase.gsub(/\s+/,'-').gsub(/[^\w-]/, '')"
}

function b() {
  token=`cat $HOME/.tracker`
  story_id=$1
  curl --silent -X GET -H "X-TrackerToken: $token" "https://www.pivotaltracker.com/services/v5/stories/${story_id}" | \
    ruby -rjson -e "story=JSON.parse(STDIN.read); \
    puts story['story_type'] + '/' + story['name'].chomp.downcase.gsub(/[\s\.]+/,'-').gsub(/[^\w-]/, '') + '-${story_id}'"
}
