import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumyumnavigator/main.dart';
import 'package:yumyumnavigator/src/onboarding/onboarding_screen.dart';
import 'package:yumyumnavigator/src/recipes/domain/recipe.dart';
import 'package:yumyumnavigator/src/recipes/presentation/screens/home_screen.dart';
import 'package:yumyumnavigator/src/recipes/presentation/screens/recipe_details_screen.dart';

void main() {
  group('yumyumnavigator', () {
    testWidgets('renders OnBoardingScreen as the home screen', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: yumyumNavigator()));

      expect(find.byType(OnBoardingScreen), findsOneWidget);
    });

    testWidgets('navigates to HomeScreen on "home" route', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: yumyumNavigator()));

      // Trigger navigation
      Navigator.of(tester.element(find.byType(OnBoardingScreen)))
          .pushNamed('home');
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('navigates to RecipeDetailsScreen on "recipe_details" route', (WidgetTester tester) async {
      final recipe = Recipe( id: "1",
      name: "Spaghetti Bolognese",
      category: "Popular",
      description: "A classic Italian meat sauce served over pasta",
      imageUrl: "assets/images/spaghetti.png",
      ingredients: ["spaghetti", "ground beef", "onions", "tomato sauce", "red wine"],
      steps: ["Cook the spaghetti according to package directions.", "Brown the ground beef and onions.", "Add the tomato sauce and red wine and simmer for 1 hour.", "Toss with cooked spaghetti and serve."],
      nutrition: {
        "calories": 650,
        "protein": 35, 
        "prepTime": 60
      });
      
      await tester.pumpWidget(const ProviderScope(child: yumyumNavigator()));

      // Trigger navigation
      Navigator.of(tester.element(find.byType(OnBoardingScreen)))
          .pushNamed('recipe_details', arguments: recipe);
      await tester.pumpAndSettle();

      expect(find.byType(RecipeDetailsScreen), findsOneWidget);
    });

    testWidgets('returns HomeScreen on unknown route', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: yumyumNavigator()));

      // Trigger navigation
      Navigator.of(tester.element(find.byType(OnBoardingScreen)))
          .pushNamed('unknown_route');
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
