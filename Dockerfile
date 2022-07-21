FROM debian:bullseye-slim
ARG FP_VERSION=0.8.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl jq ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://fp.dev/fp/v$FP_VERSION/x86_64-unknown-linux-gnu/fp -o /usr/bin/fp
RUN chmod +x /usr/bin/fp

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
