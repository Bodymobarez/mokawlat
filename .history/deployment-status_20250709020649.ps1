Write-Host "Deployment Status Check" -ForegroundColor Yellow
Write-Host "======================" -ForegroundColor Yellow
Write-Host ""

# Check Git repository
Write-Host "Git Status:" -ForegroundColor Cyan
if (Test-Path ".git") {
    Write-Host "  Git repository: YES" -ForegroundColor Green
    Write-Host "  Repository: https://github.com/Bodymobarez/mokawlat.git" -ForegroundColor Cyan
} else {
    Write-Host "  Git repository: NO" -ForegroundColor Red
}

Write-Host ""
Write-Host "Deployment Files:" -ForegroundColor Cyan

$files = @("server.js", "package.json", "next.config.js")
foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "  $file: YES" -ForegroundColor Green
    } else {
        Write-Host "  $file: NO" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Build Status:" -ForegroundColor Cyan

if (Test-Path ".next") {
    Write-Host "  Build completed: YES" -ForegroundColor Green
} else {
    Write-Host "  Build completed: NO" -ForegroundColor Red
}

Write-Host ""
Write-Host "IMPORTANT: About 'Not available' status" -ForegroundColor Yellow
Write-Host "=======================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "The 'Not available' deployment information is NORMAL!" -ForegroundColor Green
Write-Host "This means your app has not been deployed to cPanel yet." -ForegroundColor Cyan
Write-Host ""
Write-Host "Your app is ready for deployment. You need to:" -ForegroundColor White
Write-Host "1. Login to cPanel" -ForegroundColor White
Write-Host "2. Set up Node.js application (version 20.19.2)" -ForegroundColor White
Write-Host "3. Upload your code or connect GitHub" -ForegroundColor White
Write-Host "4. Set environment variables" -ForegroundColor White
Write-Host "5. Build and start the application" -ForegroundColor White
Write-Host ""
Write-Host "Check DEPLOY_NOW.md for detailed steps!" -ForegroundColor Cyan
