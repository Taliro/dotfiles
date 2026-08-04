#!/usr/bin/env fish

echo "🚀 Initialisation KeyGen..."

# Création du dossier SSH
if not test -d ~/.ssh
    mkdir ~/.ssh
    chmod 700 ~/.ssh
    echo "✓ Folder SSH created"
end

# Création de la clé SSH si absente
if not test -f ~/.ssh/id_ed25519
    echo "SSH Key creation..."

    ssh-keygen \
        -t ed25519 \
        -C (whoami)"@"(hostname) \
        -f ~/.ssh/id_ed25519 \
        -N ""

    chmod 600 ~/.ssh/id_ed25519
    chmod 644 ~/.ssh/id_ed25519.pub

    echo "✓ SSH Key created"
else
    echo "✓ SSH Key always exist"
end

echo "✅ Bootstrap keygen done"
