#!/usr/bin/env bash

# add_user.sh - Add a system user with password and optional sudo
# Usage: sudo ./add_user.sh USERNAME PASSWORD [--sudo] [PUBKEY_FILE]

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root (sudo)." >&2
  exit 1
fi

USERNAME=${1:-}
PASSWORD=${2:-}
SUDO_FLAG=${3:-}
PUBKEY_FILE=${4:-}

if [[ -z "$USERNAME" || -z "$PASSWORD" ]]; then
  echo "Usage: $0 USERNAME PASSWORD [--sudo] [PUBKEY_FILE]" >&2
  exit 1
fi

# Create the user with a home directory and no password prompts
if id -u "$USERNAME" >/dev/null 2>&1; then
  echo "User $USERNAME already exists. Updating password and skipping creation."
else
  useradd -m -s /bin/bash "$USERNAME"
  echo "Created user $USERNAME"
fi

# Set the password
echo "$USERNAME:$PASSWORD" | chpasswd

# Add to sudo if requested
if [[ "$SUDO_FLAG" == "--sudo" ]]; then
  usermod -aG sudo "$USERNAME"
  echo "Added $USERNAME to sudo group"
fi

# Setup SSH authorized_keys if provided
if [[ -n "$PUBKEY_FILE" && -f "$PUBKEY_FILE" ]]; then
  SSH_DIR="/home/$USERNAME/.ssh"
  mkdir -p "$SSH_DIR"
  cat "$PUBKEY_FILE" >> "$SSH_DIR/authorized_keys"
  chown -R "$USERNAME:$USERNAME" "$SSH_DIR"
  chmod 700 "$SSH_DIR"
  chmod 600 "$SSH_DIR/authorized_keys"
  echo "Installed public key for $USERNAME"
fi

echo "User $USERNAME prepared. Review /etc/sudoers and SSH settings as needed."