import 'package:flutter_test/flutter_test.dart';
import 'package:yumyumnavigator/src/recipes/domain/recipe.dart';

void main() {
  group('Recipe', () {
    test('supports value comparisons', () {
      final recipe1 = Recipe(
       id: "1",
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
      }
      );

      final recipe2 = Recipe(
      id: "1",
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
      }
      );

      expect(recipe1, equals(recipe2));
    });

    test('can be serialized to JSON and back', () {
      final recipe = Recipe(
        id: "3",
      name: "Caesar Salad",
      category: "Healthy",
      description: "Romaine lettuce with creamy Caesar dressing, croutons and parmesan", 
      imageUrl: "assets/images/salad.png",
      ingredients: ["romaine lettuce", "caesar dressing", "croutons", "parmesan"],
      steps: ["Chop romaine lettuce.", "Toss with caesar dressing.", "Top with croutons and parmesan."],
      nutrition: {
        "calories": 250,
        "protein": 10,
        "prepTime": 10  
      }
      );

      final json = recipe.toJson();
      final deserializedRecipe = Recipe.fromJson(json);

      expect(deserializedRecipe, equals(recipe));
    });
  });
}
