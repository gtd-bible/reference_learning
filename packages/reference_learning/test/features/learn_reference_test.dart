// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_finders/patrol_finders.dart';

import './../step/the_learning_page_is_shown.dart';
import './../step/i_see_text.dart';
import './../step/i_do_not_see_text.dart';
import './../step/i_enter_text_into_the_reference_input.dart';
import './../step/i_tap_the_toggle_reference_visibility_button.dart';

void main() {
  group('Reference Learning', () {
    patrolWidgetTest('Initial display of a verse', ($) async {
      await theLearningPageIsShown($);
      await iSeeText($, 'who is the image of the invisible God, the firstborn of all creation.');
      await iDoNotSeeText($, 'Col 1:15');
    });

    patrolWidgetTest('User enters correct reference', ($) async {
      await theLearningPageIsShown($);
      await iEnterTextIntoTheReferenceInput($, 'Col 1:15');
      await iSeeText($, 'Correct!');
    });

    patrolWidgetTest('User enters incorrect reference', ($) async {
      await theLearningPageIsShown($);
      await iEnterTextIntoTheReferenceInput($, 'Wrong 1:1');
      await iSeeText($, 'Incorrect.');
      await iSeeText($, 'The correct reference was: Col 1:15');
    });

    patrolWidgetTest('User toggles reference visibility', ($) async {
      await theLearningPageIsShown($);
      await iTapTheToggleReferenceVisibilityButton($);
      await iSeeText($, 'Correct Reference: Col 1:15');
      await iSeeText($, 'Hide Reference');
      await iTapTheToggleReferenceVisibilityButton($);
      await iDoNotSeeText($, 'Correct Reference: Col 1:15');
      await iSeeText($, 'Show Reference');
    });
  });
}
