# cPanel Node.js Deployment Configuration

## Prerequisites
1. cPanel hosting with Node.js support
2. Node.js version 20.19.2 selected in cPanel
3. GitHub repository connected to cPanel

## Environment Setup

### Step 1: Configure Node.js in cPanel
1. Login to cPanel
2. Go to "Node.js" section
3. Select Node.js version: 20.19.2
4. Set Document Root: public_html (or your desired folder)
5. Set Application Root: public_html (same as document root)
6. Set Application Startup File: server.js

### Step 2: Set Environment Variables in cPanel
Add these environment variables in the Node.js section:

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

### Step 3: Connect GitHub Repository
1. In cPanel, go to "Git Version Control"
2. Click "Create" to add a new repository
3. Set Repository URL: https://github.com/Bodymobarez/mokawlat.git
4. Set Branch: master
5. Set Repository Path: public_html (or your application directory)

### Step 4: Deployment Commands
After connecting GitHub, set up these deployment commands in cPanel:

**Option 1: Using the shell script (recommended)**
```bash
# Make the script executable
chmod +x build-cpanel.sh

# Run the optimized build script
./build-cpanel.sh

# Start the application
npm start
```

**Option 2: Manual commands (if cross-env fails)**
```bash
# Install dependencies
npm install --production

# Set memory limits and build
export NODE_OPTIONS='--max-old-space-size=1024 --max-semi-space-size=64'
export NODE_ENV=production
npm run build

# Start the application
npm start
```

**Option 3: Direct build (minimal memory)**
```bash
# Install dependencies
npm install --production

# Build without memory optimization
npm run build

# Start the application
npm start
```

## Manual Deployment Steps (if needed)

1. Upload files to cPanel File Manager
2. Extract in your domain's public_html folder
3. Run these commands in Terminal:

```bash
cd public_html
npm install --production
npm run build
```

## Important Notes

1. Make sure `.next` folder is included in deployment
2. Ensure all environment variables are set correctly
3. The startup file should be `server.js`
4. Port will be automatically assigned by cPanel (usually 3000)
5. Make sure to exclude development dependencies in production

## Troubleshooting

- If build fails, check Node.js version matches package.json engines
- Ensure all environment variables are properly set
- Check that Firebase configuration is correct
- Verify that the startup file path is correct in cPanel settings
