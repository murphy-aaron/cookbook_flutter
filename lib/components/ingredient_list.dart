import 'package:cookbook_flutter/components/ingredient_list_item.dart';
import 'package:flutter/material.dart';

import '../model/ingredient.dart';

class IngredientList extends StatefulWidget {
  const IngredientList({required this.ingredients});

  final List<Ingredient> ingredients;

  @override
  State<IngredientList> createState() => _IngredientListState();
}

class _IngredientListState extends State<IngredientList> {

  List<bool> ingredientsChecked = List.filled(6, false, growable: false);

  @override
  Widget build(BuildContext context) {

    final List<Ingredient> ingredients = widget.ingredients;

    return ListView.builder(
        itemBuilder: (context, index) {
          final Ingredient ingredient = ingredients[index];
          return IngredientListItem(
              ingredient: ingredient,
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

