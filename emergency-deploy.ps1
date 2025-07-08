# Emergency Deployment Script for Windows
Write-Host "🚨 EMERGENCY DEPLOYMENT - DISABLING AI FEATURES" -ForegroundColor Red
Write-Host "This will temporarily disable AI features to reduce memory usage" -ForegroundColor Yellow
Write-Host ""

# Create backups
Write-Host "📋 Creating backups..." -ForegroundColor Cyan
Copy-Item "package.json" "package.json.backup" -Force
Copy-Item "next.config.js" "next.config.js.backup" -Force
Copy-Item "src\ai\genkit.ts" "src\ai\genkit.ts.backup" -Force

# Switch to minimal configuration
Write-Host "🔧 Switching to minimal configuration..." -ForegroundColor Cyan
Copy-Item "package.minimal.json" "package.json" -Force
Copy-Item "next.config.minimal.js" "next.config.js" -Force
Copy-Item "src\ai\genkit.minimal.ts" "src\ai\genkit.ts" -Force

# Clear cache
Write-Host "🧹 Clearing build cache..." -ForegroundColor Cyan
Remove-Item -Recurse -Force ".next" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "node_modules\.cache" -ErrorAction SilentlyContinue

# Install minimal dependencies
Write-Host "📦 Installing minimal dependencies..." -ForegroundColor Cyan
npm install --production --no-optional

# Build with minimal setup
Write-Host "🔨 Building with minimal memory footprint..." -ForegroundColor Cyan
npm run build

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Build completed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📁 Files ready for upload to cPanel:" -ForegroundColor Yellow
    Write-Host "   - .next\ folder (entire folder)" -ForegroundColor White
    Write-Host "   - public\ folder" -ForegroundColor White
    Write-Host "   - server.js" -ForegroundColor White
    Write-Host "   - package.json (minimal version)" -ForegroundColor White
    Write-Host ""
    Write-Host "On cPanel, run: npm install --production; npm start" -ForegroundColor Green
} else {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    Write-Host "Try the static export option instead." -ForegroundColor Yellow
}

# Restore original files
Write-Host "♻️ Restoring original configuration..." -ForegroundColor Cyan
Copy-Item "package.json.backup" "package.json" -Force
Copy-Item "next.config.js.backup" "next.config.js" -Force
Copy-Item "src\ai\genkit.ts.backup" "src\ai\genkit.ts" -Force

Write-Host ""
Write-Host "Remember to enable AI features after deployment stabilizes!" -ForegroundColor Yellow
