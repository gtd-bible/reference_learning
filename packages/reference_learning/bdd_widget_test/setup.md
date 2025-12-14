# `bdd_widget_test` Setup Guide for `reference_learning`

This guide details the necessary steps to set up and configure `bdd_widget_test` within the `reference_learning` package, along with its dependencies `patrol` and `patrol_finders`.

## 1. Add Dependencies

First, add the required dependencies to your `pubspec.yaml` file. Use the `pub` tool to add them:

```bash
pub add bdd_widget_test --dev
pub add patrol --dev
pub add patrol_finders --dev
```

This will add `bdd_widget_test`, `patrol`, and `patrol_finders` as dev dependencies.

## 2. Configure `build.yaml`

Create a `build.yaml` file in the root of your package (`packages/reference_learning/build.yaml`) and add the following configuration:

```yaml
targets:
  $default:
    builders:
      bdd_widget_test|feature_builder:
        generate_for:
          - test/features/**.feature
        options:
          step_file_path: test/step/
          ignore_abstract_steps: true
```

This configuration tells `bdd_widget_test` where to find your feature files and where to generate the step definition files.

## 3. Create Step Definition Files

`bdd_widget_test` will look for step definition files in the path specified by `step_file_path` in `build.yaml` (in this case, `test/step/`). You'll need to create a Dart file for each step you define in your `.feature` files.

For example, for a Gherkin step like `Then I see text "Some Text"`, you would create a file `test/step/i_see_text.dart` with content similar to:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

Future<void> iSeeText(PatrolTester $, String text) async {
  expect($(text), findsOneWidget);
}
```

The `bdd_widget_test` tool (version 2.1.3) did not generate parameterized steps as expected in previous attempts. For parameterized steps, you need to manually define the step function that accepts the parameters. For example:

```dart
// test/step/i_enter_text_into_the_input_field.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

Future<void> iEnterTextIntoTheInputField(PatrolTester $, String text, String fieldName) async {
  await $(fieldName).enterText(text);
}
```

Then in your `.feature` file:

```gherkin
When I enter "Hello" into the "Username" input field
```

## 4. Generate Test Code

After creating your `.feature` files and initial step definitions, run the build runner to generate the Dart test files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

This will create `.feature.dart` files alongside your `.feature` files (e.g., `test/features/learn_reference.feature.dart`).

## 5. Run Tests

To run your BDD widget tests, use the `flutter test` command, specifying the directory where your generated test files reside:

```bash
flutter test test/features/
```

Make sure your device or emulator is running before executing tests that require UI interaction.

By following these steps, you will have a fully functional BDD testing environment for your `reference_learning` package.
