# ---------------------------------------------------------------
# INFRALITH CORE - CONTAINER IMAGE
# ---------------------------------------------------------------

# Use the official lightweight Node.js 20 image.
# https://hub.docker.com/_/node
FROM node:20-slim

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
COPY package*.json ./

# Install production dependencies.
# 'npm ci' is faster and more reliable than 'npm install' for builds.
RUN npm ci --only=production

# Copy local code to the container image.
COPY . .

# Bind the app to port 10000 (standard for our config).
EXPOSE 10000

# Run the web service on container startup.
CMD [ "node", "gateway.js" ]