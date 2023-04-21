#!/bin/bash

echo "[INFO] Vérification de l'installation de Zsh..."

# Vérifie si Zsh est installé
if ! [ -x "$(command -v zsh)" ]; then
  echo "[INFO] Zsh n'est pas installé. Installation de Zsh..."

  # Installe Zsh
  sudo apt-get update
  sudo apt-get install zsh
fi

echo "[INFO] Vérification de l'installation de oh-my-zsh..."

# Vérifie si oh-my-zsh est installé
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "[INFO] oh-my-zsh n'est pas installé. Installation de oh-my-zsh..."

  # Installe oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -f
else
  echo "[INFO] oh-my-zsh est déjà installé. Mise à jour de oh-my-zsh..."

  # Met à jour oh-my-zsh
  (cd "$HOME/.oh-my-zsh" && git pull origin master)
fi

echo "[INFO] Configuration de Zsh..."

# Vérifie si le fichier .zshrc existe et si c'est un lien symbolique
if [ -L "$HOME/.zshrc" ] && [ "$(readlink $HOME/.zshrc)" = "$HOME/.configenv/zsh/.zshrc" ]; then
  echo "[INFO] Le lien symbolique pour le fichier .zshrc de Zsh est déjà configuré."
else
  # Supprime le fichier .zshrc s'il existe
  if [ -f "$HOME/.zshrc" ]; then
    echo "[WARN] Le fichier .zshrc existe déjà dans le répertoire personnel mais n'est pas un lien symbolique. Il sera supprimé."
    rm "$HOME/.zshrc"
  fi

  # Crée un lien symbolique vers le fichier de configuration Zsh
  echo "[INFO] Création du lien symbolique pour le fichier .zshrc de Zsh."
  ln -s $HOME/.configenv/zsh/.zshrc $HOME/.zshrc
fi

# Clone les plugins zsh-autosuggestions et zsh-syntax-highlighting
echo "[INFO] Installation des plugins zsh-autosuggestions et zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "[INFO] Redémarrage de Zsh..."

# Redémarre le terminal Zsh
exec zsh
