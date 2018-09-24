# Aliases for convenience
alias a=". do-all"
alias ls="ls -p"
alias ll="ls -la"
alias saf="open -a Safari"
alias subl="open -a '/Applications/Sublime Text.app'"
alias serve="python -m SimpleHTTPServer"

# Case insensitive tab completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Delete word up to slash
stty werase undef
bind '\C-w:unix-filename-rubout'

# Bash aliases file
if [ -f ~/.dotfiles/bash_aliases ]; then
  . ~/.dotfiles/bash_aliases
fi

# Bind clear screen
bind -x '"\C-p": clear'

# Add scripts dir to path
export PATH=$PATH:~/.dotfiles/scripts

# Set default editor
export VISUAL=vim
export EDITOR="$VISUAL"

################################# Bash prompt ##################################

# The fancy bash prompt requires:
#   - Patched fonts
#   - Color terminal
# See the readme for more information

basic_prompt=true
if [ "$basic_prompt" = true ] ; then
  # Basic prompt
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    export PS1="\[$(tput setaf 2)\][\[$(tput setaf 7)\]\u\[$(tput setaf 2)\]:\[$(tput setaf 7)\]\W\[$(tput setaf 2)\]]$\[$(tput sgr0)\] "
  else
    export PS1="\[$(tput setaf 1)\][\[$(tput setaf 7)\]\u\[$(tput setaf 1)\]:\[$(tput setaf 7)\]\W\[$(tput setaf 1)\]]$\[$(tput sgr0)\] "
  fi

else
  # Fancy prompt
  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
  }
  curTime() {
    date +"%l:%M:%S%p" | awk '{print tolower($0)}'
  }
  # Usage: chClr bg fg
  chClr() {
    echo -e "\x01\033[48;5;${1};38;5;${2}m\x02"
  }
  in_git() {
    local dir=$PWD
    until [[ $dir == / ]]; do
      [[ -d "$dir/.git" ]] && return 0
      dir=$(dirname "$dir")
    done
    return 1
  }
  # These determine the color scheme, in order (first, second, third)
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    fClr="22"
    sClr="28"
    tClr="34"
  else
    fClr="19"
    sClr="21"
    tClr="27"
  fi
  arrow=$'\x01\xEE\x82\x02\xB0'
  branchicon=$'\x01\xEE\x82\x02\xA0'
  export PS1=$'$(chClr $fClr 231)$(curTime)$(chClr $sClr $fClr)█${arrow} $(chClr $sClr 231)\W $(in_git && echo -e $(chClr $tClr $sClr)${arrow} $(chClr $tClr 231)${branchicon} $(parse_git_branch) $(chClr 16 $tClr)${arrow} || echo -e $(chClr 16 $sClr)${arrow})\\033[0m '
fi

# Autocomplete ssh
_complete_ssh_hosts ()
{
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
            cut -f 1 -d ' ' | \
            sed -e s/,.*//g | \
            grep -v ^# | \
            uniq | \
            grep -v "\[" ;
        cat ~/.ssh/config | \
            grep "^Host " | \
            awk '{print $2}'
        `
    COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
    return 0
}
complete -F _complete_ssh_hosts ssh

# For nvm
n()
{
  export NVM_DIR="$HOME/.nvm"
  . "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm use stable &> /dev/null
}
