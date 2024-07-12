import 'package:cookbook_flutter/components/titled_checklist.dart';
import 'package:cookbook_flutter/util/recipe_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterRecipesScreen extends StatelessWidget {
  const FilterRecipesScreen({super.key});


  @override
  Widget build(BuildContext context) {

    List<String> tags = Provider.of<RecipeService>(context, listen: false).getTags();

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
                TitledChecklist(title: 'Tags', listItems: tags)
            ],
        ),
    ]
        )
    );
  }
}
