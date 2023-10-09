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
