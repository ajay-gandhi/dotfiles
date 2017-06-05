# Aliases for convenience
alias a=". do-all"
alias ls="ls"
alias ll="ls -la"
alias saf="open -a Safari"
alias subl="open -a '/Applications/Sublime Text.app'"
alias background="screen -d -m"

# Bash case insensitive tab completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Always start in tmux
#if command -v tmux>/dev/null; then
#  if [ -z "$TMUX" ]; then
#    tmux new-session -t default || tmux new-session -s default
#    return
#  fi
#fi

# Bind clear screen
bind -x '"\C-p": clear'

# Add scripts dir to path
export PATH=$PATH:~/.dotfiles/scripts

# Make prompts look cool :)
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export PS1="\[$(tput setaf 2)\][\[$(tput setaf 7)\]\u\[$(tput setaf 2)\]:\[$(tput setaf 7)\]\W\[$(tput setaf 2)\]]$\[$(tput sgr0)\] "
else
  export PS1="\[$(tput setaf 1)\][\[$(tput setaf 7)\]\u\[$(tput setaf 1)\]:\[$(tput setaf 7)\]\W\[$(tput setaf 1)\]]$\[$(tput sgr0)\] "
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
  export NVM_DIR="/Users/Ajay/.nvm"
  . "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm use stable &> /dev/null
}

