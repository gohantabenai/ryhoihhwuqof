FROM debian:stable-slim

RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=cloudflare/cloudflared:latest /usr/local/bin/cloudflared /usr/local/bin/cloudflared

CMD ["/bin/sh", "-c", "cloudflared tunnel run --token $TUNNEL_TOKEN"]
