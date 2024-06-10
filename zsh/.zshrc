export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

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

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.local/bin:$PATH"

alias cdworkspace='cd $HOME/workspace'

# bat
alias cat='batcat --style="header" --paging=never'
alias catn='batcat --pager "less -RF"'
alias batn='batcat --pager "less -RF"'

# exa
alias ls="exa -a"                   # short, multi-line
alias ll="exa -1a"                  # list, 1 per line
alias ld="ll"                       # ^^^, NOTE: Trying to move to this for alternate hand commands
alias la="exa -lagh"                # list with info
alias lt="exa -a --tree --level=2"  # list with tree level 2
alias ltf="exa -a --tree"           # list with tree
alias lat="exa -lagh --tree"        # list with info and tree

source $HOME/.configenv/zsh/env-vars.sh
source $HOME/.configenv/zsh/zsh_functions.sh

alias lzd='lazydocker'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH
# pnpm
export PNPM_HOME="/home/jbwittner/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export RAIDRUNNER_BLIZZARD_CLIENT_ID="1029e791f4bb4a5ba1cbd230ce0dd5a1"
export RAIDRUNNER_BLIZZARD_SECRET_ID="tpa4CDrjTHQlp8DYWXR0zHrqup58yg9g"
