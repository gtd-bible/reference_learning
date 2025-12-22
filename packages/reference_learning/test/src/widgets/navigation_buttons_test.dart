import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reference_learning/src/widgets/navigation_buttons.dart';

void main() {
  group('NavigationButtons', () {
    testWidgets('Previous button calls onPrevious callback when pressed', (
      WidgetTester tester,
    ) async {
      var previousCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NavigationButtons(
              onPrevious: () => previousCalled = true,
              onNext: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.text('Previous'));
      await tester.pump();

      expect(previousCalled, isTrue);
    });

    testWidgets('Next button calls onNext callback when pressed', (
      WidgetTester tester,
    ) async {
      var nextCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NavigationButtons(
              onPrevious: () {},
              onNext: () => nextCalled = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Next'));
      await tester.pump();

      expect(nextCalled, isTrue);
    });

    testWidgets('Previous button is disabled when hasPrevious is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NavigationButtons(
              onPrevious: () {},
              onNext: () {},
              hasPrevious: false,
            ),
          ),
        ),
      );

      final previousButton = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, 'Previous'),
      );
      expect(previousButton.onPressed, isNull);
    });

    testWidgets('Next button is disabled when hasNext is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NavigationButtons(
              onPrevious: () {},
              onNext: () {},
              hasNext: false,
            ),
          ),
        ),
      );

      final nextButton = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, 'Next'),
      );
      expect(nextButton.onPressed, isNull);
    });
  });
}
