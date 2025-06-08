# To chaeck what is making zsh slow uncomment this line and the last line which contain zprof
# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# disable omz auto update as it slow in certain network
# zstyle ':omz:update' mode disabled

source ~/.zsh_profile

if [ -f ~/.zsh_private ]; then
  source ~/.zsh_private
fi

# Path to your oh-my-zsh installation.
# export ZSH=~/.oh-my-zsh

# configure starship
eval "$(starship init zsh)"


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="gnzh"
# ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_MODE="nerdfont-complete"
# POWERLEVEL9K_DISABLE_RPROMPT=true
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
# export NVIM_NODE_HOST_DEBUG=true
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#   git vi-mode
# )

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# its required for tmux

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# set -o vi
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

alias k="kubectl"
alias kgp="kubectl get pods"
alias kl="kubectl logs"
alias klf="kubectl logs -f"
alias keti="kubectl exec -ti"
alias kns="kubectl config set-context --current --namespace"
alias lg="lazygit"
alias glo="git log --oneline"



alias kvim="NVIM_APPNAME=kickstarter nvim"

alias personal="tmuxifier load-session personal"

if [ -f ~/.zsh_path ]; then
    . ~/.zsh_path
fi

# ----- Bat (better cat) -----
export BAT_THEME=Dracula


# automatic run tmux if install as using simple terminal which doesnot support scroll and copy
# if command -v tmux>/dev/null; then
#   [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
# fi
#
# FZF keybinding and completion

if [ -d /opt/homebrew/opt/fzf/shell/ ]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

alias ls="eza --color=always --long --git --icons=always"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
export PATH="/Users/s0h0oz1/.rover/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/s0h0oz1/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
#sledge:binary path
export SLEDGE_BIN=/Users/s0h0oz1/.sledge/bin
export PATH="${PATH}:${SLEDGE_BIN}"
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.config/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey '^N' menu-select
# bindkey '^J' history-incremental-search-backward
# bindkey '^K' history-incremental-search-forward
bindkey -M menuselect 'j' menu-complete
bindkey -M menuselect "k" reverse-menu-complete
bindkey -M menuselect '^I' menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect "^H" backward-delete-char
bindkey -M vicmd "j" down-history
bindkey -M vicmd "k" up-history
# zprof
