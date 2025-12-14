import 'package:flutter_test/flutter_test.dart';

/// Usage: I do not see {'Col 1:15'} text
Future<void> iDoNotSeeText(WidgetTester tester, String text) async {
  expect(find.text(text), findsNothing);
}
