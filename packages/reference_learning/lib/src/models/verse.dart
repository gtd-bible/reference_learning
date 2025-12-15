/// Represents a single scripture verse with its reference, text, and translation.
class Verse {
  final String reference;
  final String text;
  final String translation; // e.g., "WEB"

  /// Creates a [Verse] instance.
  const Verse({required this.reference, required this.text, required this.translation});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Verse &&
        other.reference == reference &&
        other.text == text &&
        other.translation == translation;
  }

  @override
  int get hashCode => reference.hashCode ^ text.hashCode ^ translation.hashCode;

  @override
  String toString() {
    return 'Verse(reference: $reference, text: $text, translation: $translation)';
  }
}
