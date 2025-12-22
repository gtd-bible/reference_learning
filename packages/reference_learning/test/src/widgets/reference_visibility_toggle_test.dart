import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reference_learning/src/widgets/reference_visibility_toggle.dart';

void main() {
  group('ReferenceVisibilityToggle', () {
    testWidgets('displays "Show Reference" when isVisible is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReferenceVisibilityToggle(isVisible: false, onToggle: () {}),
          ),
        ),
      );

      expect(find.text('Show Reference'), findsOneWidget);
      expect(find.text('Hide Reference'), findsNothing);
    });

    testWidgets('displays "Hide Reference" when isVisible is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReferenceVisibilityToggle(isVisible: true, onToggle: () {}),
          ),
        ),
      );

      expect(find.text('Hide Reference'), findsOneWidget);
      expect(find.text('Show Reference'), findsNothing);
    });

    testWidgets('calls onToggle callback when pressed', (
      WidgetTester tester,
    ) async {
      var toggled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReferenceVisibilityToggle(
              isVisible: false,
              onToggle: () => toggled = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Reference'));
      await tester.pump();

      expect(toggled, isTrue);
    });
  });
}
