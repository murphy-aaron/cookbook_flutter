import 'package:cookbook_flutter/screens/filter_recipes_screen.dart';
import 'package:cookbook_flutter/util/constants.dart';
import 'package:cookbook_flutter/model/recipe_data.dart';
import 'package:flutter/material.dart';
import '../components/recipe_card.dart';

class RecipeBrowserScreen extends StatelessWidget {
  RecipeBrowserScreen({super.key});

  static const String id = '/';

  final RecipeData recipeService = RecipeData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Center(
            child: Text(
          'Recipe Browser',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search recipes',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: FilterRecipesScreen(),
                            ),
                          ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)
                        ))
                      );
                    },
                    child: const Icon(
                      Icons.filter_list_rounded,
                      color: kPrimaryColor,
                      size: 35.0,
                    ))
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return RecipeCard(recipe: recipeService.getRecipes()[index]);
                  },
                itemCount: recipeService.getRecipes().length,
              )
            )
          ],
        ),
      ),
    );
  }
}
