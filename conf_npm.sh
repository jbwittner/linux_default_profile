#!/bin/bash

NODE_VERSION=18.16.0

echo "Vérification de l'installation de NVM..."

# Vérifie si NVM est installé
if [ ! -d "$HOME/.nvm" ]; then
  echo "[INFO] NVM n'est pas installé. Installation de NVM..."

  # Installe NVM
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  source "$HOME/.nvm/nvm.sh"
else
  echo "[INFO] NVM est déjà installé. Mise à jour de NVM..."

  # Met à jour NVM à la dernière version via Git
  cd $HOME/.nvm && git pull origin master
  source "$HOME/.nvm/nvm.sh"
  cd -
fi

echo "[INFO] Installation de Node.js version $NODE_VERSION..."

# Installe la version de Node.js spécifiée
nvm install $NODE_VERSION

echo "[INFO] Configuration de NPM..."

# Vérifie si le fichier .npmrc est déjà configuré avec un lien symbolique
if [ -L "$HOME/.npmrc" ] && [ "$(readlink $HOME/.npmrc)" == "$HOME/.configenv/npm/.npmrc" ]; then
  # Le fichier est un lien symbolique vers le fichier de configuration NPM, donc on ne fait rien
  echo "[INFO] Le lien symbolique pour le fichier .npmrc est déjà configuré."
else
  # Vérifie si le fichier .npmrc existe déjà
  if [ -f "$HOME/.npmrc" ]; then
    # Le fichier .npmrc existe déjà mais n'est pas un lien symbolique, donc on le supprime
    echo "[WARN] Le fichier .npmrc existe déjà mais n'est pas un lien symbolique. Il sera supprimé et remplacé par un lien symbolique vers le fichier de configuration NPM."
    rm "$HOME/.npmrc"
  fi

  # Crée un lien symbolique vers le fichier de configuration NPM
  ln -s $HOME/.configenv/npm/.npmrc $HOME/.npmrc
fi

echo "[INFO] Redémarrage de Zsh..."

# Redémarre le terminal Zsh
exec zsh
