#!/bin/bash

# Script de mise à jour des périphériques sur macOS El Capitan
# Assurez-vous d'exécuter ce script avec des privilèges administratifs

# Met à jour Homebrew (gestionnaire de paquets)
echo "Mise à jour de Homebrew..."
brew update

# Met à jour tous les paquets installés via Homebrew
echo "Mise à jour des paquets Homebrew..."
brew upgrade

# Met à jour les applications installées via Mac App Store
echo "Mise à jour des applications du Mac App Store..."
softwareupdate --install --all

# Mise à jour des pilotes pour les périphériques
echo "Mise à jour des pilotes pour les périphériques..."
# Note: les mises à jour des pilotes dépendent des fabricants, utilisez leurs outils si nécessaire.

# Vérification des mises à jour de firmware pour les périphériques
echo "Vérification des mises à jour de firmware..."
# Ici, vous pouvez ajouter des commandes spécifiques aux fabricants de vos périphériques

# Nettoyage de l'ancien cache de mise à jour
echo "Nettoyage des fichiers temporaires..."
sudo rm -rf /Library/Updates/*

echo "Mise à jour des périphériques terminée avec succès !"
