
/** @type {import('next').NextConfig} */
const nextConfig = {
  /* config options here */
  typescript: {
    ignoreBuildErrors: true,
  },
  eslint: {
    ignoreDuringBuilds: true,
  },
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'placehold.co',
        port: '',
        pathname: '/**',
      },
      {
        protocol: 'https',
        hostname: 'firebasestorage.googleapis.com',
        port: '',
        pathname: '/**',
      }
    ],
  },
  // Production optimizations for cPanel
  output: 'standalone',
  distDir: '.next',
  trailingSlash: false,
  
  // Optimize for cPanel hosting
  experimental: {
    outputFileTracingRoot: process.cwd(),
  },
  
  // Custom server configuration
  poweredByHeader: false,
  
  // Compression and performance
  compress: true,
  
  // Environment variables validation
  env: {
    CUSTOM_KEY: process.env.CUSTOM_KEY,
  },
};

module.exports = nextConfig;
