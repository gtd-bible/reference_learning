import 'package:flutter/material.dart';

/// A widget that displays feedback on the correctness of the user's input.
class FeedbackDisplay extends StatelessWidget {
  final bool? isCorrect; // null: no feedback, true: correct, false: incorrect
  final String? correctReference;

  /// Creates a [FeedbackDisplay] widget.
  const FeedbackDisplay({super.key, this.isCorrect, this.correctReference});

  @override
  Widget build(BuildContext context) {
    if (isCorrect == null) {
      return const SizedBox.shrink(); // No feedback yet
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: isCorrect!
          ? const Text(
              'Correct!',
              style: TextStyle(color: Colors.green, fontSize: 18),
            )
          : Column(
              children: [
                const Text(
                  'Incorrect.',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
                if (correctReference != null)
                  Text(
                    'The correct reference was: $correctReference',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
    );
  }
}
