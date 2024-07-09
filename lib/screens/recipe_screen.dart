import 'package:cookbook_flutter/components/sized_divider.dart';
import 'package:cookbook_flutter/components/titled_checklist.dart';
import 'package:cookbook_flutter/model/cooking_step.dart';
import 'package:cookbook_flutter/model/ingredient.dart';
import 'package:flutter/material.dart';
import '../model/recipe.dart';

Recipe recipe = Recipe(
  title: 'Recipe Title Goes Here',
  description: 'Short recipe description goes here. List sides, cooking method, or other notes.',
  servings: 4,
  cookTimeMinutes: 60,
  ingredients: [
    Ingredient(name: 'Ingredient 1', portion: 0.75, unit: Unit.cup),
    Ingredient(name: 'Ingredient 2', portion: 1, unit: Unit.tbsp),
    Ingredient(name: 'Ingredient 3', portion: 3, unit: Unit.oz),
    Ingredient(name: 'Ingredient 4', portion: 0.5, unit: Unit.tsp)
  ],
  utensils: [
    'Large mixing bowl',
    'Large cast iron skillet'
  ],
  cookingSteps: [
    CookingStep(description: 'Let\'s start with step number one'),
    CookingStep(description: 'Second step follows the first'),
    CookingStep(description: 'Finally, step three.'),
    CookingStep(description: 'Enjoy!')
  ],
  image: 'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_1280,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg'
);

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  static const String id = '/recipe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(recipe.image),
                fit: BoxFit.cover,
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  recipe.description
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.timelapse),
                    Text(' Total: ${recipe.cookTimeMinutes} minutes'),
                    SizedBox(width: 50),
                    Icon(Icons.dining_outlined),
                    Text(' Makes: ${recipe.servings.round()} servings')
                  ],
                ),
                SizedDivider(),
                TitledChecklist(
                    title: 'Ingredients',
                    listItems: recipe.getIngredientLabels()
                ),
                SizedDivider(),
                TitledChecklist(
                    title: 'Utensils',
                    listItems: recipe.utensils
                ),
                SizedDivider(),
                Text(
                  'Cooking Instructions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ListView.builder(
                    itemBuilder: (context, index) {
                      final CookingStep step = recipe.cookingSteps[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${index + 1}. ${step.description}'
                        ),
                      );
                    },
                    itemCount: recipe.cookingSteps.length,
                    shrinkWrap: true,
                    primary: false,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
