# 10 - Container Security

## Goals

- Run containers with the least privilege
- Scan images before use
- Protect secrets and runtime configuration

## Docker hardening

```bash
docker run --read-only --cap-drop ALL --pids-limit 100 --network bridge nginx:latest
```

## Best practices

- Use rootless Docker when possible.
- Pin image versions and scan images for vulnerabilities.
- Mount secrets securely instead of baking them into images.
- Avoid privileged containers.

## Runtime

- Limit container capabilities.
- Use user namespaces.
- Monitor container activity and file system changes.
