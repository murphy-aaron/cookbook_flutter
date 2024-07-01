import 'package:cookbook_flutter/components/recipe_image.dart';
import 'package:cookbook_flutter/screens/recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:cookbook_flutter/components/recipe_tag.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RecipeScreen.id);
      },
      child: Card(
        elevation: 1.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'Recipe Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipeImage(
                    url: 'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_1280,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg',
                  ),
                  SizedBox(width: 10.0),
                  Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Short recipe description goes here. List sides, cooking method, or other notes.',
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                              RecipeTag(label: 'Italian'),
                              RecipeTag(label: 'One-Pot'),
                              RecipeTag(label: 'Chicken'),
                              RecipeTag(label: 'Dinner'),
                            ],
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