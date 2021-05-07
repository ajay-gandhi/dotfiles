# Aliases for convenience
alias ls="ls -p"
alias ll="ls -la"
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

# Other commands file
if [ -f ~/.bash_locals ]; then
  . ~/.bash_locals
fi

# Bind clear screen
bind -x '"\C-p": clear'

# Add scripts dir to path
export PATH=$PATH:~/.dotfiles/scripts

# Set default editor
export VISUAL=vim
export EDITOR="$VISUAL"

################################# Bash prompt ##################################

parse_git_branch() {
  git branch 2>/dev/null | grep '^*' | colrm 1 2
}
curTime() {
  date +"%I:%M:%S%p" | awk '{print tolower($0)}'
}
# Usage: chClr fgColor
chClr() {
  echo -e "\x01$(tput setaf $1)\x02"
}
in_git() {
  local dir=$PWD
  until [[ $dir == / ]]; do
    [[ -d "$dir/.git" ]] && return 0
    dir=$(dirname "$dir")
  done
  return 1
}
# These determine the color scheme for in ssh and not in ssh
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  clr="2"
else
  clr="1"
fi
export PS1='$(chClr $clr)[$(chClr 7)$(curTime)$(chClr $clr) in $(chClr 7)\W$(in_git && echo -e $(chClr $clr) on $(chClr 7)$(parse_git_branch)$(chClr $clr)]$ || echo -e $(chClr $clr)]$)$(chClr 7) '

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
n() {
  export NVM_DIR="$HOME/.nvm"
  . "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm use stable &> /dev/null
}
