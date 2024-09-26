# Use an official playwright image
FROM mcr.microsoft.com/playwright:v1.45.1-jammy

# Set the working directory in the container
WORKDIR /workspace/repo

# Install Python and pip
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles
RUN apt-get update && \
    apt-get install -y --no-install-recommends tzdata && \
    apt-get clean

# Install all test framework dependencies
RUN apt-get install -y --no-install-recommends python3-pip && \
    pip3 install --no-cache-dir -r requirements.txt && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

