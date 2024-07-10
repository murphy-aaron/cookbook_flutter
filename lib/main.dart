import 'package:cookbook_flutter/screens/recipe_browser_screen.dart';
import 'package:cookbook_flutter/screens/recipe_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(CookbookApp());
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
