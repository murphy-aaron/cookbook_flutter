import 'package:cookbook_flutter/components/sized_divider.dart';
import 'package:cookbook_flutter/components/titled_checklist.dart';
import 'package:cookbook_flutter/model/cooking_step.dart';
import 'package:cookbook_flutter/model/recipe_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/recipe.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  static const String id = '/recipe';

  @override
  Widget build(BuildContext context) {

    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    final Recipe recipe = Provider.of<RecipeData>(context).getRecipe(arguments['recipeId'])!;

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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  recipe.description
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.timelapse),
                    Text(' Total: ${recipe.cookTimeMinutes} minutes'),
                    const SizedBox(width: 50),
                    const Icon(Icons.dining_outlined),
                    Text(' Makes: ${recipe.servings.round()} servings')
                  ],
                ),
                const SizedDivider(),
                TitledChecklist(
                    title: 'Ingredients',
                    listItems: recipe.getIngredientLabels()
                ),
                const SizedDivider(),
                TitledChecklist(
                    title: 'Utensils',
                    listItems: recipe.utensils
                ),
                const SizedDivider(),
                const Text(
                  'Cooking Instructions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ListView.builder(
                    itemBuilder: (context, index) {
                      final CookingStep step = recipe.cookingSteps[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${index + 1}. ${step.description}',
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
