docker_container_stop() {
    if [ $(docker ps -q | wc -l) -gt 0 ]; then
        docker stop $(docker ps -aq)
        echo "All running Docker containers have been stopped"
    else
        echo "No running Docker containers found."
    fi
}

docker_container_clean() {
    docker_container_stop
    if [ $(docker ps -aq | wc -l) -gt 0 ]; then
        docker rm $(docker ps -aq)
        echo "All Docker containers have been removed."
    else
        echo "No Docker containers found."
    fi
}

docker_volume_clean() {
    if [ $(docker volume ls -q | wc -l) -gt 0 ]; then
        docker volume rm $(docker volume ls -q)
        echo "All Docker volumes have been removed."
    else
        echo "No Docker volumes found."
    fi
}

docker_network_clean() {
    if [ $(docker network ls --filter type=custom -q | wc -l) -gt 0 ]; then
        docker network rm $(docker network ls --filter type=custom -q)
        echo "All custom Docker networks have been removed."
    else
        echo "No custom Docker networks found."
    fi
}

docker_images_clean() {
    if [ $(docker images -q | wc -l) -gt 0 ]; then
        docker rmi -f $(docker images -q)
        echo "All Docker images have been removed."
    else
        echo "No Docker images found."
    fi
}

docker_system_clean() {
    docker_container_clean
    docker_volume_clean
    docker_network_clean
    echo "All Docker system resources (not images) have been cleaned."
}

docker_system_clean_and_images(){
    docker_container_clean
    docker_volume_clean
    docker_network_clean
    docker_images_clean
    echo "All Docker system resources (and images) have been cleaned."
}

docker_live_stats() {
    docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}"
}

edit() {
    xdg-open "$1"
}

docker_ps() {
    docker ps -a --format "ID: {{.ID}}\nName: {{.Names}}\nImage: {{.Image}}\nCreated: {{.CreatedAt}}\nState: {{.State}} ({{.Status}})\nPorts: {{.Ports}}\nCommand: {{.Command}}\n"
}

extract() {
    if [ -f "$1" ] ; then
        local filename=$(basename -- "$1")
        local foldername="${filename%.*}"
        mkdir -p "$foldername"
        case "$1" in
            *.tar.bz2)   tar xvjf "$1" -C "$foldername"     ;;
            *.tar.gz)    tar xvzf "$1" -C "$foldername"     ;;
            *.bz2)       bunzip2 "$1" -c > "$foldername/${filename%.bz2}"      ;;
            *.rar)       unrar x "$1" "$foldername"     ;;
            *.gz)        gunzip -c "$1" > "$foldername/${filename%.gz}"       ;;
            *.tar)       tar xvf "$1" -C "$foldername"      ;;
            *.tbz2)      tar xvjf "$1" -C "$foldername"     ;;
            *.tgz)       tar xvzf "$1" -C "$foldername"     ;;
            *.zip)       unzip "$1" -d "$foldername"        ;;
            *.Z)         uncompress "$1"   ;;
            *.7z)        7z x "$1" -o"$foldername"         ;;
            *)           echo "format de fichier inconnu" ;;
        esac
    else
        echo "$1 n'est pas un fichier valide"
    fi
}

clear_history() {
    if [ -n "$BASH_VERSION" ]; then
        history -c
        history -w
    elif [ -n "$ZSH_VERSION" ]; then
        history -c
        fc -R
    fi
}

majSysteme() {
  sudo apt update && sudo apt upgrade -y
  echo "Mise à jour terminée."
}

# Fonction pour charger les variables d'un fichier .env dans le shell actuel
loadenv() {
    # Définit le fichier par défaut à .env
    local env_file="${1:-.env}"

    # Vérifie si le fichier existe
    if [[ ! -f "$env_file" ]]; then
        echo "Erreur : Le fichier '$env_file' n'existe pas."
        return 1
    fi

    # Lit le fichier ligne par ligne et exporte les variables
    while IFS='=' read -r key value || [[ -n "$key" ]]; do
        # Ignore les commentaires et les lignes vides
        if [[ "$key" =~ ^#.*$ || -z "$key" ]]; then
            continue
        fi

        # Supprime les guillemets autour de la valeur (si présents)
        value="${value%\"}"
        value="${value#\"}"

        export "$key=$value"
    done < "$env_file"

    echo "Variables chargées depuis '$env_file'."
}

# Fonction qui demande à l'utilisateur une string et retourne la valeur en base 64
encode_base64() {
    local input_string
    local encoded_string

    # Zsh syntax for prompting the user with 'read': read "variable?Prompt"
    read "input_string?Enter the string to encode in base64: "

    # The rest of the function is compatible with both Bash and Zsh.
    if [[ -z "$input_string" ]]; then
        echo "Error: No string provided. Operation cancelled." >&2
        return 1
    fi

    encoded_string=$(printf %s "$input_string" | base64)
    
    echo "Base64 encoded string: $encoded_string"
}