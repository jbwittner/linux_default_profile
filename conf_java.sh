#!/bin/bash

JAVA_VERSION=17.0.6-zulu
MAVEN_VERSION=3.8.7

echo "Vérification de l'installation de SDKMAN!..."

# Vérifie si SDKMAN! est installé
if [ ! -d "$HOME/.sdkman" ]; then
  echo "SDKMAN! n'est pas installé. Installation de SDKMAN!..."

  # Installe SDKMAN!
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
else
  echo "SDKMAN! est déjà installé."
fi

echo "Installation de Java $JAVA_VERSION..."

# Installe la version spécifiée de Java
sdk install java $JAVA_VERSION

echo "Définition de Java $JAVA_VERSION comme version par défaut..."

# Définit la version spécifiée de Java comme version par défaut
sdk default java $JAVA_VERSION

echo "Installation de Maven $MAVEN_VERSION..."

# Installe la version spécifiée de Maven
sdk install maven $MAVEN_VERSION

echo "Définition de Maven $MAVEN_VERSION comme version par défaut..."

# Définit la version spécifiée de Maven comme version par défaut
sdk default maven $MAVEN_VERSION

echo "Configuration de Maven..."

# Crée un lien symbolique vers le fichier de configuration Maven
ln -s $HOME/.configenv/maven/settings.xml $HOME/.m2/settings.xml

echo "Redémarrage de Zsh..."

# Redémarre le terminal Zsh
exec zsh
