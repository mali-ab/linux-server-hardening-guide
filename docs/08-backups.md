# 08 - Backup and Recovery

## Goals

- Maintain reliable backups
- Follow the 3-2-1 rule
- Validate restores regularly

## 3-2-1 rule

- 3 copies of data
- 2 different media types
- 1 copy offsite

## Tools

- `restic`
- `borgbackup`
- `rsync`

## Example: Restic backup

```bash
restic init --repo /mnt/backups/restic
restic backup /etc /home /var/www
restic snapshots
```

## Recovery practice

- Test restores periodically.
- Document backup schedules and retention.
- Encrypt backup repositories and store keys securely.
