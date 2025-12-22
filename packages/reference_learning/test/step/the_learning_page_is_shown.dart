import 'package:flutter/material.dart';
import 'package:patrol_finders/patrol_finders.dart';
import 'package:reference_learning/reference_learning.dart';

Future<void> theLearningPageIsShown(PatrolTester $) async {
  await $.pumpWidgetAndSettle(const MaterialApp(home: ReferenceLearningPage()));
}
