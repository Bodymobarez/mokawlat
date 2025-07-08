// Temporary AI-free build configuration for cPanel deployment
// This will disable AI features to reduce memory usage during build

// Create a minimal genkit config that doesn't load heavy dependencies
import { configureGenkit } from '@genkit-ai/core';

// Minimal configuration - no heavy plugins
configureGenkit({
  plugins: [],
  logLevel: 'error',
  enableTracingAndMetrics: false,
});

// Export a dummy model for compatibility
export const geminiPro = {
  name: 'gemini-pro',
  generate: async () => ({
    text: 'AI features are temporarily disabled for deployment',
  }),
};
