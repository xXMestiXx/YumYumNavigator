import 'package:flutter/material.dart';
import 'package:yumyumnavigator/src/recipes/presentation/widget/home_screen/food_category_widget.dart';

class AnimatedCategoryList extends StatefulWidget {
  final Duration categoryListPlayDuration;
  final Duration categoryListDelayDuration;
  final Function(String) onCategorySelected;

  const AnimatedCategoryList({
    Key? key,
    required this.categoryListPlayDuration,
    required this.categoryListDelayDuration,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  _AnimatedCategoryListState createState() => _AnimatedCategoryListState();
}

class _AnimatedCategoryListState extends State<AnimatedCategoryList> with SingleTickerProviderStateMixin {
  String? _selectedCategory;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.categoryListPlayDuration,
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 50, minHeight: 40),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        children: List.generate(
          _categories.length,
              (index) {
            final category = _categories[index];
            return FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(
                    index * 0.1,
                    1.0,
                    curve: Curves.easeInOut,
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategory = category.name;
                  });
                  widget.onCategorySelected(category.name);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: _selectedCategory == category.name
                        ? Colors.blueAccent.withOpacity(0.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: category,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

const _categories = [
  FoodCategoryWidget(icon: "🍴", name: "All Recipes"),
  FoodCategoryWidget(icon: "🔥", name: "Popular"),
  FoodCategoryWidget(icon: "🥦", name: "Healthy"),
  FoodCategoryWidget(icon: "🍲", name: "Soup"),
  FoodCategoryWidget(icon: "🍿", name: "Snacks"),
];
