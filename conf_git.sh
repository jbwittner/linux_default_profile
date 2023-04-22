#!/bin/bash

# Vérifie si le fichier .gitconfig existe et s'il est un lien symbolique vers le fichier de configuration Git
if [ -L "$HOME/.gitconfig" ] && [ "$(readlink $HOME/.gitconfig)" = "$HOME/.configenv/git/.gitconfig" ]; then
  echo "[INFO] Le lien symbolique pour le fichier .gitconfig de Git est déjà configuré."
else
  # Supprime le fichier .gitconfig s'il existe
  if [ -f "$HOME/.gitconfig" ]; then
    echo "[WARN] Le fichier .gitconfig existe déjà dans le répertoire personnel mais n'est pas un lien symbolique. Il sera supprimé."
    rm "$HOME/.gitconfig"
  fi

  # Crée un lien symbolique vers le fichier de configuration Git
  echo "[INFO] Création du lien symbolique pour le fichier .gitconfig de Git."
  ln -s "$HOME/.configenv/git/.gitconfig" "$HOME/.gitconfig"
fi
