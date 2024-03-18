#!/bin/bash

# Vérifie si le dossier contenant le fichier settings.json existe
if [ ! -d "$HOME/.config/Code/User" ]; then
  echo "[ERROR] Le dossier .config/Code/User n'existe pas. Veuillez vérifier votre installation de Visual Studio Code."
else
  # Vérifie si le fichier settings.json existe et s'il est un lien symbolique
  if [ -L "$HOME/.config/Code/User/settings.json" ] && [ "$(readlink $HOME/.config/Code/User/settings.json)" = "$HOME/.configenv/vscode/settings.json" ]; then
    echo "[INFO] Le lien symbolique pour le fichier settings.json de Visual Studio Code est déjà configuré."
  else
    # Supprime le fichier settings.json s'il existe et n'est pas un lien symbolique
    if [ -f "$HOME/.config/Code/User/settings.json" ]; then
      echo "[WARN] Le fichier settings.json existe déjà mais n'est pas un lien symbolique. Il sera supprimé."
      rm "$HOME/.config/Code/User/settings.json"
    fi

    # Crée un lien symbolique vers le fichier de configuration
    echo "[INFO] Création du lien symbolique pour le fichier settings.json de Visual Studio Code."
    ln -s "$HOME/.configenv/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
  fi
  # Ajoutez ici d'autres opérations à effectuer après la gestion du lien symbolique
fi

# Ici, vous pouvez continuer avec d'autres commandes ou vérifications qui doivent être exécutées
# indépendamment de l'existence du dossier .config/Code/User
