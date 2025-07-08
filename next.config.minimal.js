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
  
  // Optimize for cPanel hosting with severe memory constraints
  experimental: {
    outputFileTracingRoot: process.cwd(),
    // Disable all experimental features to save memory
    craCompat: false,
    esmExternals: false,
    serverComponentsExternalPackages: [
      '@genkit-ai/core',
      '@genkit-ai/googleai',
      '@genkit-ai/ai',
      '@opentelemetry/sdk-node',
      '@opentelemetry/instrumentation',
    ],
  },
  
  // Custom server configuration
  poweredByHeader: false,
  
  // Compression and performance
  compress: true,
  
  // Webpack optimizations for extreme low memory
  webpack: (config, { dev, isServer }) => {
    // Completely exclude problematic packages from the build
    config.externals = [
      ...(config.externals || []),
      {
        // Exclude Genkit AI packages entirely
        '@genkit-ai/core': 'commonjs @genkit-ai/core',
        '@genkit-ai/googleai': 'commonjs @genkit-ai/googleai',
        '@genkit-ai/ai': 'commonjs @genkit-ai/ai',
        // Exclude OpenTelemetry packages
        '@opentelemetry/sdk-node': 'commonjs @opentelemetry/sdk-node',
        '@opentelemetry/instrumentation': 'commonjs @opentelemetry/instrumentation',
        '@opentelemetry/exporter-jaeger': 'commonjs @opentelemetry/exporter-jaeger',
      },
    ];

    // Aggressive memory optimization
    config.optimization = {
      ...config.optimization,
      minimize: !dev,
      splitChunks: {
        chunks: 'all',
        minSize: 20000,
        maxSize: 250000,
        cacheGroups: {
          vendor: {
            test: /[\\/]node_modules[\\/]/,
            name: 'vendors',
            chunks: 'all',
            priority: 10,
          },
          common: {
            minChunks: 2,
            chunks: 'all',
            priority: 5,
            reuseExistingChunk: true,
          },
        },
      },
    };

    // Resolve aliases to prevent loading heavy modules
    config.resolve.alias = {
      ...config.resolve.alias,
      '@genkit-ai/core': require.resolve('./src/ai/genkit.minimal.ts'),
      '@genkit-ai/googleai': require.resolve('./src/ai/genkit.minimal.ts'),
      '@genkit-ai/ai': require.resolve('./src/ai/genkit.minimal.ts'),
    };

    // Ignore problematic modules
    config.ignoreWarnings = [
      {
        module: /node_modules\/@genkit-ai/,
      },
      {
        module: /node_modules\/@opentelemetry/,
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
