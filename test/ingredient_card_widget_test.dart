import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumyumnavigator/src/recipes/presentation/widget/recipe_details/ingredient_card_widget.dart';

void main() {
  testWidgets('IngredientCardWidget displays ingredient text', (WidgetTester tester) async {
    // Arrange
    const ingredient = 'Tomato';

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: IngredientCardWidget(
            ingredient: ingredient,
          ),
        ),
      ),
    );

    // Assert
    expect(find.text(ingredient), findsOneWidget);
  });

  testWidgets('IngredientCardWidget has correct margin and padding', (WidgetTester tester) async {
    // Arrange
    const ingredient = 'Tomato';

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: IngredientCardWidget(
            ingredient: ingredient,
          ),
        ),
      ),
    );

    // Get the container widget
    final container = tester.widget<Container>(find.byType(Container));

    // Assert
    expect(container.margin, const EdgeInsets.symmetric(horizontal: 10));
    expect(container.padding, const EdgeInsets.symmetric(horizontal: 15));
  });

  testWidgets('IngredientCardWidget has correct border and border radius', (WidgetTester tester) async {
    // Arrange
    const ingredient = 'Tomato';

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: IngredientCardWidget(
            ingredient: ingredient,
          ),
        ),
      ),
    );

    // Get the container decoration
    final container = tester.widget<Container>(find.byType(Container));
    final boxDecoration = container.decoration as BoxDecoration;

    // Assert
    expect(boxDecoration.border, Border.all(color: Colors.white24, width: 1.5));
    expect(boxDecoration.borderRadius, BorderRadius.circular(15));
  });

}
