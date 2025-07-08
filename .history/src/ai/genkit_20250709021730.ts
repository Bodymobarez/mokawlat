import {configureGenkit} from '@genkit-ai/core';
import {googleAI} from '@genkit-ai/googleai';

// Check if Google AI API key is available
const googleApiKey = process.env.GOOGLE_API_KEY || process.env.GOOGLE_GENAI_API_KEY;

if (!googleApiKey) {
  console.warn(
    'WARNING: GOOGLE_API_KEY or GOOGLE_GENAI_API_KEY is not defined. ' +
    'AI features will be limited. Please set proper environment variables for production deployment.'
  );
}

// In Genkit v0.x, we define and export the model instances we want to use.
export const geminiPro = googleAI.model('gemini-pro');

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
