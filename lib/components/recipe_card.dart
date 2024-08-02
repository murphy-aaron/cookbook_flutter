import 'package:cookbook_flutter/components/recipe_image.dart';
import 'package:cookbook_flutter/screens/recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:cookbook_flutter/components/recipe_tag.dart';

import '../model/recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {

    List<RecipeTag> tags = [];
    for (String tag in recipe.tags) {
      tags.add(RecipeTag(label: tag));
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RecipeScreen.id, arguments: {'recipeId': recipe.id} );
      },
      child: Card(
        elevation: 1.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                recipe.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipeImage(
                    url: recipe.image,
                  ),
                  const SizedBox(width: 10.0),
                  Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.description,
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 5,
                            runSpacing: 5,
                            children: tags,
                          )
                        ]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}