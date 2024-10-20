#!/bin/bash

# Vérifie si le fichier config.yml de lazygit est un lien symbolique vers le fichier de configuration dans .configenv
if [ -L "$HOME/.config/lazygit/config.yml" ] && [ "$(readlink $HOME/.config/lazygit/config.yml)" = "$HOME/.configenv/lazygit/config.yml" ]; then
  echo "[INFO] Le lien symbolique pour le fichier config.yml de lazygit est déjà configuré."
else
  # Supprime le fichier config.yml s'il existe
  if [ -f "$HOME/.config/lazygit/config.yml" ]; then
    echo "[WARN] Le fichier config.yml existe déjà dans le répertoire ~/.config/lazygit mais n'est pas un lien symbolique. Il sera supprimé."
    rm "$HOME/.config/lazygit/config.yml"
  fi

  # Crée un lien symbolique vers le fichier de configuration lazygit
  echo "[INFO] Création du lien symbolique pour le fichier config.yml de lazygit."
  ln -s "$HOME/.configenv/lazygit/config.yml" "$HOME/.config/lazygit/config.yml"
fi
