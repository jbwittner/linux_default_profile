# Configuration de ZSH local

Le fichier `model-zshrc.local.sh` sert de model pour la configuration locale de ZSH
la configuration de ZSH cherche à loader le fichier `.local.zshrc` (ce dernier n'est pas commitable).
Il suffit de copier faire `cp model-zshrc.local.sh .local.zshrc`

# Lib à installer

zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Lazydocker

https://github.com/jesseduffield/lazydocker

## Podman
Il est possible d'utiliser podman mais il faut le configurer pour qu'il fonctionne comme docker.

```bash
sudo rm  /usr/local/bin/docker
sudo ln -s $(which podman) /usr/local/bin/docker
```

Cela permet d'utiliser les commandes docker avec podman.