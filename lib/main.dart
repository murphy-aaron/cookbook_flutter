import 'package:cookbook_flutter/screens/recipe_browser_screen.dart';
import 'package:cookbook_flutter/screens/recipe_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CookbookApp());
}

class CookbookApp extends StatelessWidget {
  const CookbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RecipeBrowserScreen.id,
      routes: {
        RecipeBrowserScreen.id: (context) => RecipeBrowserScreen(),
        RecipeScreen.id: (context) => RecipeScreen()
      },
    );
  }
}
