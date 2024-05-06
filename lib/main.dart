import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

int resultNumber = 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CPD',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(35, 45, 83, 20.0)),
        useMaterial3: true,
        scaffoldBackgroundColor: Color.fromRGBO(35, 45, 83, 10.0),
      ),
      home: const MyHomePage(title: 'CPD'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          HeaderSection(name: 'Phil', userIcon: Icon(Icons.person)),
          //FilterSection(),
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 8.0),
          //   alignment: Alignment.center,
          //   child: Text(
          //     'Results: $resultNumber',
          //     style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          //   ),
          // ),
          Expanded(child: ResultSection()),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
    required this.name,
    required this.userIcon,
  }) : super(key: key);

  final String name;
  final Icon userIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      decoration: BoxDecoration(color: Color.fromRGBO(35, 45, 83, 100.0), border: Border.all(color: Colors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Hello $name",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(width: 10.0),
              userIcon,
            ],
          ),
          Image.asset(
            'assets/IMG_3125.JPG',
            width: 40.0,
            height: 40.0,
          ),
        ],
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  final String title;
  final Function onTap;

  const FilterOption({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}

class ResultSection extends StatefulWidget {
  @override
  _ResultSectionState createState() => _ResultSectionState();
}

class _ResultSectionState extends State<ResultSection> {
  late List<Recipe> recipes;
  late List<Recipe> filteredRecipes;

  @override
  void initState() {
    super.initState();
    recipes = [
      Recipe(
        title: 'Tomato Soup',
        tag: 'Soup',
        description: 'Delicious tomato soup recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta',
        tag: 'Vegan',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta1',
        tag: 'Vegan',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta2',
        tag: 'Vegan',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta',
        tag: 'Vegan',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta',
        tag: 'Vegan',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta',
        tag: 'Vegan',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta',
        tag: 'Vegan',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta',
        tag: 'Vegan',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta',
        tag: 'Vegan',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta',
        tag: 'Vegan',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta',
        tag: 'Vegan',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta',
        tag: 'Dessert',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta',
        tag: 'Fast Food',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
      Recipe(
        title: 'Vegan Pasta',
        tag: 'Healthy',
        description: 'Healthy vegan pasta recipe.',
        imagePath: 'assets/IMG_3125.JPG',
      ),
    ];
    filteredRecipes = List.from(recipes);
  }

  void filterRecipesByTag(String tag) {
    int newResultNumber;
    if (tag == 'All') {
      filteredRecipes = List.from(recipes);
      newResultNumber = filteredRecipes.length;
    } else {
      filteredRecipes = recipes.where((recipe) => recipe.tag == tag).toList();
      newResultNumber = filteredRecipes.length;
    }
    setState(() {
      resultNumber = newResultNumber;
      print(resultNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterOption(
                  title: 'All',
                  onTap: () => filterRecipesByTag('All'),
                ),
                FilterOption(
                  title: 'Soup',
                  onTap: () => filterRecipesByTag('Soup'),
                ),
                FilterOption(
                  title: 'Vegan',
                  onTap: () => filterRecipesByTag('Vegan'),
                ),
                FilterOption(
                  title: 'Fast Food',
                  onTap: () => filterRecipesByTag('Fast Food'),
                ),
                FilterOption(
                  title: 'Dessert',
                  onTap: () => filterRecipesByTag('Dessert'),
                ),
                FilterOption(
                  title: 'Healthy',
                  onTap: () => filterRecipesByTag('Healthy'),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            alignment: Alignment.center,
            child: Text(
              'Results: $resultNumber',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: filteredRecipes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20.0),
                child: ResultItem(recipe: filteredRecipes[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  final Recipe recipe;

  const ResultItem({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RecipeDetailPage(recipe: recipe)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(
              recipe.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              recipe.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 4),
            Text(
              recipe.tag,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class Recipe {
  const Recipe({
    required this.title,
    required this.tag,
    required this.description,
    required this.imagePath,
  });

  final String title;
  final String tag;
  final String description;
  final String imagePath;
}

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(recipe.imagePath,
                width: MediaQuery.of(context).size.width),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                recipe.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
