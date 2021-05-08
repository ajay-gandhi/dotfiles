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

show_git_branch() {
  git symbolic-ref --short HEAD 2>/dev/null | sed -e 's/^/ ᚶ/;'
}
show_ssh_host() {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    hostname | sed -e 's/$/:/;'
  fi
}
curTime() {
  date +"%I:%M:%S%p" | awk '{print tolower($0)}'
}
SHADE1="\[\033[38;5;83m\]"
SHADE2="\[\033[38;5;120m\]"
SHADE3="\[\033[38;5;157m\]"
RESET="\[$(tput sgr0)\]"
PS1="$SHADE1$(show_ssh_host)\w$SHADE2 ◷\$(curTime)$SHADE3\$(show_git_branch)$RESET\n$ "

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
