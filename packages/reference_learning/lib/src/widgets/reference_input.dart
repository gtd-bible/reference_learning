import 'package:flutter/material.dart';

/// A widget for user input of the scripture reference.
class ReferenceInput extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final String initialValue;

  /// Creates a [ReferenceInput] widget.
  const ReferenceInput({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
    this.initialValue = '',
  });

  @override
  State<ReferenceInput> createState() => _ReferenceInputState();
}

class _ReferenceInputState extends State<ReferenceInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant ReferenceInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        decoration: const InputDecoration(
          labelText: 'Enter Reference',
          border: OutlineInputBorder(),
        ),
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
