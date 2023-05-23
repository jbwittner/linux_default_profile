#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Création du dossier workspace dans le répertoire $HOME
mkdir -p $HOME/workspace

# Appelle le script de configuration de Git
echo "Configuration de Git..."
./conf_git.sh

# Appelle le script de configuration de Java
echo "Configuration de Java..."
./conf_java.sh

# Appelle le script de configuration de NPM
echo "Configuration de NPM..."
./conf_npm.sh

# Appelle le script de configuration de PNPM
echo "Configuration de PNPM..."
./conf_pnpm.sh

# Appelle le script de configuration de VSCode
echo "Configuration de VSCode..."
./conf_vscode.sh

# Appelle le script de configuration de Zsh
echo "Configuration de Zsh..."
./conf_zsh.sh

echo "[INFO] Terminé, redémarrage de Zsh..."

# Redémarre le terminal Zsh
exec zsh
