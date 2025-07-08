#!/bin/bash
# Emergency deployment script for memory-constrained environments

echo "🚨 EMERGENCY DEPLOYMENT MODE - AI FEATURES DISABLED"
echo "This script temporarily disables AI features to reduce memory usage"

# Backup original files
echo "📋 Creating backups..."
cp next.config.js next.config.js.backup
cp src/ai/genkit.ts src/ai/genkit.ts.backup

# Use minimal configuration
echo "🔧 Switching to minimal configuration..."
cp next.config.minimal.js next.config.js
cp src/ai/genkit.minimal.ts src/ai/genkit.ts

# Set extreme memory limits
export NODE_OPTIONS="--max-old-space-size=512 --max-semi-space-size=32"

# Clear cache
echo "🧹 Clearing cache..."
rm -rf .next || true
rm -rf node_modules/.cache || true

# Install only essential dependencies
echo "📦 Installing minimal dependencies..."
npm install --production --no-optional --prefer-offline

# Build with minimal setup
echo "🔨 Building with minimal memory footprint..."
NODE_ENV=production npm run build

# Restore original files
echo "♻️ Restoring original configuration..."
cp next.config.js.backup next.config.js
cp src/ai/genkit.ts.backup src/ai/genkit.ts

echo "✅ Emergency deployment completed!"
echo "⚠️  Remember to enable AI features after deployment stabilizes"
