# 09 - Web Server Security

## Goals

- Harden web server configuration
- Enforce TLS and security headers
- Protect web applications from common threats

## Nginx best practices

- Use strong TLS ciphers and protocols
- Redirect HTTP to HTTPS
- Enable `X-Frame-Options`, `X-Content-Type-Options`, and `Referrer-Policy`

## Apache best practices

- Disable unnecessary modules
- Enable `mod_security` and `mod_evasive`
- Enforce secure cookie flags

## Reverse proxy

- Use a reverse proxy for TLS termination
- Keep the backend server restricted to local traffic

## Rate limiting

- Use Nginx `limit_req` or Apache `mod_ratelimit`
- Prevent brute force and application-layer abuse
