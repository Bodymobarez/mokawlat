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
configureGenkit({
  plugins: [
    googleAI(),
  ],
  // We can enable logging to help with debugging.
  logLevel: 'debug',
  // This is recommended for production environments.
  enableTracingAndMetrics: true,
});
