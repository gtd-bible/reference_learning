import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';
import 'package:reference_learning/src/widgets/reference_input.dart';

Future<void> iEnterTextIntoTheReferenceInput(PatrolTester $, String text) async {
  await $(ReferenceInput).enterText(text);
  await $(Icons.send).tap();
}
