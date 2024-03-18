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

# fd
alias locate="fdfind"
alias find="fdfind"

source $HOME/.configenv/zsh/env-vars.sh
source $HOME/.configenv/zsh/zsh_functions.sh

alias lzd='lazydocker'
