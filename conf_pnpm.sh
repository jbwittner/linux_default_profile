#!/bin/bash

echo "[INFO] Configuration de PNPM..."

# Vérifie si le fichier .npmrc est déjà configuré avec un lien symbolique
curl -fsSL https://get.pnpm.io/install.sh | sh -

echo "[INFO] Terminé, un redémarrage de Zsh est nécessaire..."