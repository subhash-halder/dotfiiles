#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# for better autocomplete start
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
# for better autocomplete end

alias ls='ls --color=auto'
alias vifm="$HOME/.config/vifm/scripts/vifmrun"
alias killCurrentBash="sudo kill -9 $(echo $$ | awk '{print $1}')"
shopt -s autocd
complete -cf sudo
# PS1='[\u@\h \W]\$ '

source ~/.zsh_profile

shwoGitBranch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="╭─\[\033[32m\]\u@\h \[\033[1;34m\]\w \[\033[31m\]\$(shwoGitBranch)\[\033[0;00m\] \n╰─➤ "
# export PS1="╭─\[$(tput setaf 2)\]\u@\h \[$(tput bold)\]\[$(tput setaf 4)\]\w \[$(tput setaf 1)\]\$(shwoGitBranch)\[$(tput sgr0)\] \n╰─➤ "

# vim key binding
set -o vi

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

. $HOME/.zsh_profile

if [ -f $HOME/.private_env ]; then
  . $HOME/.private_env
fi


if [ -f $HOME/.git-completion.bash ]; then
  . $HOME/.git-completion.bash
fi

# Use bash-completion, if available
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
# [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

if [ -d /opt/homebrew/opt/fzf/ ]; then
  source /opt/homebrew/opt/fzf/shell/completion.bash
  source /opt/homebrew/opt/fzf/shell/key-bindings.bash
fi

if [ -f /usr/bin/aws_bash_completer ]; then
  source /usr/bin/aws_bash_completer
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/subhash/google-cloud-sdk/path.bash.inc' ]; then . '/home/subhash/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/subhash/google-cloud-sdk/completion.bash.inc' ]; then . '/home/subhash/google-cloud-sdk/completion.bash.inc'; fi


eval "$(starship init bash)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/s0h0oz1/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
. "$HOME/.cargo/env"
source "/Users/s0h0oz1/.rover/env"
