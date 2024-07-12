import 'cooking_step.dart';
import 'ingredient.dart';

class Recipe {

  Recipe({
    required this.id,
    required this.title,
    this.image = 'https://media.istockphoto.com/id/1316145932/photo/table-top-view-of-spicy-food.jpg?b=1&s=612x612&w=0&k=20&c=X6CkFGpSKhNZeiii8Pp2M_YrBdqs7tRaBytkGi48a0U=',
    required this.description,
    required this.servings,
    required this.cookTimeMinutes,
    required this.ingredients,
    required this.utensils,
    required this.cookingSteps,
    required this.tags
  });

  String id;
  String title;
  String image;
  String description;
  double servings;
  int cookTimeMinutes;
  List<Ingredient> ingredients;
  List<String> utensils;
  List<CookingStep> cookingSteps;
  List<String> tags;

  List<String> getIngredientLabels() {
    List<String> labels = [];
    for (Ingredient ingredient in ingredients) {
      labels.add(ingredient.getLabel());
    }
    return labels;
  }
}