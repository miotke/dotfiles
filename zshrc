# Function to get current git branch
function git_branch_name() {
  branch=$(git symbolic-ref HEAD 2>/dev/null | awk -F/ '{print $NF}')
  if [[ -n $branch ]]; then
    echo " %F{cyan}[$branch]%f"
  fi
}

# Configure prompt
setopt PROMPT_SUBST  # Enable prompt substitution
PROMPT='%F{187}[%*]%f$(git_branch_name) %F{green}%~%f: '

# Colors directories when using ls 
autoload -U colors && colors
export CLICOLOR=1
alias ls='ls --color=auto'

# Enable history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Bind up/down arrows to history search
bindkey "^[[A" up-line-or-beginning-search    # Up arrow
bindkey "^[[B" down-line-or-beginning-search  # Down arrow

# History settings 
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS  # Don't record duplicates
setopt HIST_FIND_NO_DUPS     # Don't show duplicates in search
setopt HIST_SAVE_NO_DUPS     # Don't write duplicate entries
setopt SHARE_HISTORY         # Share history between sessions

# Case-insensitive path completion (cached for speed)
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'


# Aliases
alias python='/opt/homebrew/bin/python3'
alias pip='pip3'
alias vim='nvim'
alias l='ls -la'
alias tf='terraform'
alias gam="/Users/andrewmiotke/bin/gamadv-xtd3/gam"
# Removes all git branches except master/main
alias prune='git branch | grep -v "master" | xargs git branch -D'

# PATH
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

