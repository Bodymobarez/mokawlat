# 📋 cPanel Deployment Checklist

## Current Repository Status
- **Repository**: mokawlat
- **Owner**: Bodymobarez
- **Branch**: master
- **Latest Commit**: 5e35e7e
- **Build Status**: ✅ Ready

## 🎯 Deployment Steps

### Phase 1: cPanel Setup
- [ ] **1.1** Login to your cPanel account
- [ ] **1.2** Navigate to "Node.js" section
- [ ] **1.3** Click "Create Application"
- [ ] **1.4** Configure settings:
  - Node.js version: `20.19.2`
  - Application root: `public_html` (or your domain folder)
  - Application URL: Your domain
  - Startup file: `server.js`

### Phase 2: Environment Configuration
- [ ] **2.1** In Node.js section, click "Environment Variables"
- [ ] **2.2** Add these variables (replace with your actual values):
  ```
  NODE_ENV=production
  PORT=3000
  NEXT_PUBLIC_FIREBASE_API_KEY=your_firebase_api_key
  NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=your_project_id.firebaseapp.com
  NEXT_PUBLIC_FIREBASE_PROJECT_ID=your_project_id
  NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=your_project_id.appspot.com
  NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=your_sender_id
  NEXT_PUBLIC_FIREBASE_APP_ID=your_app_id
  NEXT_PUBLIC_FIREBASE_MEASUREMENT_ID=your_measurement_id
  GOOGLE_API_KEY=your_google_api_key
  ```

### Phase 3: Code Deployment
Choose one of these methods:

#### Method A: GitHub Integration (Recommended)
- [ ] **3A.1** In cPanel, go to "Git Version Control"
- [ ] **3A.2** Click "Create"
- [ ] **3A.3** Set repository URL: `https://github.com/Bodymobarez/mokawlat.git`
- [ ] **3A.4** Set branch: `master`
- [ ] **3A.5** Set repository path: `public_html` (same as your Node.js app root)
- [ ] **3A.6** Click "Create"

#### Method B: File Upload
- [ ] **3B.1** Download repository as ZIP
- [ ] **3B.2** Upload to cPanel File Manager
- [ ] **3B.3** Extract in your application root directory

### Phase 4: Application Build
- [ ] **4.1** Open Terminal in cPanel
- [ ] **4.2** Navigate to your application directory: `cd public_html`
- [ ] **4.3** Run: `chmod +x quick-deploy.sh`
- [ ] **4.4** Run: `./quick-deploy.sh`
- [ ] **4.5** Wait for build to complete

### Phase 5: Application Start
- [ ] **5.1** Go back to cPanel → Node.js
- [ ] **5.2** Find your application in the list
- [ ] **5.3** Click "Restart" or "Start"
- [ ] **5.4** Status should show "Started"

### Phase 6: Verification
- [ ] **6.1** Visit your domain
- [ ] **6.2** Check that the application loads
- [ ] **6.3** Test main functionality
- [ ] **6.4** Check cPanel error logs if issues occur

## 🔍 Troubleshooting

### Application Won't Start
- Check Node.js version is exactly `20.19.2`
- Verify startup file is `server.js`
- Check environment variables are set correctly
- Review cPanel error logs

### Build Errors
- Ensure all dependencies installed correctly
- Check for missing environment variables
- Verify file permissions

### Firebase Connection Issues
- Double-check all Firebase environment variables
- Ensure Firebase project is active
- Verify API keys are valid

## 📊 Expected Results

After successful deployment:
- ✅ Application status: "Started"
- ✅ Domain loads the application
- ✅ No errors in cPanel logs
- ✅ All features work as expected

## 🔄 Future Updates

For subsequent deployments:
1. Push changes to GitHub
2. In cPanel Terminal: `git pull origin master`
3. Run: `npm install --production && npm run build`
4. Restart Node.js application

## 📞 Support

If you encounter issues:
1. Check this checklist again
2. Review cPanel error logs
3. Verify all configuration steps
4. Contact your hosting provider

---

**Complete each step in order for successful deployment!** 🚀
