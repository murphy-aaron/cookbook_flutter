import 'package:cookbook_flutter/model/recipe.dart';

class Filter {

  Set<String> _tags = {};
  Set<String> _activeTags = {};

  Filter({required Set<String> tags, Set<String>? activeTags}) {
    _tags = tags;
    _activeTags = activeTags ?? {};
  }

  Set<String> get tags => Set.unmodifiable(_tags);

  List<Recipe> filterRecipes(List<Recipe> recipes) {

    if (_activeTags.isEmpty) {
      return recipes;
    }

    List<Recipe> filtered = [];

    for (Recipe recipe in recipes) {
      bool matchesFilter = false;
      for (String tag in _activeTags) {
        if (recipe.tags.contains(tag)) {
          matchesFilter = true;
          break;
        }
      }
      if (matchesFilter) {
        filtered.add(recipe);
      }
    }

    return List.unmodifiable(filtered);
  }

  void toggleTag(String tag, bool active) {
    if (active) {
      if (!_activeTags.contains(tag)) {
        _activeTags.add(tag);
      }
    } else {
      _activeTags.remove(tag);
    }
  }
}