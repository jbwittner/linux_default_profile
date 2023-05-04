#!/bin/bash

# Configuration des dossiers de configuration d'IntelliJ IDEA
directories=("codestyles" "colors" "templates" "keymaps" "fileTemplates" "options" "inspection" "tools" "tasks" "dictionary" "shelf")

for dir in "${directories[@]}"; do
  # Vérifie si le dossier existe et s'il est un lien symbolique vers le dossier de configuration d'IntelliJ IDEA
  if [ -L "$HOME/.config/JetBrains/IntelliJIdea2023.1/$dir" ] && [ "$(readlink $HOME/.config/JetBrains/IntelliJIdea2023.1/$dir)" = "$HOME/.configenv/JetBrains/$dir" ]; then
    echo "[INFO] Le lien symbolique pour le dossier $dir d'IntelliJ IDEA est déjà configuré."
  else
    # Supprime le dossier s'il existe
    if [ -d "$HOME/.config/JetBrains/IntelliJIdea2023.1/$dir" ]; then
      echo "[WARN] Le dossier $dir existe déjà dans le répertoire .config/JetBrains/IntelliJIdea2023.1 mais n'est pas un lien symbolique. Il sera supprimé."
      rm -r "$HOME/.config/JetBrains/IntelliJIdea2023.1/$dir"
    fi

    # Crée un lien symbolique vers le dossier de configuration d'IntelliJ IDEA
    echo "[INFO] Création du lien symbolique pour le dossier $dir d'IntelliJ IDEA."
    ln -s "$HOME/.configenv/JetBrains/$dir" "$HOME/.config/JetBrains/IntelliJIdea2023.1/$dir"
  fi
done
