# 🚨 Memory Optimization Guide for cPanel Deployment

## Problem: WebAssembly Memory Issues

The error `WebAssembly.instantiate(): Out of memory: Cannot allocate Wasm memory for new instance` occurs when the hosting server has limited memory resources.

## ✅ Solutions Implemented

### 1. Memory-Optimized Build Configuration

**Updated `next.config.js`:**
- Disabled problematic WebAssembly modules
- Added webpack optimizations for code splitting
- Excluded memory-intensive packages
- Reduced build-time memory usage

### 2. Memory-Limited Node.js Scripts

**Updated `package.json` scripts:**
```json
{
  "build": "NODE_OPTIONS='--max-old-space-size=1024' next build",
  "build:cpanel": "NODE_OPTIONS='--max-old-space-size=1024 --max-semi-space-size=64' next build"
}
```

### 3. AI Framework Optimizations

**Genkit Configuration:**
- Disabled tracing in production
- Reduced logging levels
- Optimized plugin initialization

## 🛠️ Deployment Steps for Memory-Constrained Environments

### Step 1: Use Memory-Optimized Build
```bash
# In cPanel terminal or local build
npm run build:cpanel
```

### Step 2: Alternative - Build Locally
If cPanel still has memory issues:
```bash
# Build locally with optimizations
npm run build:cpanel

# Upload only the built files:
# - .next/ folder
# - public/ folder  
# - package.json
# - server.js
```

### Step 3: Install Dependencies on Server
```bash
# Install only production dependencies
npm ci --production --no-optional

# Or install with memory limits
NODE_OPTIONS="--max-old-space-size=512" npm install --production
```

### Step 4: Environment Variables
Create `.env.production` with minimal configuration:
```bash
NODE_ENV=production
NEXT_PUBLIC_FIREBASE_API_KEY=your_actual_key
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=your_actual_domain
NEXT_PUBLIC_FIREBASE_PROJECT_ID=your_actual_project_id
# ... other required variables
```

## 🔧 Additional Memory Optimization Tips

### For cPanel Hosting:
1. **Increase memory limits in cPanel:**
   - Go to "Select PHP Version"
   - Set `memory_limit` to 256M or 512M
   - Set `max_execution_time` to 300

2. **Use Node.js version 18 or 20:**
   - Better memory management
   - Reduced WebAssembly overhead

3. **Build in stages:**
   - Install dependencies first
   - Build in a separate step
   - Clean up after build

### Alternative Deployment Methods:

#### Method 1: Pre-built Upload
```bash
# Local build
npm run build:cpanel

# Upload these files to cPanel:
# - .next/
# - public/
# - server.js
# - package.json

# On cPanel, only install production dependencies
npm ci --production
```

#### Method 2: GitHub Actions Build
Set up GitHub Actions to build and deploy:
```yaml
name: Build and Deploy
on:
  push:
    branches: [main]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '20'
          cache: 'npm'
      - run: npm ci
      - run: npm run build:cpanel
      - name: Deploy to cPanel
        # Use cPanel deployment action
```

## 🚨 If Issues Persist

### Option 1: Disable AI Features Temporarily
Comment out AI-related imports in:
- `src/ai/genkit.ts`
- `src/app/(app)/*/actions.ts`

### Option 2: Use Static Export
```javascript
// next.config.js
const nextConfig = {
  output: 'export',
  trailingSlash: true,
  images: {
    unoptimized: true,
  },
};
```

### Option 3: Contact Hosting Provider
- Request memory limit increase
- Upgrade to higher-tier hosting plan
- Switch to VPS or dedicated server

## 📊 Memory Usage Monitor

Add to your deployment script:
```bash
# Monitor memory during build
echo "Memory usage before build:"
free -h

# Build with monitoring
npm run build:cpanel

echo "Memory usage after build:"
free -h
```

## ✅ Success Indicators

Your deployment is successful when:
- Build completes without memory errors
- All 40 pages generate successfully
- Server starts without crashes
- Application loads in browser

## 📞 Support

If you continue to experience memory issues:
1. Check your hosting provider's memory limits
2. Consider upgrading your hosting plan
3. Use the pre-built upload method
4. Contact your hosting provider for Node.js memory optimization

Remember: The memory optimizations are now in place, and your build should work on most shared hosting environments!
