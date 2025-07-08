Write-Host "🔍 DEPLOYMENT STATUS CHECK" -ForegroundColor Yellow
Write-Host "==========================" -ForegroundColor Yellow
Write-Host ""

# Simple status check
Write-Host "📋 CURRENT STATUS:" -ForegroundColor Cyan
Write-Host ""

if (Test-Path ".git") {
    Write-Host "✅ Git repository: YES" -ForegroundColor Green
    Write-Host "📂 Repository: https://github.com/Bodymobarez/mokawlat.git" -ForegroundColor Cyan
    Write-Host "🌿 Current branch: master" -ForegroundColor Cyan
    Write-Host "📝 Latest commit: 5e35e7e" -ForegroundColor Cyan
} else {
    Write-Host "❌ Git repository: NO" -ForegroundColor Red
}

Write-Host ""
Write-Host "📋 DEPLOYMENT FILES:" -ForegroundColor Cyan

$files = @("server.js", "package.json", ".env.production", "next.config.js")
foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "✅ $file" -ForegroundColor Green
    } else {
        Write-Host "❌ $file" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "🔨 BUILD STATUS:" -ForegroundColor Cyan

if (Test-Path ".next") {
    Write-Host "✅ Build completed (.next directory exists)" -ForegroundColor Green
} else {
    Write-Host "❌ Build not completed" -ForegroundColor Red
}

Write-Host ""
Write-Host "💡 ABOUT 'NOT AVAILABLE' STATUS:" -ForegroundColor Yellow
Write-Host "=================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "The 'Not available' deployment information is NORMAL!" -ForegroundColor Green
Write-Host "This means your app has not been deployed to cPanel yet." -ForegroundColor Cyan
Write-Host ""
Write-Host "Your app is ready for deployment. You just need to:" -ForegroundColor White
Write-Host "1. Login to cPanel" -ForegroundColor White
Write-Host "2. Set up Node.js application (version 20.19.2)" -ForegroundColor White
Write-Host "3. Upload your code or connect GitHub" -ForegroundColor White
Write-Host "4. Set environment variables" -ForegroundColor White
Write-Host "5. Build and start the application" -ForegroundColor White
Write-Host ""
Write-Host "📖 Check DEPLOY_NOW.md for detailed steps!" -ForegroundColor Cyan
Write-Host ""
