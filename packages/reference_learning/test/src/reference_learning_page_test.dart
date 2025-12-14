import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reference_learning/src/models/verse.dart';
import 'package:reference_learning/src/reference_learning_page.dart';
import 'package:reference_learning/src/state/reference_learning_controller.dart';
import 'package:reference_learning/src/widgets/feedback_display.dart';
import 'package:reference_learning/src/widgets/navigation_buttons.dart';
import 'package:reference_learning/src/widgets/reference_input.dart';
import 'package:reference_learning/src/widgets/reference_visibility_toggle.dart';
import 'package:reference_learning/src/widgets/verse_display.dart';

void main() {
  group('ReferenceLearningPage', () {
    final List<Verse> testVerses = [
      const Verse(reference: 'V1', text: 'Text 1', translation: 'T1'),
      const Verse(reference: 'V2', text: 'Text 2', translation: 'T2'),
      const Verse(reference: 'V3', text: 'Text 3', translation: 'T3'),
    ];

    testWidgets('displays the first verse and input field', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ReferenceLearningPage(
            controller: ReferenceLearningController(verses: testVerses),
          ),
        ),
      );

      expect(find.byType(VerseDisplay), findsOneWidget);
      expect(find.text('Text 1'), findsOneWidget);
      expect(find.byType(ReferenceInput), findsOneWidget);
      expect(find.byType(FeedbackDisplay), findsOneWidget);
      expect(find.byType(NavigationButtons), findsOneWidget);
      expect(find.byType(ReferenceVisibilityToggle), findsOneWidget);
    });

    testWidgets('navigates to the next verse', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ReferenceLearningPage(
            controller: ReferenceLearningController(verses: testVerses),
          ),
        ),
      );

      expect(find.text('Text 1'), findsOneWidget);
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      expect(find.text('Text 2'), findsOneWidget);
    });

    testWidgets('navigates to the previous verse', (WidgetTester tester) async {
      final controller = ReferenceLearningController(verses: testVerses);
      // Manually advance controller to allow 'Previous'
      controller.nextVerse();

      await tester.pumpWidget(
        MaterialApp(home: ReferenceLearningPage(controller: controller)),
      );

      expect(find.text('Text 2'), findsOneWidget);
      await tester.tap(find.text('Previous'));
      await tester.pumpAndSettle();
      expect(find.text('Text 1'), findsOneWidget);
    });

    testWidgets('submits reference and shows feedback', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ReferenceLearningPage(
            controller: ReferenceLearningController(verses: testVerses),
          ),
        ),
      );

      // Correct reference
      await tester.enterText(find.byType(ReferenceInput), 'V1');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('Correct!'), findsOneWidget);

      // Incorrect reference
      await tester.enterText(find.byType(ReferenceInput), 'Wrong');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('Incorrect.'), findsOneWidget);
      expect(find.text('The correct reference was: V1'), findsOneWidget);
    });

    testWidgets('toggles reference visibility', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ReferenceLearningPage(
            controller: ReferenceLearningController(verses: testVerses),
          ),
        ),
      );

      expect(find.text('Show Reference'), findsOneWidget);
      expect(find.text('Correct Reference: V1'), findsNothing);

      await tester.tap(find.text('Show Reference'));
      await tester.pump();
      expect(find.text('Hide Reference'), findsOneWidget);
      expect(find.text('Correct Reference: V1'), findsOneWidget);

      await tester.tap(find.text('Hide Reference'));
      await tester.pump();
      expect(find.text('Show Reference'), findsOneWidget);
      expect(find.text('Correct Reference: V1'), findsNothing);
    });
  });
}
