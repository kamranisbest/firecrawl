# Use a base image that includes Docker and Docker Compose
FROM docker:20.10.7-dind

# Install Docker Compose
RUN apk add --no-cache curl py3-pip \
    apt-get update && \
    apt-get install -y \
    gcc \
    g++ \
    make \
    python3-dev \
    build-essential \
    libffi-dev \
    libssl-dev \
    rustc \
    cargo \
    && rm -rf /var/lib/apt/lists/* \
    && pip install docker-compose \
    && pip install cryptography

# Copy your docker-compose.yml file into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Command to start Docker Compose
CMD ["docker-compose", "up"]
