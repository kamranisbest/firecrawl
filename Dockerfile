# Use a base image that includes Docker and Docker Compose
FROM docker:20.10.7-dind

# Install Docker Compose
RUN apk add --no-cache curl py3-pip && \
    pip install docker-compose

# Copy your docker-compose.yml file into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Command to start Docker Compose
CMD ["docker-compose", "up"]
