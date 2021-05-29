# Aliases for convenience
alias ls="ls -p"
alias ll="ls -la"
alias serve="python -m SimpleHTTPServer"

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

# Delete word up to slash
backward-kill-dir () {
  local WORDCHARS=${WORDCHARS/\/}
  zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# Bash aliases file
if [ -f ~/.dotfiles/aliases ]; then
  . ~/.dotfiles/aliases
fi

# Other commands file
if [ -f ~/.zsh_locals ]; then
  . ~/.zsh_locals
fi

# Bind clear screen
bindkey '^P' clear-screen

# Add scripts dir to path
export PATH=$PATH:~/.dotfiles/scripts

# Set default editor
export VISUAL=vim
export EDITOR="$VISUAL"

################################# Bash prompt ##################################

SHADE1="%F{83}"
SHADE2="%F{120}"
SHADE3="%F{157}"
RESET="%f"

show_git_branch() {
  git symbolic-ref --short HEAD 2>/dev/null | sed -e 's/^/ ᚶ[/;' | sed -e 's/$/]/;'
}

show_ssh_host() {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    hostname | sed -e 's/$/:/;'
  fi
}

show_cur_time() {
  date +"%I:%M:%S%p" | awk '{print tolower($0)}'
}

setopt prompt_subst
PROMPT='${SHADE1}◷[$(show_cur_time)] ${SHADE2}[$(show_ssh_host)%1~]${SHADE3}$(show_git_branch)$RESET> '

# Autocomplete ssh
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# For nvm
n() {
  export NVM_DIR="$HOME/.nvm"
  . "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm use stable &> /dev/null
}
