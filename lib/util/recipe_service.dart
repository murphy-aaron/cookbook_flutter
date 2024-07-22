import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/recipe.dart';

class RecipeService {

  final _store = FirebaseFirestore.instance;

  Future<Map<String, Recipe>> getRecipes() async {

    Map<String, Recipe> recipes = {};

    QuerySnapshot snapshot = await _store.collection('recipes').get();
    final data = snapshot.docs;

    for (var entry in data) {
      
      Recipe recipe = Recipe(
          id: entry.id,
          title: entry['title'],
          description: entry['description'],
          image: entry['image'],
          servings: double.parse(entry['servings'].toString()),
          cookTimeMinutes: entry['cookTimeMinutes'],
          ingredients: [],
          utensils: [],
          cookingSteps: [],
          tags: []);

      recipes.putIfAbsent(entry.id, () => recipe);
    }

    return recipes;
  }

}