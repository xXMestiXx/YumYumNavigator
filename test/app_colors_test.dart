import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumyumnavigator/src/core/theme/app_colors.dart';

void main() {
  group('AppColors', () {
    test('cardColor is correct', () {
      expect(AppColors.cardColor, const Color(0xff182032));
    });

    test('bodySmallTextColor is correct', () {
      expect(AppColors.bodySmallTextColor, Colors.amberAccent[100]);
    });

    test('scaffoldBackgroundColor is correct', () {
      expect(AppColors.scaffoldBackgroundColor, const Color(0xff101520));
    });

    test('infoTextColor is correct', () {
      expect(AppColors.infoTextColor, Colors.white60);
    });

    test('onBoardingButtonColor is correct', () {
      expect(AppColors.onBoardingButtonColor, Colors.amberAccent);
    });

    test('timeLineColor is correct', () {
      expect(AppColors.timeLineColor, Colors.lightGreen);
    });
  });
}
