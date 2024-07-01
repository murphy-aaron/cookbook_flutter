import 'package:cookbook_flutter/components/recipe_image.dart';
import 'package:cookbook_flutter/util/constants.dart';
import 'package:flutter/material.dart';

import '../components/recipe_card.dart';
import '../components/recipe_tag.dart';

class RecipeBrowserScreen extends StatelessWidget {
  const RecipeBrowserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onPressed: () {},
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
              child: ListView(
                children: const [RecipeCard(), RecipeCard()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
