# 🚨 EMERGENCY DEPLOYMENT GUIDE - Memory Issues

## Current Problem
Your cPanel server is experiencing `WebAssembly.instantiate(): Out of memory` errors during the build process.

## 🔥 IMMEDIATE SOLUTIONS

### Solution 1: Use Pre-built Local Deployment

**Step 1: Build locally without AI features**
```bash
# On your local machine
cp package.minimal.json package.json
cp next.config.minimal.js next.config.js
cp src/ai/genkit.minimal.ts src/ai/genkit.ts

# Install without AI packages
npm install

# Build locally
npm run build
```

**Step 2: Upload only essential files to cPanel**
Upload these files/folders to your cPanel public_html directory:
- `.next/` folder (entire folder)
- `public/` folder  
- `server.js`
- `package.json` (the minimal version)
- `next.config.js` (the minimal version)

**Step 3: Install only production dependencies on cPanel**
```bash
# In cPanel terminal
npm install --production --no-optional
```

**Step 4: Start the application**
```bash
# In cPanel terminal
npm start
```

### Solution 2: Disable AI Features Temporarily

**Step 1: Comment out AI imports in action files**

Edit these files and comment out AI-related code:
- `src/app/(app)/iso-compliance/actions.ts`
- `src/app/(app)/projects/actions.ts`
- `src/app/(app)/suppliers/actions.ts`

**Step 2: Use minimal Genkit configuration**
```bash
# Replace the genkit config
cp src/ai/genkit.minimal.ts src/ai/genkit.ts
```

**Step 3: Build with minimal memory**
```bash
# On cPanel
NODE_OPTIONS="--max-old-space-size=512" npm run build
```

### Solution 3: Static Export (No Server)

**Step 1: Update next.config.js for static export**
```javascript
const nextConfig = {
  output: 'export',
  trailingSlash: true,
  images: {
    unoptimized: true,
  },
  // Remove all AI-related configurations
};
```

**Step 2: Build static version**
```bash
npm run build
```

**Step 3: Upload the `out/` folder contents to public_html**

## 🛠️ QUICK FIXES FOR CPANEL

### Fix 1: Increase cPanel Memory Limits
1. Go to cPanel → "Select PHP Version"
2. Set `memory_limit` to 512M
3. Set `max_execution_time` to 600
4. Save changes

### Fix 2: Use Node.js 18 (More Memory Efficient)
1. Go to cPanel → "Node.js"
2. Change version to 18.x
3. Restart the application

### Fix 3: Clear All Caches
```bash
# In cPanel terminal
rm -rf node_modules/.cache
rm -rf .next/cache
npm cache clean --force
```

## 📋 STEP-BY-STEP EMERGENCY DEPLOYMENT

**Option A: Local Build + Upload**
1. Build locally with minimal config
2. Upload `.next`, `public`, `server.js`, `package.json`
3. Install production dependencies on server
4. Start application

**Option B: Static Site**
1. Configure for static export
2. Build locally
3. Upload `out/` folder contents
4. No server needed

**Option C: Disable AI Features**
1. Use minimal package.json (without AI packages)
2. Replace genkit.ts with minimal version
3. Comment out AI code in actions
4. Build on server

## 🚀 RECOMMENDED APPROACH

I recommend **Option A** (Local Build + Upload) as it's the fastest:

1. **Locally run:**
   ```bash
   cp package.minimal.json package.json
   npm install
   npm run build
   ```

2. **Upload to cPanel:**
   - `.next/` folder
   - `public/` folder
   - `server.js`
   - `package.json`

3. **On cPanel terminal:**
   ```bash
   npm install --production
   npm start
   ```

This bypasses the memory issues entirely by doing the heavy lifting locally.

## 🔄 RESTORE AI FEATURES LATER

Once deployment is stable, you can restore AI features:
1. Upload full package.json with AI packages
2. Install AI dependencies
3. Replace genkit.ts with full version
4. Uncomment AI code in actions
5. Rebuild

## 📞 EMERGENCY CONTACT

If all else fails:
- Contact your hosting provider about memory limits
- Consider upgrading to VPS
- Use a different deployment method (Vercel, Netlify, etc.)

The key is to get your application running first, then gradually add back features!
