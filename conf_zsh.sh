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

# Vérifie si le fichier .zshrc est un lien symbolique
if [ -L "$HOME/.zshrc" ]; then
  # Vérifie si le lien symbolique pointe bien vers le fichier de configuration Zsh
  if [ "$(readlink $HOME/.zshrc)" = "$HOME/.configenv/zsh/.zshrc" ]; then
    echo "Le lien symbolique pour le fichier .zshrc est déjà configuré."
  else
    # Supprime le lien symbolique existant et crée un nouveau lien
    echo "Le lien symbolique pour le fichier .zshrc existe déjà mais ne pointe pas vers le fichier de configuration Zsh. Il sera supprimé et remplacé par un nouveau lien symbolique vers le fichier de configuration Zsh."
    rm "$HOME/.zshrc"
    ln -s $HOME/.configenv/zsh/.zshrc $HOME/.zshrc
  fi
else
  # Vérifie si le fichier .zshrc existe déjà
  if [ -f "$HOME/.zshrc" ]; then
    # Supprime le fichier .zshrc existant et crée un nouveau lien symbolique
    echo "Le fichier .zshrc existe déjà mais n'est pas un lien symbolique. Il sera supprimé et remplacé par un nouveau lien symbolique vers le fichier de configuration Zsh."
    rm "$HOME/.zshrc"
    ln -s $HOME/.configenv/zsh/.zshrc $HOME/.zshrc
  else
    # Crée un lien symbolique vers le fichier de configuration Zsh
    ln -s $HOME/.configenv/zsh/.zshrc $HOME/.zshrc
  fi
fi

# Installe les plugins zsh-autosuggestions et zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Redémarrage de Zsh..."

# Redémarre le terminal Zsh
exec zsh
