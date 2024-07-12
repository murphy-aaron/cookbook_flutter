import 'package:cookbook_flutter/components/recipe_image.dart';
import 'package:cookbook_flutter/screens/recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:cookbook_flutter/components/recipe_tag.dart';

import '../model/recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({required this.recipe});

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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipeImage(
                    url: recipe.image ?? 'https://www.eatingwell.com/thmb/088YHsNmHkUQ7iNGP4375MiAXOY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/article_7866255_foods-you-should-eat-every-week-to-lose-weight_-04-d58e9c481bce4a29b47295baade4072d.jpg',
                  ),
                  SizedBox(width: 10.0),
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