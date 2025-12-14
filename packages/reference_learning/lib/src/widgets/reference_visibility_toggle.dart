import 'package:flutter/material.dart';

/// A toggle button to show or hide the correct scripture reference.
class ReferenceVisibilityToggle extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onToggle;

  /// Creates a [ReferenceVisibilityToggle] widget.
  const ReferenceVisibilityToggle({
    super.key,
    required this.isVisible,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onToggle,
      child: Text(isVisible ? 'Hide Reference' : 'Show Reference'),
    );
  }
}
