# Path vers Oh-My-Zsh
export ZSH="$HOME/.oh-my-zsh"

# Thème utilisé par Zsh
ZSH_THEME="robbyrussell"

# Plugins pour Oh-My-Zsh
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

# Chargement d'Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Ajout de chemins supplémentaires au PATH
export PATH="$HOME/.local/bin:/usr/local/texlive/2024/bin/x86_64-linux:$PATH"

# Alias personnalisés
alias cdworkspace='cd $HOME/workspace'
alias lzd='lazydocker'
alias lzg='lazygit'

# Chargement du fichier local spécifique à la machine
source "$HOME/.configenv/zsh/.local.zshrc"

if [ -f "$HOME/.configenv/zsh/zsh_functions.sh" ]; then
  source $HOME/.configenv/zsh/zsh_functions.sh
fi

# Configuration SDKMAN (doit être à la fin du fichier pour fonctionner correctement)
export SDKMAN_DIR="$HOME/.sdkman"
if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# Configuration PNPM
export PNPM_HOME="$HOME/.local/share/pnpm"
if [[ ":$PATH:" != *":$PNPM_HOME:"* ]]; then
  export PATH="$PNPM_HOME:$PATH"
fi

# Configuration NVM
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  source "$NVM_DIR/nvm.sh" # Charge NVM
fi

if [ -s "$NVM_DIR/bash_completion" ]; then
  source "$NVM_DIR/bash_completion" # Charge NVM Bash completion
fi

