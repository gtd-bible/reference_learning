import 'package:flutter/material.dart';

/// A widget that displays the text of a scripture verse.
class VerseDisplay extends StatelessWidget {
  final String verseText;

  /// Creates a [VerseDisplay] widget.
  const VerseDisplay({
    super.key,
    required this.verseText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        verseText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
