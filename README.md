# linux_default_profile

Ce répository sert à configurer un nouvel environnement perso.

Le répertoire prévu pour ce répository est `.configenv` à la raçine du `$HOME`

Il suffit donc de cloner le projet de la manière suivante :

```
git clone git@github.com:jbwittner/linux_default_profile.git $HOME/.configenv
```

Lancer la commande 

```
sudo update_env.sh
```

Cela va installer ZSH, oh my zsh, et le configurer.
Cela va aussi y ajouter la configuration git, npm et maven.

Il reste à set les variables (si nécessaire) :

```
export USER_GITHUB_LOGIN="jbwittner"
export USER_GITHUB_KEY=""
export SONAR_TOKEN=""
```

Il est possible qu'il faille installer Sdkman et nvm:

https://sdkman.io/install

https://github.com/nvm-sh/nvm
