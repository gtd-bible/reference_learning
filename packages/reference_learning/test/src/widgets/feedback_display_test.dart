import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reference_learning/src/widgets/feedback_display.dart';

void main() {
  group('FeedbackDisplay', () {
    testWidgets('shows nothing when isCorrect is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: FeedbackDisplay())),
      );

      expect(find.byType(SizedBox), findsOneWidget); // SizedBox.shrink()
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('shows "Correct!" when isCorrect is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: FeedbackDisplay(isCorrect: true)),
        ),
      );

      expect(find.text('Correct!'), findsOneWidget);
      expect(find.byType(SizedBox), findsNothing);
    });

    testWidgets('shows "Incorrect." when isCorrect is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: FeedbackDisplay(isCorrect: false)),
        ),
      );

      expect(find.text('Incorrect.'), findsOneWidget);
      expect(
        find.text('The correct reference was: Gen 1:1'),
        findsNothing,
      ); // Should not display correct ref by default
    });

    testWidgets(
      'shows correct reference when isCorrect is false and correctReference is provided',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: FeedbackDisplay(
                isCorrect: false,
                correctReference: 'Gen 1:1',
              ),
            ),
          ),
        );

        expect(find.text('Incorrect.'), findsOneWidget);
        expect(find.text('The correct reference was: Gen 1:1'), findsOneWidget);
      },
    );
  });
}
