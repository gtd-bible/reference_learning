import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reference_learning/src/reference_learning_page.dart';

Future<void> theLearningPageIsShown(WidgetTester tester) async {
  debugPrint('--- Entering theLearningPageIsShown step ---');
  debugPrint('Attempting to pump widget: MaterialApp(home: ReferenceLearningPage())');
  await tester.pumpWidget(
    const MaterialApp(
      home: ReferenceLearningPage(),
    ),
  );
  debugPrint('--- Successfully pumped widget ---');
  await tester.pumpAndSettle();
  debugPrint('--- pumpAndSettle completed ---');
}