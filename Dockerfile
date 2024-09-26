# Use an official playwright image
FROM mcr.microsoft.com/playwright:v1.45.1-jammy

# Set the working directory inside the container
WORKDIR /app

# Install Python and pip
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles
RUN apt-get update && \
    apt-get install -y --no-install-recommends tzdata && \
    apt-get clean

# Install all test framework dependencies
RUN apt-get install -y --no-install-recommends python3-pip && \
    pip3 install --no-cache-dir -r /workspace/repo/requirements.txt && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the rest of your application code into the container
COPY /workspace/repo .  # Copy the entire repo into the container
