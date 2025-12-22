# GEMINI.md - Agent Internal Notes for `reference_learning` package

This document tracks the internal state, plans, and issues encountered by the Gemini agent during the development of the `reference_learning` package.

## Current High-Level Plan:

- Continue implementing phases as outlined in `IMPLEMENTATION.md`.
- Focus on atomic commits for each logical step.
- Ensure appropriate test coverage (unit/widget) for new code.
- Address specific user directives, such as BDD setup and documentation.

## Open Issues / Challenges:

- **Git State Management:** Maintaining a perfectly clean and atomic commit history has proven challenging due to previous `git reset` and `pub add` interactions. Extreme care will be taken in future `git add` and `git commit` operations.
- **BDD `bdd_widget_test` Parameterized Steps:** The `bdd_widget_test` tool (version 2.1.3) did not generate parameterized steps as expected in previous attempts. A new strategy for this will be needed when we reach the BDD phase.

## Current Commit Timeline (on `feat/reference-learning-v2`):

- `0612584` `feat: initial setup of reference_learning package MVP` (Phase 1 Complete)
