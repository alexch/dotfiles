## Prompt

# Colors - see http://beckism.com/2009/02/better_bash_prompt/
export Normal='\[\e[0m\]'
export Bright='\[\e[1m\]'
export Red='\[\e[0;31m\]'
export Green='\[\e[0;32m\]'
export BrightGreen='\[\e[1;32m\]'

# git: show current branch in prompt
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\h:${Bright}\W${Normal} [${BrightGreen}\`which_ruby\`${Normal}]\`__git_ps1\` \u\$ "
