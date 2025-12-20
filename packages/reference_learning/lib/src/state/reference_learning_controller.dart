import 'package:flutter/foundation.dart';
import 'package:reference_learning/src/data/initial_verses.dart';
import 'package:reference_learning/src/models/verse.dart';

/// Manages the state and logic for the scripture reference learning process.
///
/// This controller handles navigating through verses, processing user input for
/// references, providing feedback on correctness, and managing the visibility
/// of the correct reference.
class ReferenceLearningController extends ChangeNotifier {
  final List<Verse> _verses;
  int _currentVerseIndex = 0;
  String _userInputReference = '';
  bool? _isInputCorrect; // null: no input yet, true: correct, false: incorrect
  bool _isReferenceVisible = false;

  /// Creates a [ReferenceLearningController] instance.
  ///
  /// Initializes with an optional list of [verses]. If no verses are provided,
  /// it defaults to `kHardcodedVerses`.
  ReferenceLearningController({List<Verse>? verses}) : _verses = verses ?? initialVerses {
    // coverage:ignore-start
    if (_verses.isEmpty) {
      throw StateError('The verse list cannot be empty.');
    }
    // coverage:ignore-end
  }

  /// The current verse being displayed for learning.
  Verse get currentVerse => _verses[_currentVerseIndex];

  /// The reference text entered by the user.
  String get userInputReference => _userInputReference;

  /// Indicates whether the last user input was correct (`true`), incorrect (`false`),
  /// or no input has been provided yet (`null`).
  bool? get isInputCorrect => _isInputCorrect;

  /// Indicates whether the correct reference is currently visible to the user.
  bool get isReferenceVisible => _isReferenceVisible;

  /// The current index of the displayed verse in the list.
  int get currentVerseIndex => _currentVerseIndex;

  /// The total number of verses in the list.
  int get versesLength => _verses.length;

  /// Navigates to the next verse in the list.
  ///
  /// Resets user input, feedback, and reference visibility for the new verse.
  void nextVerse() {
    if (_currentVerseIndex < _verses.length - 1) {
      _currentVerseIndex++;
      _resetForNewVerse();
      notifyListeners();
    }
  }

  /// Navigates to the previous verse in the list.
  ///
  /// Resets user input, feedback, and reference visibility for the new verse.
  void previousVerse() {
    if (_currentVerseIndex > 0) {
      _currentVerseIndex--;
      _resetForNewVerse();
      notifyListeners();
    }
  }

  /// Submits the user's input reference for validation.
  ///
  /// Compares the [input] with the [currentVerse]'s reference (case-insensitive and trimmed).
  /// Updates [isInputCorrect] and notifies listeners.
  void submitReference(String input) {
    _userInputReference = input;
    _isInputCorrect = _normalizeReference(input) == _normalizeReference(currentVerse.reference);
    notifyListeners();
  }

  /// Toggles the visibility of the correct reference.
  ///
  /// Notifies listeners after the visibility state changes.
  void toggleReferenceVisibility() {
    _isReferenceVisible = !_isReferenceVisible;
    notifyListeners();
  }

  /// Resets the input state for a new verse.
  void _resetForNewVerse() {
    _userInputReference = '';
    _isInputCorrect = null;
    _isReferenceVisible = false;
  }

  /// Normalizes a reference string for comparison.
  ///
  /// Currently, this trims whitespace and converts to lowercase.
  /// This can be extended in the future for more robust comparison (e.g., handling "Colossians" vs "Col").
  String _normalizeReference(String reference) {
    return reference.trim().toLowerCase();
  }
}
