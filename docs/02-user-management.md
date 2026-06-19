# 02 - User and Privilege Management

## Principles

- Principle of least privilege
- Separate service accounts from interactive users
- Remove unused accounts
- Review group membership and `sudo` access regularly

## Best Practices

- Use `adduser` or `useradd` for new accounts.
- Set appropriate shell and home directory.
- Use groups to manage access to services.
- Keep `sudo` access limited to trusted operators.

## Example: audit sudoers

```bash
sudo visudo
sudo ls /etc/sudoers.d
```

## Cleanup

- Lock stale accounts:

  ```bash
  sudo usermod -L username
  ```

- Remove unused users:

  ```bash
  sudo deluser username
  ```

- Check for unauthorized accounts:

  ```bash
  cut -d: -f1 /etc/passwd
  ```
