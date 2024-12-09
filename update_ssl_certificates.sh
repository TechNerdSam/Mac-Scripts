#!/bin/bash

# Ce script met à jour les certificats SSL pour Google Chrome et Safari sur macOS El Capitan.

# Variables
KEYCHAIN="/Library/Keychains/System.keychain"  # Chemin vers le trousseau système
CERTIFICATES_DIR="/etc/ssl/certs"               # Répertoire des certificats
CHROME_CERTS="$HOME/Library/Application Support/Google/Chrome/Default/Certificate Revocation"
SAFARI_CERTS="$HOME/Library/Keychains/login.keychain-db"  # Trousseau de Safari

# Fonction pour vérifier si une commande a réussi
check_command() {
    if [ $? -ne 0 ]; then
        echo "Une erreur est survenue lors de l'exécution de la commande : $1"
        exit 1
    fi
}

# Met à jour les certificats SSL dans le trousseau
update_ssl_certificates() {
    echo "Mise à jour des certificats SSL dans le trousseau..."

    # Ajout des certificats SSL au trousseau
    for cert in $CERTIFICATES_DIR/*.crt; do
        echo "Ajout de $cert au trousseau..."
        sudo security add-trust-anchor -d -k "$KEYCHAIN" "$cert"
        check_command "ajouter le certificat $cert"
    done

    echo "Mise à jour des certificats terminée."
}

# Met à jour les certificats pour Google Chrome
update_chrome_certificates() {
    echo "Mise à jour des certificats SSL pour Google Chrome..."

    # Suppression des anciens certificats (si nécessaire)
    rm -rf "$CHROME_CERTS/*"
    check_command "supprimer les anciens certificats de Chrome"

    # Copie des nouveaux certificats (si nécessaire)
    cp $CERTIFICATES_DIR/*.crt "$CHROME_CERTS/"
    check_command "copier les certificats dans Chrome"

    echo "Mise à jour des certificats pour Google Chrome terminée."
}

# Met à jour les certificats pour Safari
update_safari_certificates() {
    echo "Mise à jour des certificats SSL pour Safari..."

    # Safari utilise le trousseau, donc cela est déjà couvert par update_ssl_certificates

    echo "Mise à jour des certificats pour Safari terminée."
}

# Exécution des fonctions
update_ssl_certificates
update_chrome_certificates
update_safari_certificates

echo "Mise à jour des certificats SSL terminée avec succès sur votre iMac."
