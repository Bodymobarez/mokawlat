#!/bin/bash

# 🚀 Quick cPanel Deployment Script
# Run this script after uploading your files to cPanel

echo "=================================================="
echo "🚀 Starting cPanel Deployment Process"
echo "=================================================="
echo ""

# Step 1: Check Node.js version
echo "📋 Step 1: Checking Node.js version..."
node --version
npm --version
echo ""

# Step 2: Install dependencies
echo "📦 Step 2: Installing production dependencies..."
npm install --production --no-optional
echo ""

# Step 3: Build the application
echo "🔨 Step 3: Building the application..."
npm run build
echo ""

# Step 4: Set file permissions
echo "🔐 Step 4: Setting file permissions..."
chmod -R 755 .next/ 2>/dev/null || true
chmod 644 server.js 2>/dev/null || true
chmod 644 package.json 2>/dev/null || true
echo ""

# Step 5: Check if build was successful
if [ -d ".next" ]; then
    echo "✅ Build successful! .next directory created."
else
    echo "❌ Build failed! .next directory not found."
    exit 1
fi

echo ""
echo "=================================================="
echo "✅ Deployment completed successfully!"
echo "=================================================="
echo ""
echo "📋 Next steps:"
echo "1. Go to cPanel → Node.js"
echo "2. Click 'Restart' to start your application"
echo "3. Visit your domain to verify deployment"
echo ""
echo "🔧 If issues occur:"
echo "- Check cPanel error logs"
echo "- Verify environment variables are set"
echo "- Ensure startup file is set to: server.js"
echo ""
