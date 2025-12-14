import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reference_learning/src/reference_learning_page.dart'; // Adjust import as needed

Future<void> theLearningPageIsShown(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: ReferenceLearningPage(),
    ),
  );
}
