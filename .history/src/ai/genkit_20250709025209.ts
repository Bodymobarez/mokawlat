// Temporary AI-free build configuration for cPanel deployment
// This completely disables AI features to reduce memory usage during build

// Export a dummy model for compatibility
export const geminiPro = {
  name: 'gemini-pro',
  generate: async () => ({
    text: 'AI features are temporarily disabled for deployment',
  }),
};
