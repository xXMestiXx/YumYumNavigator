import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumyumnavigator/src/core/widget/annotated_scaffold.dart';
import 'package:yumyumnavigator/src/recipes/presentation/widget/home_screen/animated_appbar_widget.dart' as home;
import 'package:yumyumnavigator/src/recipes/presentation/widget/home_screen/home_screen_widgets.dart';
import 'package:yumyumnavigator/src/recipes/presentation/widget/home_screen/animated_category_list.dart';
import 'package:yumyumnavigator/src/recipes/data/recipe_repository.dart';
import 'package:yumyumnavigator/src/recipes/presentation/screens/recipe_details_screen.dart';

import '../../domain/recipe.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _visibleRecipesCount = 0;
  bool _showRecipeList = false;
  String? _selectedCategory;

  void changeListVisibility() {
    setState(() {
      _showRecipeList = true;
    });
  }

  void _onCategorySelected(String categoryName) {
    setState(() {
      _selectedCategory = categoryName;
    });
  }

  @override
  void initState() {
    Future.delayed(2550.ms, () => changeListVisibility());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final avatarPlayDuration = 500.ms;
    final avatarWaitingDuration = 400.ms;
    final nameDelayDuration =
        avatarWaitingDuration + avatarWaitingDuration + 200.ms;
    final namePlayDuration = 800.ms;
    final categoryListPlayDuration = 750.ms;
    final categoryListDelayDuration =
        nameDelayDuration + namePlayDuration - 400.ms;
    final selectedCategoryPlayDuration = 400.ms;
    final selectedCategoryDelayDuration =
        categoryListDelayDuration + categoryListPlayDuration;

    final recipesAsyncValue = ref.watch(recipesProvider);

    return AnnotatedScaffold(
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                home.AnimatedAppBarWidget(
                  avatarWaitingDuration: avatarWaitingDuration,
                  avatarPlayDuration: avatarPlayDuration,
                  nameDelayDuration: nameDelayDuration,
                  namePlayDuration: namePlayDuration,
                ),
                const SizedBox(height: 30),
                AnimatedCategoryList(
                  categoryListPlayDuration: categoryListPlayDuration,
                  categoryListDelayDuration: categoryListDelayDuration,
                  onCategorySelected: _onCategorySelected,
                ),
                const SizedBox(height: 30),
                AnimatedSelectedCategoryWidget(
                  selectedCategoryPlayDuration: selectedCategoryPlayDuration,
                  selectedCategoryDelayDuration: selectedCategoryDelayDuration,
                  visibleRecipesCount: _visibleRecipesCount,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          recipesAsyncValue.when(
            data: (recipes) {
              List<Recipe> filteredRecipes = _selectedCategory == "All Recipes"
                  ? recipes
                  : _selectedCategory == null || _selectedCategory!.isEmpty
                  ? recipes
                  : recipes
                  .where(
                      (recipe) => recipe.category == _selectedCategory)
                  .toList();

              // Hier muss setState aufgerufen werden, um _visibleRecipesCount zu aktualisieren
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  _visibleRecipesCount = filteredRecipes.length;
                });
              });

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final recipe = filteredRecipes[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecipeDetailsScreen(recipe: recipe),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              recipe.imageUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.image_not_supported,
                                    size: 60);
                              },
                            ),
                          ),
                          title: Text(
                            recipe.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(recipe.description),
                        ),
                      ),
                    );
                  },
                  childCount: filteredRecipes.length,
                ),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => SliverToBoxAdapter(
              child: Center(child: Text('Failed to load recipes: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
