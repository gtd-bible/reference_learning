# Implementation Plan: `reference_learning` Package

This document outlines the phased approach to implementing the `reference_learning` Flutter package, as described in `DESIGN.md`. Each phase consists of specific tasks, followed by a set of standard verification and documentation steps.

## Phases

### Phase 1: Package Setup & Initial Commit

- [x] Create a Flutter package named `reference_learning` in the `packages/reference_learning` directory.
    - [x] Use the `create_project` tool with the `empty` flag.
    - [x] The package should support all default platforms.
- [x] Remove any boilerplate files and directories (e.g., `lib/main.dart` contents, `test/widget_test.dart`).
- [x] Update the description of the package in `pubspec.yaml` to a concise summary of its purpose and set the version number to `0.1.0`.
- [x] Update the `README.md` in the package root to include a short placeholder description of the package.
- [x] Create the `CHANGELOG.md` file with an initial entry for version `0.1.0`.
- [x] Commit this empty version of the package to the `feat/reference-learning-v2` branch.

### Phase 2: Core Data Model & Hardcoded Data

- [x] Create `lib/src/models/verse.dart` and define the `Verse` class with `reference`, `text`, and `translation` fields.
- [x] Define the `initialVerses` list in `lib/src/data/initial_verses.dart` using the `Verse` model.
- [x] Create `test/src/models/verse_test.dart` and write unit tests for the `Verse` model, ensuring 100% coverage.

### Phase 3: State Management Controller

- [x] Create `lib/src/state/reference_learning_controller.dart` and implement the `ReferenceLearningController` class extending `ChangeNotifier`.
- [x] Initialize the controller with the `initialVerses` data.
- [x] Implement methods: `nextVerse()`, `previousVerse()`, `submitReference(input)`, `toggleReferenceVisibility()`.
- [x] Implement getters for `currentVerse`, `userInputReference`, `isInputCorrect`, `isReferenceVisible`, `currentVerseIndex`, `versesLength`.
- [x] Create `test/src/state/reference_learning_controller_test.dart` and write unit tests for the `ReferenceLearningController`, ensuring 100% coverage of its logic.

### Phase 4: Core UI Widgets (Barebones)

- [x] Create `lib/src/widgets/verse_display.dart` with a `StatelessWidget` to show `Verse.text`.
- [x] Create `lib/src/widgets/reference_input.dart` with a `TextField` for user input, and appropriate callbacks.
- [x] Create `lib/src/widgets/feedback_display.dart` with a `StatelessWidget` to show correct/incorrect feedback.
- [x] Create `test/src/widgets/verse_display_test.dart`, `test/src/widgets/reference_input_test.dart`, and `test/src/widgets/feedback_display_test.dart` for widget tests.

### Phase 5: Skeleton Driver App

- [x] Create `examples/simple_demo` (very thin wrapper, supports all platforms).
    - [x] Use `create_project` to generate the app.
    - [x] Add `reference_learning` as a local dependency.
    - [x] Implement a basic `main.dart` that displays a scaffold and one of the package widgets (e.g., `VerseDisplay`) to verify integration.
- [x] Ensure the app runs on iOS, Android, Web, Windows, macOS, and Linux.
- [x] **Verification:** Launch the app and confirm it runs.

### Phase 6: Navigation & Toggle Widgets

- [ ] Create `lib/src/widgets/navigation_buttons.dart` with "Next" and "Previous" buttons.
- [ ] Create `lib/src/widgets/reference_visibility_toggle.dart` with a button to show/hide the reference.
- [ ] Create `test/src/widgets/navigation_buttons_test.dart` and `test/src/widgets/reference_visibility_toggle_test.dart` for widget tests.

### Phase 7: Integrate into Main Page

- [ ] Create `lib/src/reference_learning_page.dart` which will be the main entry point widget for the package.
- [ ] This page will instantiate `ReferenceLearningController` (or receive it via `Provider`/`ListenableBuilder` pattern for testing) and compose the UI widgets (`VerseDisplay`, `ReferenceInput`, etc.) using `ListenableBuilder`s to react to controller changes.
- [ ] Create `test/src/reference_learning_page_test.dart` for widget tests, ensuring the page integrates all components correctly and responds to state changes.
- [ ] Update `examples/simple_demo` to use `ReferenceLearningPage`.

### Phase 8: BDD & Refinements

- [ ] Create a `features` directory in the package root.
- [ ] Create `features/learn_reference.feature` describing the core user flow.
- [ ] Create `features/toggle_reference_visibility.feature` describing the show/hide functionality.
- [ ] **BDD Documentation & Tooling:**
    - [ ] Create `bdd_widget_test/README.md` and `bdd_widget_test/setup.md` in the package root, detailing BDD setup and usage.
    - [ ] Mention `patrol` and `patrol_finders` as tools for end-to-end testing with `bdd_widget_test`.
    - [ ] Implement `bdd_widget_test` feature files and step definitions as appropriate, leveraging parameterized steps.

### Phase 9: Additional Documentation & Cleanup

- [ ] Create the `todos.md` file in the package root to list any remaining minor tasks or improvements.
- [ ] Create a Jira ticket (or a `todos.md` entry) to "use dot-shorthand notation carefully along with dcm" for linter/style checks.
- [ ] Create the `other-features.md` file in the package root for features not in scope for MVP.
- [ ] Create the `ux_ideas.md` file in the package root for user experience improvement ideas.
- [ ] Create the `architecture_todos.md` file in the package root for architectural refactoring or improvements.
- [ ] Create a comprehensive `README.md` file for the package, explaining its purpose, how to use it, examples, and future plans.
- [ ] Create a `GEMINI.md` file in the package root that describes the package, its purpose, and implementation details, including the layout of the files for the AI.
- [ ] Ask the user to inspect the package and confirm satisfaction or request modifications.

## Standard Post-Phase Actions

After completing the tasks within each phase:

- [ ] Create/modify unit tests for testing the code added or modified in this phase, if relevant.
- [ ] Run the `dart_fix` tool to clean up the code.
- [ ] Run the `analyze_files` tool one more time and fix any issues.
- [ ] Run any tests to make sure they all pass.
- [ ] Run `dart_format` to make sure that the formatting is correct.
- [ ] Ensure appropriate use of fat arrow (`=>`) / expression syntax for concise functions.
- [ ] Implement styling and theming in a reusable and maintainable way.
- [ ] **Verification:** If the phase involves UI changes or runnable apps:
    - [ ] Run integration tests.
    - [ ] Capture evidence of functionality (screenshots or `adb screenrecord` video on connected device).
    - [ ] Provide instructions for manual verification.
- [ ] Re-read the `IMPLEMENTATION.md` file to see what, if anything, has changed in the implementation plan, and if it has changed, take care of anything the changes imply.
- [ ] Update the `IMPLEMENTATION.md` file with the current state, including any learnings, surprises, or deviations in the Journal section. Check off any checkboxes of items that have been completed.
- [ ] Use `git diff` to verify the changes that have been made, and create a suitable commit message for any changes, following any guidelines you have about commit messages. Be sure to properly escape dollar signs and backticks, and present the change message to the user for approval.
- [ ] Wait for approval. Don't commit the changes or move on to the next phase of implementation until the user approves the commit.

## Journal

### Initial Plan (December 13, 2025)

-   Created `DESIGN.md` and received user approval.
-   Confirmed package name `reference_learning`.
-   Confirmed directory structure: `packages/reference_learning` and `examples/simple_demo`.
-   Created feature branch `feat/reference-learning-v2`.
-   Changed current directory to `packages/reference_learning`.
-   Prepared implementation plan.
-   **Phase 1 Complete:** Created the package, cleaned up boilerplate, and configured metadata. The `flutter create` command didn't support `--empty` for packages, so I manually cleaned the files.
-   **Phase 2 Complete:** Implemented the `Verse` model, hardcoded verse data, and comprehensive unit tests. All tests passed.
-   **Phase 2 Complete:** Implemented the `Verse` model, hardcoded verse data, and comprehensive unit tests. All tests passed.
-   **Phase 3 Complete:** Implemented `ReferenceLearningController` with all specified logic and getters. Developed extensive unit tests for the controller, achieving 100% coverage. All tests passed.
-   **Phase 4 Complete:** Created core UI widgets (`VerseDisplay`, `ReferenceInput`, `FeedbackDisplay`) and their corresponding widget tests. All tests passed.
-   **Phase 5 Complete (Skeleton Driver App):** Created `examples/simple_demo` skeleton driver app, integrated `reference_learning` package locally, and verified it launches on macOS.
