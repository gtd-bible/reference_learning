import 'package:flutter_test/flutter_test.dart';
import 'package:simple_demo/main.dart'; // Adjust import based on your app's main file

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(const ReferenceLearningDemoApp());
}