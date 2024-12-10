#!/bin/bash

# Script d'optimisation pour macOS El Capitan

echo "Démarrage de l'optimisation du système..."

# 1. Mettre à jour Homebrew
if command -v brew >/dev/null 2>&1; then
    echo "Mise à jour de Homebrew..."
    brew update
    brew upgrade
else
    echo "Homebrew n'est pas installé. Veuillez l'installer pour bénéficier des optimisations."
fi

# 2. Nettoyer les caches système
echo "Nettoyage des caches système..."
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder

# 3. Désactiver les animations inutiles
echo "Désactivation des animations inutiles..."
defaults write com.apple.dock autohide-time-modifier -float 0.1; killall Dock
defaults write com.apple.dock autohide-delay -float 0; killall Dock

# 4. Optimiser les paramètres de mémoire virtuelle
echo "Optimisation de la mémoire virtuelle..."
sudo sysctl -w vm.swappiness=10
sudo sysctl -w vm.overcommit_memory=2

# 5. Fermer les applications inutilisées
echo "Fermeture des applications inutilisées..."
osascript -e 'quit app "Safari"'
osascript -e 'quit app "Mail"'

# 6. Activer la gestion de la mémoire par le système
echo "Activation de la gestion de la mémoire par le système..."
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.dynamic_pager.plist
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.dynamic_pager.plist

# 7. Libérer de la RAM
echo "Libération de RAM..."
sudo purge

# 8. Notification de fin
echo "L'optimisation est terminée. Redémarrez votre Mac pour appliquer les changements."

exit 0
