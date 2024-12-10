#!/bin/bash

# Script pour lancer des applications essentielles sur macOS El Capitan

# Liste des applications à lancer
applications=(
    "Google Chrome"
    "Mail"          # Remplace Slack
    "Microsoft Outlook"
    "Calendar"      # Remplace Todoist
    "Spotify"
    "Terminal"
    "Stickies"      # Remplace Notes
)

# Fonction pour lancer les applications
launch_apps() {
    for app in "${applications[@]}"; do
        # Vérifie si l'application est installée et la lance
        if [ -d "/Applications/$app.app" ]; then
            open -a "$app"
            echo "Lancement de $app..."
        else
            echo "Application non trouvée : $app"
        fi
    done
}

# Exécution de la fonction
launch_apps

# Ajout d'autres tâches générales ici
# Par exemple : Vérification des mises à jour, sauvegarde de fichiers, etc.

echo "Tous les processus de lancement sont terminés."
