# BDD Widget Test Setup for `reference_learning`

This directory contains resources and documentation for setting up Behavior-Driven Development (BDD) widget tests using `bdd_widget_test` within the `reference_learning` package.

## Overview

`bdd_widget_test` allows you to write tests in a human-readable Gherkin syntax (Feature files) and generate corresponding Dart test code. This approach promotes collaboration between developers, testers, and product owners, ensuring that the application behaves as expected from a user's perspective.

## Setup

For detailed instructions on setting up `bdd_widget_test` and its dependencies (`patrol`, `patrol_finders`), please refer to [`setup.md`](./setup.md).

## Running Tests

Once setup is complete, you can generate and run your BDD widget tests.

1.  **Generate Test Files:**
    Run the build runner to generate `.dart` test files from your `.feature` files:
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

2.  **Run Tests:**
    Execute the generated tests using Flutter's test command:
    ```bash
    flutter test integration_test/
    ```
    (Note: Adjust the path if your generated tests are in a different location, e.g., `test/features/`)

## Writing Feature Files

Feature files are written in Gherkin syntax and describe the behavior of your application in a clear, structured way.

Example:

```gherkin
Feature: User learns a reference
  Scenario: User submits correct reference
    Given the learning page is shown
    When I enter "John 3:16" into the reference input
    Then I see text "Correct!"
```

## Step Definitions

Each step in your feature files needs a corresponding step definition in Dart code. These definitions are functions that interact with your Flutter widgets using `patrol_finders` or standard `flutter_test` utilities.

Example (`i_see_text.dart`):

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

Future<void> iSeeText(PatrolTester $, String text) async {
  expect($(text), findsOneWidget);
}
```

## Tools Used

-   [`bdd_widget_test`](https://pub.dev/packages/bdd_widget_test): Generates Dart test code from Gherkin feature files.
-   [`patrol`](https://pub.dev/packages/patrol): A testing framework for Flutter apps that simplifies integration testing, especially for native interactions.
-   [`patrol_finders`](https://pub.dev/packages/patrol_finders): Provides powerful finders and actions for interacting with widgets in `patrol` tests, including native-aware assertions.

By following this setup, you can ensure a robust and maintainable testing suite for the `reference_learning` package.
