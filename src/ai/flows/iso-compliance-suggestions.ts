
'use server';

/**
 * @fileOverview Provides AI-driven suggestions for improving ERP operations to align with ISO 9001 standards.
 *
 * - suggestISOComplianceImprovements - A function that suggests improvements for ISO 9001 compliance.
 * - SuggestISOComplianceImprovementsInput - The input type for the suggestISOComplianceImprovements function.
 * - SuggestISOComplianceImprovementsOutput - The return type for the suggestISOComplianceImprovements function.
 */

import {ai} from '@/ai/genkit';
import {z} from 'genkit';

const SuggestISOComplianceImprovementsInputSchema = z.object({
  erpDescription: z
    .string()
    .describe('A detailed description of the current ERP operations.'),
});
export type SuggestISOComplianceImprovementsInput = z.infer<
  typeof SuggestISOComplianceImprovementsInputSchema
>;

const SuggestISOComplianceImprovementsOutputSchema = z.object({
  suggestions: z
    .array(z.string())
    .describe(
      'A list of actionable suggestions for improving ERP operations to better align with ISO 9001 standards, focusing on feedback collection and continuous improvement.'
    ),
});
export type SuggestISOComplianceImprovementsOutput = z.infer<
  typeof SuggestISOComplianceImprovementsOutputSchema
>;

export async function suggestISOComplianceImprovements(
  input: SuggestISOComplianceImprovementsInput
): Promise<SuggestISOComplianceImprovementsOutput> {
  return suggestISOComplianceImprovementsFlow(input);
}

const prompt = ai.definePrompt({
  name: 'suggestISOComplianceImprovementsPrompt',
  input: {schema: SuggestISOComplianceImprovementsInputSchema},
  output: {schema: SuggestISOComplianceImprovementsOutputSchema},
  prompt: `You are an expert in ISO 9001 compliance and ERP systems.

  Based on the following description of current ERP operations, provide a list of actionable suggestions for improvement. Focus on changes that will facilitate the collection of feedback and continuous improvement, in line with ISO 9001 standards. Suggestions should be specific and practical.

  ERP Operations Description: {{{erpDescription}}}
  `,
});

const suggestISOComplianceImprovementsFlow = ai.defineFlow(
  {
    name: 'suggestISOComplianceImprovementsFlow',
    inputSchema: SuggestISOComplianceImprovementsInputSchema,
    outputSchema: SuggestISOComplianceImprovementsOutputSchema,
  },
  async input => {
    const {output} = await prompt(input);
    return output!;
  }
);
