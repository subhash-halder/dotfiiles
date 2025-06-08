#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/s0h0oz1/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
. "$HOME/.cargo/env"
source "/Users/s0h0oz1/.rover/env"
