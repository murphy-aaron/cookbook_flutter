import 'package:cookbook_flutter/model/recipe.dart';

import '../model/cooking_step.dart';
import '../model/ingredient.dart';

class RecipeService {
  Map<String, Recipe> _recipes = {
    '1234': Recipe(
        id: '1234',
        title: 'My First Recipe',
        description: 'Short recipe description goes here. List sides, cooking method, or other notes.',
        servings: 4,
        cookTimeMinutes: 60,
        ingredients: [
          Ingredient(id: '0', name: 'Ingredient 1', portion: 0.75, unit: Unit.cup),
          Ingredient(id: '1', name: 'Ingredient 2', portion: 1, unit: Unit.tbsp),
          Ingredient(id: '2', name: 'Ingredient 3', portion: 3, unit: Unit.oz),
          Ingredient(id: '3', name: 'Ingredient 4', portion: 0.5, unit: Unit.tsp)
        ],
        utensils: ['Large mixing bowl', 'Large cast iron skillet'],
        cookingSteps: [
          CookingStep(description: 'Let\'s start with step number one'),
          CookingStep(description: 'Second step follows the first'),
          CookingStep(description: 'Finally, step three.'),
          CookingStep(description: 'Enjoy!')
        ],
        image: 'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_1280,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg',
        tags: []
    ),
    '5678': Recipe(
        id: '5678',
        title: 'My Second Recipe',
        description: 'Short recipe description goes here. List sides, cooking method, or other notes.',
        servings: 4,
        cookTimeMinutes: 60,
        ingredients: [
          Ingredient(id: '0', name: 'Ingredient 1', portion: 0.75, unit: Unit.cup),
          Ingredient(id: '1', name: 'Ingredient 2', portion: 1, unit: Unit.tbsp),
          Ingredient(id: '2', name: 'Ingredient 3', portion: 3, unit: Unit.oz),
          Ingredient(id: '3', name: 'Ingredient 4', portion: 0.5, unit: Unit.tsp)
        ],
        utensils: ['Large mixing bowl', 'Large cast iron skillet'],
        cookingSteps: [
          CookingStep(description: 'Let\'s start with step number one'),
          CookingStep(description: 'Second step follows the first'),
          CookingStep(description: 'Finally, step three.'),
          CookingStep(description: 'Enjoy!')
        ],
        image: 'https://api.vip.foodnetwork.ca/wp-content/uploads/2022/05/summer-rainbow-ratatouille.jpg',
        tags: []
    )
  };

  List<Recipe> getRecipes() => List.from(_recipes.values);

  Recipe? getRecipe(String recipeId) => _recipes[recipeId];
}
