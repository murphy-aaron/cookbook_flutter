import 'package:cookbook_flutter/model/recipe.dart';
import 'package:cookbook_flutter/util/recipe_service.dart';
import 'package:flutter/cupertino.dart';

import 'filter.dart';

class RecipeData extends ChangeNotifier {
  Map<String, Recipe> _recipes = {};

  final Filter _filter = Filter();

  RecipeData() {
    _getRecipesFromService();
  }

  void _getRecipesFromService() async {
    RecipeService service = RecipeService();
    _recipes = await service.getRecipes();

    for (Recipe recipe in _recipes.values) {
      for (String tag in recipe.tags) {
        if (!_filter.containsTag(tag)) {
          _filter.addTag(tag, false);
        }
      }
    }

    notifyListeners();
  }

  List<Recipe> getRecipes() => _filter.filterRecipes(List.unmodifiable(_recipes.values));

  Recipe? getRecipe(String recipeId) => _recipes[recipeId];

  Map<String, bool> getTags() => _filter.tags;

  void updateFilter(String tag) {
    _filter.toggleTag(tag);
    notifyListeners();
  }

  void resetFilter() {
    _filter.reset();
    notifyListeners();
  }
}
