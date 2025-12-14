import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reference_learning/src/widgets/verse_display.dart';

void main() {
  group('VerseDisplay', () {
    testWidgets('displays the provided verse text', (
      WidgetTester tester,
    ) async {
      const testVerse = 'This is a test verse.';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: VerseDisplay(verseText: testVerse)),
        ),
      );

      expect(find.text(testVerse), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('uses headlineSmall text style', (WidgetTester tester) async {
      const testVerse = 'Another test verse.';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: VerseDisplay(verseText: testVerse)),
          theme: ThemeData(
            textTheme: const TextTheme(
              headlineSmall: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testVerse));
      expect(textWidget.style?.fontSize, 24.0);
      expect(textWidget.style?.color, Colors.blue);
    });
  });
}
