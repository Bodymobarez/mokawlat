#!/bin/bash

# 🔍 Deployment Status Checker
# This script helps you understand your current deployment status

echo "🔍 DEPLOYMENT STATUS CHECK"
echo "=========================="
echo ""

# Check if we're in a git repository
if [ -d ".git" ]; then
    echo "✅ Git repository: YES"
    echo "📂 Repository: $(git remote get-url origin 2>/dev/null || echo 'No remote configured')"
    echo "🌿 Current branch: $(git branch --show-current 2>/dev/null || echo 'Unknown')"
    echo "📝 Latest commit: $(git log --oneline -1 2>/dev/null || echo 'No commits found')"
else
    echo "❌ Git repository: NO"
fi

echo ""
echo "📋 DEPLOYMENT FILES CHECK"
echo "========================="

# Check for deployment files
files=("server.js" "package.json" "deploy.sh" "quick-deploy.sh" ".env.production" "next.config.js")

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file: EXISTS"
    else
        echo "❌ $file: MISSING"
    fi
done

echo ""
echo "🔨 BUILD STATUS CHECK"
echo "===================="

# Check if build directory exists
if [ -d ".next" ]; then
    echo "✅ .next directory: EXISTS (Build completed)"
else
    echo "❌ .next directory: MISSING (Build not completed)"
fi

# Check Node.js version
if command -v node &> /dev/null; then
    echo "✅ Node.js version: $(node --version)"
else
    echo "❌ Node.js: NOT INSTALLED"
fi

# Check npm version
if command -v npm &> /dev/null; then
    echo "✅ npm version: $(npm --version)"
else
    echo "❌ npm: NOT INSTALLED"
fi

echo ""
echo "🎯 CURRENT STATUS"
echo "=================="

if [ -d ".git" ] && [ -f "server.js" ] && [ -f "package.json" ]; then
    echo "✅ Ready for deployment"
    echo ""
    echo "🚀 NEXT STEPS:"
    echo "1. Access your cPanel"
    echo "2. Set up Node.js application (version 20.19.2)"
    echo "3. Upload code or connect GitHub"
    echo "4. Set environment variables"
    echo "5. Run: npm install --production && npm run build"
    echo "6. Start the application"
    echo ""
    echo "📖 For detailed instructions, check: DEPLOY_NOW.md"
else
    echo "❌ Not ready for deployment"
    echo "Missing required files. Please check the errors above."
fi

echo ""
echo "💡 UNDERSTANDING 'NOT AVAILABLE' STATUS"
echo "========================================"
echo "The 'Not available' deployment information is NORMAL"
echo "This means your app hasn't been deployed to cPanel yet."
echo ""
echo "After successful deployment, you'll see:"
echo "- Last Deployed on: [Date]"
echo "- Last Deployed SHA: [Commit hash]"
echo "- Author: [Your name]"
echo "- Commit Date: [Commit timestamp]"
echo ""
echo "This information only appears AFTER you deploy to cPanel!"
echo ""
