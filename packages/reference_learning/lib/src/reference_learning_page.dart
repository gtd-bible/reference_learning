import 'package:flutter/material.dart';
import 'package:reference_learning/src/models/verse.dart';
import 'package:reference_learning/src/state/reference_learning_controller.dart';
import 'package:reference_learning/src/widgets/feedback_display.dart';
import 'package:reference_learning/src/widgets/navigation_buttons.dart';
import 'package:reference_learning/src/widgets/reference_input.dart';
import 'package:reference_learning/src/widgets/reference_visibility_toggle.dart';
import 'package:reference_learning/src/widgets/verse_display.dart';

/// The main page for the scripture reference learning application.
///
/// This widget integrates all the core components: [VerseDisplay],
/// [ReferenceInput], [FeedbackDisplay], [NavigationButtons], and
/// [ReferenceVisibilityToggle], managed by a [ReferenceLearningController].
class ReferenceLearningPage extends StatefulWidget {
  final ReferenceLearningController? controller;

  /// Creates a [ReferenceLearningPage].
  const ReferenceLearningPage({super.key, this.controller});

  @override
  State<ReferenceLearningPage> createState() => _ReferenceLearningPageState();
}

class _ReferenceLearningPageState extends State<ReferenceLearningPage> {
  late ReferenceLearningController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? ReferenceLearningController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, child) {
        final Verse currentVerse = _controller.currentVerse;
        final bool canGoPrevious = _controller.currentVerseIndex > 0;
        final bool canGoNext = _controller.currentVerseIndex < _controller.versesLength - 1;

        return Scaffold(
          appBar: AppBar(title: const Text('Scripture Reference Learning')),
          body: Padding(
            padding: const .all(16.0),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                VerseDisplay(verseText: currentVerse.text),
                const SizedBox(height: 20),
                ReferenceInput(
                  key: ValueKey('reference_input_${currentVerse.reference}'),
                  initialValue: _controller.userInputReference,
                  onChanged: (_) {
                    // No-op for now, submission only on enter
                  },
                  onSubmitted: _controller.submitReference,
                ),
                const SizedBox(height: 10),
                FeedbackDisplay(
                  isCorrect: _controller.isInputCorrect,
                  correctReference: _controller.isInputCorrect == false
                      ? currentVerse.reference
                      : null,
                ),
                const SizedBox(height: 20),
                ReferenceVisibilityToggle(
                  isVisible: _controller.isReferenceVisible,
                  onToggle: _controller.toggleReferenceVisibility,
                ),
                if (_controller.isReferenceVisible)
                  Text(
                    'Correct Reference: ${currentVerse.reference}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                const SizedBox(height: 20),
                NavigationButtons(
                  onPrevious: _controller.previousVerse,
                  onNext: _controller.nextVerse,
                  hasPrevious: canGoPrevious,
                  hasNext: canGoNext,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
