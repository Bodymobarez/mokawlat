import {configureGenkit} from '@genkit-ai/core';
import {googleAI, geminiPro} from '@genkit-ai/googleai';

// Check if Google AI API key is available
const googleApiKey = process.env.GOOGLE_API_KEY || process.env.GOOGLE_GENAI_API_KEY;

if (!googleApiKey) {
  console.warn(
    'WARNING: GOOGLE_API_KEY or GOOGLE_GENAI_API_KEY is not defined. ' +
    'AI features will be limited. Please set proper environment variables for production deployment.'
  );
}

// Export the model instance
export { geminiPro };

// The `configureGenkit` function is used to initialize Genkit with plugins and settings.
// Optimized for low-memory environments
configureGenkit({
  plugins: [
    googleAI(),
  ],
  // Reduce logging to save memory
  logLevel: process.env.NODE_ENV === 'production' ? 'error' : 'debug',
  // Disable tracing in production to save memory
  enableTracingAndMetrics: process.env.NODE_ENV !== 'production',
});
