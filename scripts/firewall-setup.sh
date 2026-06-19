#!/usr/bin/env bash

# Firewall setup helper script for UFW
# Use this as a template and adjust for your environment.

set -euo pipefail

sudo apt update
sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable

echo "UFW firewall enabled with common service rules."