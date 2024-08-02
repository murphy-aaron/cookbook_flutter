import 'package:cookbook_flutter/components/filter_checklist.dart';
import 'package:cookbook_flutter/model/recipe_data.dart';
import 'package:cookbook_flutter/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterRecipesScreen extends StatelessWidget {
  const FilterRecipesScreen({super.key});


  @override
  Widget build(BuildContext context) {

    Map<String, bool> tags = Provider.of<RecipeData>(context).getTags();

    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Center(
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
                FilterChecklist(tags: tags)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(kPrimaryColor),
                      foregroundColor: WidgetStatePropertyAll<Color>(Colors.white)
                    ),
                      child: const Text('Apply'),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        Provider.of<RecipeData>(context, listen: false).resetFilter();
                      },
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color>(kPrimaryColor),
                        foregroundColor: WidgetStatePropertyAll<Color>(Colors.white)
                      ),
                      child: const Text('Reset')
                  ),
                )
              ],
            )

          ]
        )
    );
  }
}
