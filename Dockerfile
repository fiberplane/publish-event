FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl jq \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://fp.dev/fp/v0.8.0/x86_64-unknown-linux-gnu/fp -o /usr/bin/fp
RUN chmod +x /usr/bin/fp

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
