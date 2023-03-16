# Use debian bullseye-slim base image
FROM debian:bullseye-slim

# Set an argument FP VERSION
ARG FP_VERSION=2.0.0

# Update package list and install packages and remove all files and dir within /var/lib/apt/lists/
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl jq ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download an executable file and save it to the "/usr/bin" directory
RUN curl https://fp.dev/fp/v$FP_VERSION/x86_64-unknown-linux-gnu/fp -o /usr/bin/fp

# Set executable persmission for file at '/usr/bin/fp'
RUN chmod +x /usr/bin/fp

# copy 'entrypoint.sh' file from host machine into docker image at path '/entrypoint.sh'
COPY entrypoint.sh /entrypoint.sh

# Execute 'entrypoint.sh' when docker container is launched
ENTRYPOINT ["/entrypoint.sh"]
