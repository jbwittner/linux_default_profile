#!/bin/bash

# Vérifie si le fichier settings.json existe et s'il est un lien symbolique vers le fichier de configuration de Visual Studio Code
if [ -L "$HOME/.config/Code/User/settings.json" ] && [ "$(readlink $HOME/.config/Code/User/settings.json)" = "$HOME/.configenv/vscode/settings.json" ]; then
  echo "[INFO] Le lien symbolique pour le fichier settings.json de Visual Studio Code est déjà configuré."
else
  # Supprime le fichier settings.json s'il existe
  if [ -f "$HOME/.config/Code/User/settings.json" ]; then
    echo "[WARN] Le fichier settings.json existe déjà dans le répertoire .config/Code/User mais n'est pas un lien symbolique. Il sera supprimé."
    rm "$HOME/.config/Code/User/settings.json"
  fi

  # Crée un lien symbolique vers le fichier de configuration de Visual Studio Code
  echo "[INFO] Création du lien symbolique pour le fichier settings.json de Visual Studio Code."
  ln -s "$HOME/.configenv/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
fi
