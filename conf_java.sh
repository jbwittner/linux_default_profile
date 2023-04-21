#!/bin/bash

JAVA_VERSION=17.0.6-zulu
MAVEN_VERSION=3.8.7

echo "[INFO] Vérification de l'installation de SDKMAN!..."

# Vérifie si SDKMAN! est installé et le met à jour si c'est le cas
if [ ! -d "$HOME/.sdkman" ]; then
  echo "[INFO] SDKMAN! n'est pas installé. Installation de SDKMAN!..."

  # Installe SDKMAN!
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
else
  echo "[INFO] SDKMAN! est déjà installé. Vérification des mises à jour disponibles..."

  source "$HOME/.sdkman/bin/sdkman-init.sh"
  
  # Met à jour SDKMAN!
  sdk selfupdate
  sdk update
fi

echo "[INFO] Installation de Java $JAVA_VERSION..."

# Installe la version spécifiée de Java
sdk install java $JAVA_VERSION

echo "[INFO] Définition de Java $JAVA_VERSION comme version par défaut..."

# Définit la version spécifiée de Java comme version par défaut
sdk default java $JAVA_VERSION

echo "[INFO] Installation de Maven $MAVEN_VERSION..."

# Installe la version spécifiée de Maven
sdk install maven $MAVEN_VERSION

echo "[INFO] Définition de Maven $MAVEN_VERSION comme version par défaut..."

# Définit la version spécifiée de Maven comme version par défaut
sdk default maven $MAVEN_VERSION

echo "[INFO] Configuration de Maven..."

# Vérifie si la configuration Maven a déjà été effectuée
if [ ! -f "$HOME/.m2/settings.xml" ]; then
  # Crée un lien symbolique vers le fichier de configuration Maven
  ln -s $HOME/.configenv/maven/settings.xml $HOME/.m2/settings.xml
else
  # Vérifie si le fichier .m2/settings.xml est un lien symbolique pointant vers le fichier de configuration de Maven
  if [ -L "$HOME/.m2/settings.xml" ] && [ "$(readlink "$HOME/.m2/settings.xml")" = "$HOME/.configenv/maven/settings.xml" ]; then
    # Le fichier est un lien symbolique pointant vers le bon fichier, donc on ne fait rien
    echo "[INFO] Le lien symbolique pour le fichier settings.xml de Maven est déjà configuré."
  else
    # Le fichier n'est pas un lien symbolique ou ne pointe pas vers le bon fichier, donc on le supprime et on crée un nouveau lien
    echo "[WARN] Le fichier settings.xml existe déjà dans le répertoire .m2 mais n'est pas un lien symbolique ou ne pointe pas vers le bon fichier. Il sera supprimé et remplacé par un lien symbolique vers le fichier de configuration de Maven."
    rm "$HOME/.m2/settings.xml"
    ln -s $HOME/.configenv/maven/settings.xml $HOME/.m2/settings.xml
  fi
fi

echo "[INFO] Redémarrage de Zsh..."

# Redémarre le terminal Zsh
exec zsh
