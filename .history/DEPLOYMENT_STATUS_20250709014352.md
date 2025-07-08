# 🚀 cPanel Deployment Status & Instructions

## Current Status
- **Last Deployment**: Not yet deployed
- **Ready for Deployment**: ✅ Yes
- **Build Status**: ✅ Successful
- **Latest Commit**: 5e35e7e
- **Branch**: master

## 📋 Pre-Deployment Checklist

### ✅ Completed
- [x] Node.js 20.19.2 configuration
- [x] cPanel deployment files created
- [x] Build process optimized
- [x] Environment variables template ready
- [x] GitHub integration files prepared

### 🔄 To Complete
- [ ] Set up cPanel Node.js application
- [ ] Configure environment variables
- [ ] Connect GitHub repository
- [ ] Deploy application

## 🎯 Step-by-Step Deployment

### Step 1: cPanel Node.js Setup
1. **Login to cPanel**
2. **Navigate to Node.js**
3. **Create New Application**:
   - Node.js version: `20.19.2`
   - Application root: `public_html` (or your domain folder)
   - Application URL: Your domain
   - Startup file: `server.js`

### Step 2: Environment Variables
Add these variables in cPanel → Node.js → Environment Variables:

```bash
NODE_ENV=production
PORT=3000

# Firebase Configuration (replace with your actual values)
NEXT_PUBLIC_FIREBASE_API_KEY=your_firebase_api_key
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=your_project_id.firebaseapp.com
NEXT_PUBLIC_FIREBASE_PROJECT_ID=your_project_id
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=your_project_id.appspot.com
NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=your_sender_id
NEXT_PUBLIC_FIREBASE_APP_ID=your_app_id
NEXT_PUBLIC_FIREBASE_MEASUREMENT_ID=your_measurement_id

# Google AI API Key (for AI features)
GOOGLE_API_KEY=your_google_api_key
```

### Step 3: GitHub Repository Connection
1. **In cPanel, go to Git Version Control**
2. **Click "Create"**
3. **Repository Settings**:
   - Repository URL: `https://github.com/Bodymobarez/mokawlat.git`
   - Branch: `master`
   - Repository Path: `public_html` (same as your Node.js app root)

### Step 4: Initial Deployment
After connecting GitHub, run these commands in cPanel Terminal:

```bash
cd public_html
npm install --production
npm run build
```

### Step 5: Start Application
1. **Go back to cPanel → Node.js**
2. **Click "Restart" or "Start"**
3. **Check Application Status** (should show "Started")

## 🔧 Deployment Commands

### For Manual Deployment:
```bash
# Navigate to your application directory
cd public_html

# Pull latest changes
git pull origin master

# Install dependencies
npm install --production

# Build the application
npm run build

# Restart the Node.js application from cPanel
```

### For Auto-Deployment Setup:
If you want automatic deployment on Git push:
1. Enable "Pull on Deploy" in cPanel Git settings
2. Set up webhook in GitHub repository settings
3. Webhook URL: `https://yourdomain.com/webhook.php`

## 📊 Post-Deployment Verification

### Check Application Status:
1. **cPanel → Node.js**: Should show "Started" status
2. **Visit your domain**: Application should load
3. **Check logs**: cPanel → Error Logs for any issues

### Test Key Features:
- [ ] Homepage loads correctly
- [ ] Authentication works (if implemented)
- [ ] AI features work (if API keys are set)
- [ ] Database connection (Firebase)
- [ ] All pages render properly

## 🐛 Troubleshooting Common Issues

### Application Won't Start:
- Check Node.js version is 20.19.2
- Verify startup file is `server.js`
- Check environment variables are set correctly
- Review error logs in cPanel

### Build Failures:
- Ensure all dependencies are installed
- Check for TypeScript errors
- Verify environment variables

### Firebase Connection Issues:
- Double-check all Firebase environment variables
- Ensure Firebase project is properly configured
- Check API keys are valid

## 📈 Deployment Metrics

Once deployed, you can track:
- **Application uptime**
- **Response times**
- **Error rates**
- **Resource usage**

## 🔄 Future Deployments

For subsequent deployments:
1. **Push changes to GitHub**
2. **In cPanel Terminal**: `git pull origin master`
3. **Run**: `npm install --production && npm run build`
4. **Restart Node.js app** in cPanel

## 📞 Support

If you encounter issues:
1. Check cPanel error logs
2. Verify all configuration steps
3. Test locally first
4. Contact hosting provider if needed

---

**Ready to deploy? Follow the steps above to get your application live!** 🚀
