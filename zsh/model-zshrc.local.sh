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
