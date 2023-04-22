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

# Vérifie si le plugin zsh-autosuggestions est installé et le met à jour s'il l'est
echo "[INFO] Vérification de l'installation du plugin zsh-autosuggestions..."
if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  echo "[INFO] Le plugin zsh-autosuggestions est déjà installé. Mise à jour du plugin..."

  # Met à jour le plugin zsh-autosuggestions
  (cd "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" && git pull origin master)
else
  # Clone le plugin zsh-autosuggestions
  echo "[INFO] Installation du plugin zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

# Vérifie si le plugin zsh-syntax-highlighting est installé et le met à jour s'il l'est
echo "[INFO] Vérification de l'installation du plugin zsh-syntax-highlighting..."
if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  echo "[INFO] Le plugin zsh-syntax-highlighting est déjà installé. Mise à jour du plugin..."
# Met à jour le plugin zsh-syntax-highlighting
  (cd "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" && git pull origin master)
else

  Clone le plugin zsh-syntax-highlighting
  echo "[INFO] Installation du plugin zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi