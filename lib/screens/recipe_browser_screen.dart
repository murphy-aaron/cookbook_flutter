import 'package:cookbook_flutter/util/constants.dart';
import 'package:flutter/material.dart';

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

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://assets.epicurious.com/photos/5988e3458e3ab375fe3c0caf/1:1/w_3607,h_3607,c_limit/How-to-Make-Chicken-Alfredo-Pasta-hero-02082017.jpg'),
                        fit: BoxFit.cover,
                      )),
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
    );
  }
}

class RecipeTag extends StatelessWidget {
  const RecipeTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
    );
  }
}
