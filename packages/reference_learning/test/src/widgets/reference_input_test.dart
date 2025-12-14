import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reference_learning/src/widgets/reference_input.dart';

void main() {
  group('ReferenceInput', () {
    testWidgets('displays a TextField with correct label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReferenceInput(
              onChanged: (_) {},
              onSubmitted: (_) {},
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Enter Reference'), findsOneWidget);
    });

    testWidgets('calls onChanged when text is typed', (WidgetTester tester) async {
      var changedValue = '';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReferenceInput(
              onChanged: (value) => changedValue = value,
              onSubmitted: (_) {},
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'John 3:16');
      expect(changedValue, 'John 3:16');
    });

    testWidgets('calls onSubmitted when text is submitted', (WidgetTester tester) async {
      var submittedValue = '';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReferenceInput(
              onChanged: (_) {},
              onSubmitted: (value) => submittedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Romans 8:28');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(submittedValue, 'Romans 8:28');
    });

    testWidgets('updates initial value', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReferenceInput(
              onChanged: (_) {},
              onSubmitted: (_) {},
              initialValue: 'Initial',
            ),
          ),
        ),
      );

      expect(find.text('Initial'), findsOneWidget);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReferenceInput(
              onChanged: (_) {},
              onSubmitted: (_) {},
              initialValue: 'New Value',
            ),
          ),
        ),
      );
      expect(find.text('New Value'), findsOneWidget);
    });
  });
}
