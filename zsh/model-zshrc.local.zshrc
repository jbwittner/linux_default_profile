# Alias spécifiques à cette machine
alias serve='python3 -m http.server'
alias docker-clean='docker system prune -af'

# Variables spécifiques à cette machine
export KUBECONFIG="$HOME/kubeconfig/config_cluster.yaml"
export NEXT_TELEMETRY_DISABLED=1
export GITHUB_TOKEN=""

# Fonction spécifique à cette machine
function my_custom_func() {
  echo "Fonction spécifique à cette machine"
}

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
