export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gnzh"

plugins=(
  common-aliases
  gh
  git
  git-flow
  git-prompt
  sdk
  zsh-autosuggestions
  zsh-syntax-highlighting
)

alias cdworkspace='cd $HOME/workspace'
alias pn=pnpm

source $ZSH/oh-my-zsh.sh

source $HOME/.configenv/zsh/env-vars.sh
source $HOME/.configenv/zsh/functions.sh
source $HOME/.configenv/zsh/functions.sh-completion
source $HOME/.configenv/zsh/_gh

export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/snapd/desktop/"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#Go
PATH=$PATH:/usr/local/go/bin
#Go

autoload -U compinit
compinit -i

#eval "$(ssh-agent -s)" >/dev/null
#ssh-add 2>/dev/null

if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `cat $HOME/.ssh/ssh-agent`
   ssh-add
fi

emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'
