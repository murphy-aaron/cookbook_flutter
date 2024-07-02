import 'package:cookbook_flutter/components/ingredient_list.dart';
import 'package:cookbook_flutter/util/constants.dart';
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
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
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
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recipe Title Goes Here',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'Short recipe description goes here. List sides, cooking method, or other notes.'
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.timelapse),
                    Text(' Total: 60 minutes'),
                    SizedBox(width: 50),
                    Icon(Icons.dining_outlined),
                    Text('Makes: 4 servings')
                  ],
                ),
                SizedBox(height: 10),
                Divider(height: 2),
                SizedBox(height: 10),
                Text(
                  'Ingredients',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IngredientList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
