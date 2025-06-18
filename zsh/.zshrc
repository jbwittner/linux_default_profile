# Path vers Oh-My-Zsh
export ZSH="$HOME/.oh-my-zsh"

# Thème utilisé par Zsh
ZSH_THEME="robbyrussell"

# Variable boolean pour activer ou désactiver des features
USE_PODMAN=false

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

# Configuration de l'éditeur de texte
export EDITOR=micro
export VISUAL=micro

# Alias personnalisés
alias cdworkspace='cd $HOME/workspace'
alias lzd='lazydocker'
alias lzg='lazygit'

# Si on utilise Podman, on configure les alias et variables d'environnement
if [ "$USE_PODMAN" = true ]; then
  alias docker=podman
  alias docker-compose=podman-compose
fi

# Chargement du fichier local spécifique à la machine
source "$HOME/.configenv/zsh/.local.zshrc"

if [ -f "$HOME/.configenv/zsh/zsh_functions.sh" ]; then
  source $HOME/.configenv/zsh/zsh_functions.sh
fi

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/jbwittner/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
