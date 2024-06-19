import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:yumyumnavigator/src/core/theme/app_colors.dart';

void main() {
  final mainTheme = FlexThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    textTheme: const TextTheme().copyWith(
      bodyLarge: const TextStyle(
        color: Colors.black,
        height: 1.4,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
      bodySmall: const TextStyle(fontSize: 14, color: Colors.white60),
      headlineMedium: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      titleMedium: const TextStyle(
        color: Colors.white,
        height: 1.4,
        fontSize: 17,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      displaySmall: const TextStyle(
        fontSize: 36,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(fontSize: 12, color: Colors.amber.shade100),
      labelLarge: const TextStyle(
        fontSize: 12,
        color: Colors.white60,
        fontWeight: FontWeight.w400,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.cardColor,
      elevation: 0,
      margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );

  group('Main Theme', () {
    test('Scaffold background color is correct', () {
      expect(mainTheme.scaffoldBackgroundColor, AppColors.scaffoldBackgroundColor);
    });

    test('Text theme properties are correct', () {
      final textTheme = mainTheme.textTheme;

      expect(textTheme.bodyLarge?.color, Colors.black);
      expect(textTheme.bodyLarge?.height, 1.4);
      expect(textTheme.bodyLarge?.fontSize, 18);
      expect(textTheme.bodyLarge?.fontWeight, FontWeight.bold);

      expect(textTheme.titleSmall?.fontWeight, FontWeight.w700);
      expect(textTheme.titleSmall?.fontSize, 15);

      expect(textTheme.bodySmall?.fontSize, 14);
      expect(textTheme.bodySmall?.color, Colors.white60);

      expect(textTheme.headlineMedium?.fontSize, 28);
      expect(textTheme.headlineMedium?.fontWeight, FontWeight.bold);

      expect(textTheme.titleMedium?.color, Colors.white);
      expect(textTheme.titleMedium?.height, 1.4);
      expect(textTheme.titleMedium?.fontSize, 17);
      expect(textTheme.titleMedium?.fontWeight, FontWeight.w700);

      expect(textTheme.titleLarge?.fontSize, 20);
      expect(textTheme.titleLarge?.fontWeight, FontWeight.w500);
      expect(textTheme.titleLarge?.color, Colors.white);

      expect(textTheme.displaySmall?.fontSize, 36);
      expect(textTheme.displaySmall?.color, Colors.white);
      expect(textTheme.displaySmall?.fontWeight, FontWeight.bold);

      expect(textTheme.labelMedium?.fontSize, 12);
      expect(textTheme.labelMedium?.color, Colors.amber.shade100);

      expect(textTheme.labelLarge?.fontSize, 12);
      expect(textTheme.labelLarge?.color, Colors.white60);
      expect(textTheme.labelLarge?.fontWeight, FontWeight.w400);
    });

    test('Card theme properties are correct', () {
      final cardTheme = mainTheme.cardTheme;

      expect(cardTheme.color, AppColors.cardColor);
      expect(cardTheme.elevation, 0);
      expect(cardTheme.margin, const EdgeInsets.fromLTRB(10, 15, 10, 0));
      expect(cardTheme.shape, RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
    });
  });
}
