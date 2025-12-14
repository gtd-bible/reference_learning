import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

Future<void> iTapTheToggleReferenceVisibilityButton(PatrolTester $) async {
  await $('Toggle Reference Visibility').tap();
}
