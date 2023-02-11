# linux_default_profile

Ce répository sert à configurer un nouvel environnement perso.

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