import 'package:cookbook_flutter/components/recipe_image.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180.0,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_1280,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  'Recipe Title Goes Here',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
