# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="sunaku"

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

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

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

# Case-insensitive path completion 
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'


# User configuration
#
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias python='python3'
alias pip='pip3'
alias prune='git branch | grep -v "master" | xargs git branch -D'
alias vim='nvim'
# Removes all git branches except the master/main branch
alias prune="git branch | grep -v "master" | xargs git branch -D"
alias l='ls -la'
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
alias gam="/Users/andrewmiotke/bin/gamadv-xtd3/gam"
