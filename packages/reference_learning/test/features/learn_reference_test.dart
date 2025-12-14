// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_learning_page_is_shown.dart';
import './step/i_see_text.dart';
import './step/i_do_not_see_text.dart';

void main() {
  group('''Reference Learning''', () {
    testWidgets('''Initial display of a verse''', (tester) async {
      await theLearningPageIsShown(tester);
      await iSeeText(tester,
          'who is the image of the invisible God, the firstborn of all creation.');
      await iDoNotSeeText(tester, 'Col 1:15');
    });
  });
}
