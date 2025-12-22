import 'package:flutter_test/flutter_test.dart';
import 'package:reference_learning/src/data/initial_verses.dart';
import 'package:reference_learning/src/models/verse.dart';
import 'package:reference_learning/src/state/reference_learning_controller.dart';

void main() {
  group('ReferenceLearningController', () {
    late ReferenceLearningController controller;
    final List<Verse> testVerses = [
      const Verse(reference: 'V1', text: 'Text 1', translation: 'T1'),
      const Verse(reference: 'V2', text: 'Text 2', translation: 'T2'),
      const Verse(reference: 'V3', text: 'Text 3', translation: 'T3'),
    ];

    setUp(() {
      controller = ReferenceLearningController(verses: testVerses);
    });

    test('controller initializes with the first verse', () {
      expect(controller.currentVerse, testVerses.first);
      expect(controller.userInputReference, '');
      expect(controller.isInputCorrect, isNull);
      expect(controller.isReferenceVisible, isFalse);
      expect(controller.currentVerseIndex, 0);
      expect(controller.versesLength, testVerses.length);
    });

    test(
      'controller throws StateError if initialized with empty verse list',
      () {
        expect(
          () => ReferenceLearningController(verses: []),
          throwsA(
            isA<StateError>().having(
              (e) => e.message,
              'message',
              'The verse list cannot be empty.',
            ),
          ),
        );
      },
    );

    group('nextVerse', () {
      test('moves to the next verse and resets state', () {
        expect(controller.currentVerse, testVerses[0]);
        controller.nextVerse();
        expect(controller.currentVerse, testVerses[1]);
        expect(controller.userInputReference, '');
        expect(controller.isInputCorrect, isNull);
        expect(controller.isReferenceVisible, isFalse);
        expect(controller.currentVerseIndex, 1);
      });

      test('does nothing if already at the last verse', () {
        controller.nextVerse(); // V2
        controller.nextVerse(); // V3
        expect(controller.currentVerse, testVerses[2]);
        controller.nextVerse(); // Try to go beyond V3
        expect(controller.currentVerse, testVerses[2]);
        expect(controller.currentVerseIndex, 2);
      });

      test('notifies listeners when moving to next verse', () {
        var listenerCalled = false;
        controller.addListener(() => listenerCalled = true);
        controller.nextVerse();
        expect(listenerCalled, isTrue);
      });
    });

    group('previousVerse', () {
      test('moves to the previous verse and resets state', () {
        controller.nextVerse(); // V2
        expect(controller.currentVerse, testVerses[1]);
        controller.previousVerse();
        expect(controller.currentVerse, testVerses[0]);
        expect(controller.userInputReference, '');
        expect(controller.isInputCorrect, isNull);
        expect(controller.isReferenceVisible, isFalse);
        expect(controller.currentVerseIndex, 0);
      });

      test('does nothing if already at the first verse', () {
        expect(controller.currentVerse, testVerses[0]);
        controller.previousVerse(); // Try to go before V1
        expect(controller.currentVerse, testVerses[0]);
        expect(controller.currentVerseIndex, 0);
      });

      test('notifies listeners when moving to previous verse', () {
        controller.nextVerse(); // Move to V2 first
        var listenerCalled = false;
        controller.addListener(() => listenerCalled = true);
        controller.previousVerse();
        expect(listenerCalled, isTrue);
      });
    });

    group('submitReference', () {
      test('correct input marks as correct', () {
        controller.submitReference('V1');
        expect(controller.isInputCorrect, isTrue);
        expect(controller.userInputReference, 'V1');
      });

      test('incorrect input marks as incorrect', () {
        controller.submitReference('Wrong');
        expect(controller.isInputCorrect, isFalse);
        expect(controller.userInputReference, 'Wrong');
      });

      test('input is case-insensitive and trimmed', () {
        controller.submitReference('  v1  ');
        expect(controller.isInputCorrect, isTrue);
      });

      test('notifies listeners when submitting reference', () {
        var listenerCalled = false;
        controller.addListener(() => listenerCalled = true);
        controller.submitReference('V1');
        expect(listenerCalled, isTrue);
      });
    });

    group('toggleReferenceVisibility', () {
      test('toggles visibility from false to true', () {
        expect(controller.isReferenceVisible, isFalse);
        controller.toggleReferenceVisibility();
        expect(controller.isReferenceVisible, isTrue);
      });

      test('toggles visibility from true to false', () {
        controller.toggleReferenceVisibility(); // true
        controller.toggleReferenceVisibility(); // false
        expect(controller.isReferenceVisible, isFalse);
      });

      test('notifies listeners when toggling visibility', () {
        var listenerCalled = false;
        controller.addListener(() => listenerCalled = true);
        controller.toggleReferenceVisibility();
        expect(listenerCalled, isTrue);
      });
    });

    test('default constructor uses initial verses', () {
      final defaultController = ReferenceLearningController();
      expect(defaultController.currentVerse, initialVerses.first);
      expect(defaultController.currentVerse.reference, 'Col 1:15');
      expect(defaultController.currentVerseIndex, 0);
      expect(defaultController.versesLength, initialVerses.length);
    });
  });
}
