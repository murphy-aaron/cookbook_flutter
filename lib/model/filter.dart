import 'package:cookbook_flutter/model/recipe.dart';

class Filter {

  final Map<String, bool> _tags = {};

  void addTag(String label, bool isActive) {
    _tags[label] = isActive;
  }

  Map<String, bool> get tags => Map.unmodifiable(_tags);

  List<Recipe> filterRecipes(List<Recipe> recipes) {

    if (!_tags.values.contains(true)) {
      return recipes;
    }

    List<Recipe> filtered = [];

    for (Recipe recipe in recipes) {
      bool matchesFilter = false;
      for (String tag in _tags.keys) {
        if (_tags[tag]! && recipe.tags.contains(tag)) {
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

  void toggleTag(String tag) {
    if(_tags.containsKey(tag)) {
      _tags[tag] = !_tags[tag]!;
    }
  }

  bool containsTag(String tag) {
    return _tags.containsKey(tag);
  }
}