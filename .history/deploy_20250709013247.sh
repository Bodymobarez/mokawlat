#!/bin/bash
# cPanel Deployment Script
# This script should be run after pulling from GitHub

echo "Starting cPanel deployment..."

# Check Node.js version
echo "Node.js version: $(node --version)"
echo "NPM version: $(npm --version)"

# Install dependencies
echo "Installing dependencies..."
npm install --production

# Build the application
echo "Building application..."
npm run build

# Set proper permissions
echo "Setting file permissions..."
chmod -R 755 .next/
chmod 644 server.js
chmod 644 package.json

echo "Deployment completed successfully!"
echo "Make sure to restart your Node.js application in cPanel."
