# Complete cPanel Deployment Guide

## Quick Setup Checklist

### 1. cPanel Configuration
- [ ] Node.js version 20.19.2 selected
- [ ] Application root set to `public_html`
- [ ] Startup file set to `server.js`
- [ ] Environment variables configured

### 2. GitHub Integration
- [ ] Repository connected to cPanel
- [ ] Auto-deployment enabled (if desired)
- [ ] Webhook configured (optional)

### 3. Environment Variables
Add these in cPanel → Node.js → Environment Variables:

```
NODE_ENV=production
PORT=3000
NEXT_PUBLIC_FIREBASE_API_KEY=your_actual_key
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=your_project.firebaseapp.com
NEXT_PUBLIC_FIREBASE_PROJECT_ID=your_project_id
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=your_project.appspot.com
NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=123456789
NEXT_PUBLIC_FIREBASE_APP_ID=1:123456789:web:abcdef
NEXT_PUBLIC_FIREBASE_MEASUREMENT_ID=G-ABCDEFGHIJ
GOOGLE_API_KEY=your_google_api_key
```

## Deployment Methods

### Method 1: Automatic GitHub Deployment (Recommended)

1. **Connect GitHub Repository:**
   - In cPanel, go to "Git Version Control"
   - Click "Create" 
   - Repository URL: `https://github.com/Bodymobarez/mokawlat.git`
   - Branch: `master`
   - Repository Path: `public_html` (or your app directory)

2. **Enable Auto-Deployment:**
   - Check "Enable Pull on Deploy"
   - Set deployment script path: `deploy.sh`

3. **Configure Webhook (Optional):**
   - In GitHub repository settings → Webhooks
   - Payload URL: `https://yourdomain.com/webhook.php`
   - Content type: `application/json`
   - Secret: Set a secure secret
   - Events: Just the push event

### Method 2: Manual Deployment

1. **Upload Files:**
   - Upload all files to `public_html` via File Manager
   - Or use FTP client

2. **Run Commands in Terminal:**
   ```bash
   cd public_html
   npm install --production
   npm run build
   ```

3. **Start Application:**
   - Go to Node.js in cPanel
   - Click "Restart" or "Start"

## Post-Deployment Verification

1. **Check Application Status:**
   - In cPanel → Node.js → Check if app is running
   - Should show "Started" status

2. **Test Your Application:**
   - Visit your domain
   - Check console for any errors
   - Test key functionality

3. **Monitor Logs:**
   - Check error logs in cPanel → Error Logs
   - Monitor application logs

## Common Issues & Solutions

### Build Fails
- Check Node.js version matches package.json
- Verify all dependencies are installed
- Check environment variables are set

### Application Won't Start
- Ensure `server.js` is the startup file
- Check port configuration
- Verify file permissions

### Environment Variables Not Working
- Double-check variable names (case-sensitive)
- Ensure values don't have quotes in cPanel
- Restart Node.js app after changes

### Firebase Connection Issues
- Verify all Firebase config variables
- Check Firebase project settings
- Ensure API keys are valid

## Maintenance

### Updating the Application
1. Push changes to GitHub master branch
2. If auto-deployment is enabled, changes deploy automatically
3. Otherwise, manually pull changes and rebuild

### Monitoring
- Check application logs regularly
- Monitor resource usage
- Keep dependencies updated

### Backup
- Regular backups of your application
- Database backups (if applicable)
- Environment configuration backup

## Performance Optimization

1. **Enable Compression:**
   - Already configured in `next.config.js`

2. **Optimize Images:**
   - Use Next.js Image component
   - Configure image domains properly

3. **Caching:**
   - Leverage cPanel's built-in caching
   - Configure CDN if needed

## Security Considerations

1. **Environment Variables:**
   - Never commit sensitive keys to repository
   - Use strong, unique secrets

2. **Webhook Security:**
   - Set up webhook secret verification
   - Limit webhook access

3. **Regular Updates:**
   - Keep Node.js version updated
   - Update dependencies regularly

## Support

If you encounter issues:
1. Check cPanel error logs
2. Review Node.js application logs
3. Verify all configuration steps
4. Contact hosting provider if needed

---

**Note:** Replace placeholder values with your actual configuration details before deployment.
