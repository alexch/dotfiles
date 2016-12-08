[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# personal or OS-specific settings
export JAVA_HOME=/Library/Java/Home
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/libexec:/usr/local/mysql/bin:$HOME/bin:$JAVA_HOME/bin:$PATH"
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export TZ="America/New_York"

# Rubyland
export CACHE=~/.rvm/gems/cache
export INLINEDIR=~/.ruby_inline

# more general settings
export EDITOR="mate -wl1"
export LESS="-RXfFin"
export GIT_EDITOR=vim

dotfiles="$HOME/Dropbox/dotfiles"

# functions and aliases
source "$dotfiles/functions.sh"

# shell extensions

# do this first: brew install bash-completion; brew tap homebrew/completions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
source "$dotfiles/git_completion.sh"

# turn "git foo" git alias into "gfoo" shell alias, a la https://gist.github.com/mwhite/6887990
function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}
for al in `__git_aliases`; do
    alias g$al="git $al"

    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done

# more secure or just more annoying? i dunno
# disable .bash_history
# unset HISTFILE

ssh-add

source "$dotfiles/prompt.sh"

# Load RVM
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi
rvm use default
