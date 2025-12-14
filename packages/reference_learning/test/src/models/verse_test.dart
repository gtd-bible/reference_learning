import 'package:flutter_test/flutter_test.dart';
import 'package:reference_learning/src/models/verse.dart';

void main() {
  group('Verse', () {
    test('Verse can be created with valid data', () {
      const verse = Verse(
        reference: 'Jn 3:16',
        text: 'For God so loved the world...',
        translation: 'KJV',
      );

      expect(verse.reference, 'Jn 3:16');
      expect(verse.text, 'For God so loved the world...');
      expect(verse.translation, 'KJV');
    });

    test('Two Verse objects with the same data are equal', () {
      const verse1 = Verse(
        reference: 'Ps 23:1',
        text: 'The Lord is my shepherd...',
        translation: 'NIV',
      );
      const verse2 = Verse(
        reference: 'Ps 23:1',
        text: 'The Lord is my shepherd...',
        translation: 'NIV',
      );

      expect(verse1, verse2);
      expect(verse1.hashCode, verse2.hashCode);
    });

    test('Two Verse objects with different data are not equal', () {
      const verse1 = Verse(
        reference: 'Ps 23:1',
        text: 'The Lord is my shepherd...',
        translation: 'NIV',
      );
      const verse2 = Verse(
        reference: 'Ps 23:2', // Different reference
        text: 'He makes me lie down in green pastures...',
        translation: 'NIV',
      );

      expect(verse1, isNot(equals(verse2)));
      expect(verse1.hashCode, isNot(equals(verse2.hashCode)));
    });

    test('toString returns a correct string representation', () {
      const verse = Verse(
        reference: 'Gen 1:1',
        text: 'In the beginning God created...',
        translation: 'ESV',
      );
      expect(
        verse.toString(),
        'Verse(reference: Gen 1:1, text: In the beginning God created..., translation: ESV)',
      );
    });
  });
}
