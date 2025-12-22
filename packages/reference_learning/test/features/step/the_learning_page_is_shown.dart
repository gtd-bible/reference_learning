import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';
import 'package:reference_learning/reference_learning.dart';

/// Usage: the learning page is shown
Future<void> theLearningPageIsShown(PatrolTester $) async {
  await $.pumpWidgetAndSettle(const MaterialApp(home: ReferenceLearningPage()));
}
