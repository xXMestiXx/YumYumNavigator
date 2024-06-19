import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:yumyumnavigator/src/recipes/presentation/widget/home_screen/food_category_widget.dart'; 

void main() {
  testWidgets('FoodCategoryWidget displays icon and name', (WidgetTester tester) async {
    // Arrange
    const icon = '🍕';
    const name = 'Pizza';

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FoodCategoryWidget(
            icon: icon,
            name: name,
          ),
        ),
      ),
    );

    // Assert
    expect(find.text(icon), findsOneWidget);
    expect(find.text(name), findsOneWidget);
  });

  testWidgets('FoodCategoryWidget has correct padding and margin', (WidgetTester tester) async {
    // Arrange
    const icon = '🍔';
    const name = 'Burger';

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FoodCategoryWidget(
            icon: icon,
            name: name,
          ),
        ),
      ),
    );

    // Get the container widget
    final container = tester.widget<Container>(find.byType(Container));

    // Assert
    expect(container.padding, const EdgeInsets.symmetric(horizontal: 10));
    expect(container.margin, const EdgeInsets.only(right: 15));
  });

  testWidgets('FoodCategoryWidget has correct border and border radius', (WidgetTester tester) async {
    // Arrange
    const icon = '🍩';
    const name = 'Donut';

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FoodCategoryWidget(
            icon: icon,
            name: name,
          ),
        ),
      ),
    );

    // Get the container decoration
    final container = tester.widget<Container>(find.byType(Container));
    final boxDecoration = container.decoration as BoxDecoration;

    // Assert
    expect(boxDecoration.border, Border.all(color: Colors.white30, width: 2));
    expect(boxDecoration.borderRadius, BorderRadius.circular(25));
  });
}
