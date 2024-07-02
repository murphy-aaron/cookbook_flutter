import 'package:cookbook_flutter/components/ingredient_list_item.dart';
import 'package:flutter/material.dart';

class IngredientList extends StatefulWidget {
  const IngredientList({super.key});

  @override
  State<IngredientList> createState() => _IngredientListState();
}

class _IngredientListState extends State<IngredientList> {

  List<String> ingredients = [
    '1/2 cup ingredient 1',
    '12 oz ingredient 2',
    '5 ingredient 3',
    '1 28oz can ingredient 4',
    '2 tsp ingredient 5',
    '1/2 tsp ingredient 6'
  ];

  List<bool> ingredientsChecked = List.filled(6, false, growable: false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final String ingredient = ingredients[index];
          return IngredientListItem(
              ingredientName: ingredient,
              isChecked: ingredientsChecked[index],
              checkboxCallback: (checkboxState) {
                setState(() {
                  ingredientsChecked[index] = checkboxState!;
                });
              }
          );
        },
      itemCount: ingredients.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
    );
  }
}

