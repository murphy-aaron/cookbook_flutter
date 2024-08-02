import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookbook_flutter/model/ingredient.dart';

import '../model/cooking_step.dart';
import '../model/recipe.dart';

class RecipeService {

  final _store = FirebaseFirestore.instance;

  Future<Map<String, Recipe>> getRecipes() async {

    Map<String, Recipe> recipes = {};

    QuerySnapshot snapshot = await _store.collection('recipes').get();
    final data = snapshot.docs;

    for (var entry in data) {

      List<String> tags = [];
      for (var tag in entry['tags']) {
        tags.add(tag.toString());
      }

      List<String> utensils = [];
      for (var utensil in entry['utensils']) {
        utensils.add(utensil.toString());
      }

      List<Ingredient> ingredients = [];
      for (var ingredient in entry['ingredients']) {
        ingredients.add(
            Ingredient(
                id: "",
                name: ingredient['name'],
                portion: double.parse(ingredient['portion'].toString()),
                unit: Ingredient.getUnit(ingredient['unit'])
            )
        );
      }

      List<CookingStep> cookingSteps = [];
      for (var cookingStep in entry['cookingSteps']) {
        cookingSteps.add(
          CookingStep(
              description: cookingStep.toString()
          )
        );
      }
      
      Recipe recipe = Recipe(
          id: entry.id,
          title: entry['title'],
          description: entry['description'],
          servings: double.parse(entry['servings'].toString()),
          cookTimeMinutes: entry['cookTimeMinutes'],
          ingredients: ingredients,
          utensils: utensils,
          cookingSteps: cookingSteps,
          tags: tags);

      if((entry.data() as Map<String, dynamic>).containsKey('image')) {
        recipe.image = entry['image'];
      }

      recipes.putIfAbsent(entry.id, () => recipe);
    }

    return recipes;
  }

}