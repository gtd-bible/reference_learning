// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_see_text.dart';

void main() {
  group('''Hello World Display''', () {
    testWidgets('''Initial app display''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, 'Skeleton Driver App');
    });
  });
}
