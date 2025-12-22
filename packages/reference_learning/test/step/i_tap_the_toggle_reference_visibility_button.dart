import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';
import 'package:reference_learning/src/widgets/reference_visibility_toggle.dart';

Future<void> iTapTheToggleReferenceVisibilityButton(PatrolTester $) async {
  await $(ReferenceVisibilityToggle).tap();
}
