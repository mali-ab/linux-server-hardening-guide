#!/usr/bin/env bash

# SSH hardening helper script
# This script is an example; review and adapt before use.

set -euo pipefail

SSH_CONFIG="/etc/ssh/sshd_config"

sudo cp "$SSH_CONFIG" "$SSH_CONFIG.bak"
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' "$SSH_CONFIG"
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' "$SSH_CONFIG"
sudo sed -i 's/^#\?ChallengeResponseAuthentication.*/ChallengeResponseAuthentication no/' "$SSH_CONFIG"
sudo sed -i 's/^#\?PubkeyAuthentication.*/PubkeyAuthentication yes/' "$SSH_CONFIG"

sudo systemctl restart sshd

echo "SSH hardening applied. Verify /etc/ssh/sshd_config and restart status."