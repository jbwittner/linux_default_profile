#!/bin/bash

NODE_VERSION=18.16.0

echo "Vérification de l'installation de NVM..."

# Vérifie si NVM est installé
if [ ! -d "$HOME/.nvm" ]; then
  echo "NVM n'est pas installé. Installation de NVM..."

  # Installe NVM
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  source "$HOME/.nvm/nvm.sh"
else
  echo "NVM est déjà installé. Mise à jour de NVM..."

  # Met à jour NVM à la dernière version via Git
  cd $HOME/.nvm && git pull origin master
  source "$HOME/.nvm/nvm.sh"
fi

echo "Installation de Node.js version $NODE_VERSION..."

# Installe la version de Node.js spécifiée
nvm install $NODE_VERSION

echo "Configuration de NPM..."

# Crée un lien symbolique vers le fichier de configuration NPM
ln -s $HOME/.configenv/npm/.npmrc $HOME/.npmrc

echo "Redémarrage de Zsh..."

# Redémarre le terminal Zsh
exec zsh
