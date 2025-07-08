# 🔍 Deployment Status Checker (PowerShell)
# This script helps you understand your current deployment status

Write-Host "🔍 DEPLOYMENT STATUS CHECK" -ForegroundColor Yellow
Write-Host "==========================" -ForegroundColor Yellow
Write-Host ""

# Check if we're in a git repository
if (Test-Path ".git") {
    Write-Host "✅ Git repository: YES" -ForegroundColor Green
    $remote = git remote get-url origin 2>$null
    if ($remote) {
        Write-Host "📂 Repository: $remote" -ForegroundColor Cyan
    } else {
        Write-Host "📂 Repository: No remote configured" -ForegroundColor Yellow
    }
    
    $branch = git branch --show-current 2>$null
    if ($branch) {
        Write-Host "🌿 Current branch: $branch" -ForegroundColor Cyan
    } else {
        Write-Host "🌿 Current branch: Unknown" -ForegroundColor Yellow
    }
    
    $commit = git log --oneline -1 2>$null
    if ($commit) {
        Write-Host "📝 Latest commit: $commit" -ForegroundColor Cyan
    } else {
        Write-Host "📝 Latest commit: No commits found" -ForegroundColor Yellow
    }
} else {
    Write-Host "❌ Git repository: NO" -ForegroundColor Red
}

Write-Host ""
Write-Host "📋 DEPLOYMENT FILES CHECK" -ForegroundColor Yellow
Write-Host "=========================" -ForegroundColor Yellow

# Check for deployment files
$files = @("server.js", "package.json", "deploy.sh", "quick-deploy.sh", ".env.production", "next.config.js")

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "✅ $file`: EXISTS" -ForegroundColor Green
    } else {
        Write-Host "❌ $file`: MISSING" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "🔨 BUILD STATUS CHECK" -ForegroundColor Yellow
Write-Host "====================" -ForegroundColor Yellow

# Check if build directory exists
if (Test-Path ".next") {
    Write-Host "✅ .next directory: EXISTS (Build completed)" -ForegroundColor Green
} else {
    Write-Host "❌ .next directory: MISSING (Build not completed)" -ForegroundColor Red
}

# Check Node.js version
$nodeVersion = node --version 2>$null
if ($nodeVersion) {
    Write-Host "✅ Node.js version: $nodeVersion" -ForegroundColor Green
} else {
    Write-Host "❌ Node.js: NOT INSTALLED" -ForegroundColor Red
}

# Check npm version
$npmVersion = npm --version 2>$null
if ($npmVersion) {
    Write-Host "✅ npm version: $npmVersion" -ForegroundColor Green
} else {
    Write-Host "❌ npm: NOT INSTALLED" -ForegroundColor Red
}

Write-Host ""
Write-Host "🎯 CURRENT STATUS" -ForegroundColor Yellow
Write-Host "=================" -ForegroundColor Yellow

if ((Test-Path ".git") -and (Test-Path "server.js") -and (Test-Path "package.json")) {
    Write-Host "✅ Ready for deployment" -ForegroundColor Green
    Write-Host ""
    Write-Host "🚀 NEXT STEPS:" -ForegroundColor Cyan
    Write-Host "1. Access your cPanel" -ForegroundColor White
    Write-Host "2. Set up Node.js application (version 20.19.2)" -ForegroundColor White
    Write-Host "3. Upload code or connect GitHub" -ForegroundColor White
    Write-Host "4. Set environment variables" -ForegroundColor White
    Write-Host "5. Run: npm install --production && npm run build" -ForegroundColor White
    Write-Host "6. Start the application" -ForegroundColor White
    Write-Host ""
    Write-Host "📖 For detailed instructions, check: DEPLOY_NOW.md" -ForegroundColor Cyan
} else {
    Write-Host "❌ Not ready for deployment" -ForegroundColor Red
    Write-Host "Missing required files. Please check the errors above." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "💡 UNDERSTANDING 'NOT AVAILABLE' STATUS" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow
Write-Host "The 'Not available' deployment information is NORMAL" -ForegroundColor Green
Write-Host "This means your app hasn't been deployed to cPanel yet." -ForegroundColor Cyan
Write-Host ""
Write-Host "After successful deployment, you'll see:" -ForegroundColor Cyan
Write-Host "- Last Deployed on: [Date]" -ForegroundColor White
Write-Host "- Last Deployed SHA: [Commit hash]" -ForegroundColor White
Write-Host "- Author: [Your name]" -ForegroundColor White
Write-Host "- Commit Date: [Commit timestamp]" -ForegroundColor White
Write-Host ""
Write-Host "This information only appears AFTER you deploy to cPanel!" -ForegroundColor Yellow
Write-Host ""
