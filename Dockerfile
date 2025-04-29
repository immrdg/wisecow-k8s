FROM ubuntu:20.04

# Non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/usr/games:${PATH}"
# Install required packages
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat \
 && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy your script
COPY wisecow.sh .

# Make it executable
RUN chmod +x wisecow.sh

# Expose default port
EXPOSE 4499

# Start the server
CMD ["./wisecow.sh"]