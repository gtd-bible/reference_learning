import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

Future<void> iEnterTextIntoTheReferenceInput(PatrolTester $, String text) async {
  await $('ReferenceInput').enterText(text);
}
