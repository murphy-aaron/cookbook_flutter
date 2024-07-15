import 'package:cookbook_flutter/components/titled_checklist.dart';
import 'package:cookbook_flutter/model/recipe_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterRecipesScreen extends StatelessWidget {
  const FilterRecipesScreen({super.key});


  @override
  Widget build(BuildContext context) {

    Set<String> tags = Provider.of<RecipeData>(context, listen: false).getTags();

    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
                child: Text(
                  'Filter Recipes',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                TitledChecklist(title: 'Tags', listItems: List.of(tags))
              ],
            ),
            TextButton(
                onPressed: () {

                },
                child: Text('Apply')
            )
          ]
        )
    );
  }
}
