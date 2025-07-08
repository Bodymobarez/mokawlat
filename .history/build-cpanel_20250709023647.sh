#!/bin/bash
# Low-memory build script for cPanel deployment

echo "🚀 Starting cPanel optimized build..."
echo "📊 Memory constraints applied"

# Set memory limits
export NODE_OPTIONS="--max-old-space-size=1024 --max-semi-space-size=64"

# Clear any existing build artifacts
echo "🧹 Cleaning previous build..."
rm -rf .next || true
rm -rf node_modules/.cache || true

# Install dependencies with reduced memory
echo "📦 Installing dependencies..."
npm ci --production=false --no-optional --prefer-offline

# Build with memory optimizations
echo "🔨 Building with memory optimizations..."
NODE_ENV=production npm run build

# Clean up unnecessary files to save space
echo "🧹 Post-build cleanup..."
rm -rf node_modules/.cache
rm -rf .next/cache
find node_modules -name "*.ts" -type f -delete
find node_modules -name "*.map" -type f -delete

echo "✅ Build completed successfully!"
echo "📦 Ready for deployment"
