# linux_default_profile

Ce répository sert à configurer un nouvel environnement perso.

Le répertoire prévu pour ce répository est `.configenv` à la raçine du `$HOME`

Il suffit donc de cloner le projet de la manière suivante :

```
git clone git@github.com:jbwittner/linux_default_profile.git $HOME/.configenv
```

# configuration

Il faut effectuer des liens symboliques pour les fichiers de configuration.

```bash
ln -s $HOME/.configenv/git/.gitconfig $HOME/.gitconfig
```

```bash
ln -s $HOME/.configenv/zsh/.zshrc $HOME/.zshrc
```

Si le fichier existe déjà il faut le supprimer avant : 
```bash
rm $HOME/.zshrc
```
# Si on utilise podmand il est interessant de faire un lien symbolique pour docker
```bash
sudo ln -s $(which podman) /usr/local/bin/docker
```