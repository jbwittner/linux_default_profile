#!/bin/bash

echo "Vérification de l'installation de Zsh..."

# Vérifie si Zsh est installé
if ! [ -x "$(command -v zsh)" ]; then
  echo "Zsh n'est pas installé. Installation de Zsh..."

  # Installe Zsh
  sudo apt-get update
  sudo apt-get install zsh
fi

echo "Vérification de l'installation de oh-my-zsh..."

# Vérifie si oh-my-zsh est installé
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "oh-my-zsh n'est pas installé. Installation de oh-my-zsh..."

  # Installe oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -f
else
  echo "oh-my-zsh est déjà installé. Mise à jour de oh-my-zsh..."

  # Met à jour oh-my-zsh
  (cd "$HOME/.oh-my-zsh" && git pull origin master)
fi

echo "Configuration de Zsh..."

# Crée un lien symbolique vers le fichier de configuration Zsh
ln -s $HOME/.configenv/zsh/.zshrc $HOME/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Redémarrage de Zsh..."

# Redémarre le terminal Zsh
exec zsh
