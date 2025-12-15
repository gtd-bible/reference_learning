import 'package:flutter/material.dart';

/// A widget providing navigation controls for "Next" and "Previous" actions.
class NavigationButtons extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool hasPrevious;
  final bool hasNext;

  /// Creates a [NavigationButtons] widget.
  const NavigationButtons({
    super.key,
    required this.onPrevious,
    required this.onNext,
    this.hasPrevious = true,
    this.hasNext = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: hasPrevious ? onPrevious : null, child: const Text('Previous')),
        const SizedBox(width: 20),
        ElevatedButton(onPressed: hasNext ? onNext : null, child: const Text('Next')),
      ],
    );
  }
}
