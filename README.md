# Linux Server Hardening Guide

A practical guide for securing Linux servers in production.

## Covered Topics

- SSH Hardening
- Firewall Configuration
- Patch Management
- User and Privilege Management
- Monitoring and Logging
- Intrusion Prevention
- Web Server Security
- Container Security
- Backup and Recovery
- Incident Response

## Supported Distributions

- Ubuntu
- Debian
- Rocky Linux
- AlmaLinux

## Security Levels

- Level 1: Basic hardening for a small VPS
- Level 2: Production server baseline
- Level 3: High-security environment

## Quick Start

Start here:

- `docs/01-initial-setup.md`
- `docs/03-ssh-hardening.md`
- `docs/04-firewall.md`

## Automation

This repository includes automation helper scripts in `scripts/` to apply common hardening steps. Review scripts before running in production.

- `scripts/add_user.sh` — add a user with password and optional sudo and SSH key.
- `scripts/bootstrap.sh` — run a safe bootstrap that calls the other helper scripts.
- `scripts/setup-unattended.sh` — install and enable unattended-upgrades.
- `scripts/install-fail2ban.sh` — install and enable a basic Fail2ban configuration.

See `docs/security-levels.md` for guidance on Level 1/2/3 hardening profiles.

## Repository Layout

- `docs/` — step-by-step hardening guides
- `scripts/` — automation helpers
- `checklists/` — distribution-specific checklists
- `resources/` — references and extra reading
