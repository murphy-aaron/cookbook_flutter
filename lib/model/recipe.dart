import 'cooking_step.dart';
import 'ingredient.dart';

class Recipe {

  Recipe({required this.title, this.image, required this.description, required this.servings,
    required this.cookTimeMinutes, required this.ingredients, required this.utensils, required this.cookingSteps});

  String title;
  String? image;
  String description;
  double servings;
  int cookTimeMinutes;
  List<Ingredient> ingredients;
  List<String> utensils;
  List<CookingStep> cookingSteps;
}