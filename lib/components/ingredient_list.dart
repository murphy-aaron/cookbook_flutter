import 'package:flutter/material.dart';

class IngredientList extends StatefulWidget {
  const IngredientList({super.key});

  @override
  State<IngredientList> createState() => _IngredientListState();
}

class _IngredientListState extends State<IngredientList> {

  List<String> ingredients = [
    '1/2 cup ingredient 1',
    '12 oz ingredent 2',
    '5 ingredient 3',
    '1 28oz can ingredient 4',
    '2 tsp ingrednient 5'
    '1/2 tsp ingredient 6'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final String ingredient = ingredients[index];
          return Text(ingredient);
        },
      itemCount: ingredients.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
    );
  }
}

