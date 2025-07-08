
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
  
  // Optimize for cPanel hosting with memory constraints
  experimental: {
    outputFileTracingRoot: process.cwd(),
    // Reduce memory usage during build
    craCompat: false,
    esmExternals: false,
    // Disable WebAssembly compilation for problematic packages
    webVitalsAttribution: ['CLS', 'FCP'],
  },
  
  // Custom server configuration
  poweredByHeader: false,
  
  // Compression and performance
  compress: true,
  
  // Webpack optimizations for low memory
  webpack: (config, { dev, isServer }) => {
    // Reduce memory usage during build
    config.optimization = {
      ...config.optimization,
      minimize: !dev,
      splitChunks: {
        ...config.optimization.splitChunks,
        chunks: 'all',
        cacheGroups: {
          vendor: {
            test: /[\\/]node_modules[\\/]/,
            name: 'vendors',
            chunks: 'all',
            priority: 10,
          },
          genkit: {
            test: /[\\/]node_modules[\\/]@genkit-ai[\\/]/,
            name: 'genkit',
            chunks: 'all',
            priority: 20,
          },
        },
      },
    };

    // Disable WebAssembly for problematic packages
    config.resolve.alias = {
      ...config.resolve.alias,
      '@genkit-ai/core/lib/tracing': false,
      '@genkit-ai/firebase': false,
      '@opentelemetry/exporter-jaeger': false,
    };

    // Exclude problematic modules that cause memory issues
    config.externals = [
      ...(config.externals || []),
      {
        '@genkit-ai/firebase': false,
        '@opentelemetry/exporter-jaeger': false,
      },
    ];

    return config;
  },
  
  // Environment variables validation
  env: {
    CUSTOM_KEY: process.env.CUSTOM_KEY,
  },
};

module.exports = nextConfig;
