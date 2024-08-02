import 'package:cookbook_flutter/screens/recipe_browser_screen.dart';
import 'package:cookbook_flutter/screens/recipe_screen.dart';
import 'package:cookbook_flutter/model/recipe_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const CookbookApp());
}

class CookbookApp extends StatelessWidget {
  const CookbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RecipeData(),
      child: MaterialApp(
        initialRoute: RecipeBrowserScreen.id,
        routes: {
          RecipeBrowserScreen.id: (context) => const RecipeBrowserScreen(),
          RecipeScreen.id: (context) => const RecipeScreen()
        },
      ),
    );
  }
}
