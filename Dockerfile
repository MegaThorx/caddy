ARG VERSION=2.10

FROM caddy:${VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/hetzner/v2 \
    --with github.com/caddy-dns/azure \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/caddyserver/transform-encoder

FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
