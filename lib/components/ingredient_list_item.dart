import 'package:cookbook_flutter/util/constants.dart';
import 'package:flutter/material.dart';

import '../model/ingredient.dart';

class IngredientListItem extends StatelessWidget {
  const IngredientListItem({required this.ingredient, required this.isChecked, required this.checkboxCallback});

  final Ingredient ingredient;
  final bool isChecked;
  final Function(bool?) checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashRadius: 0,
        activeColor: kPrimaryColor,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
        Text('${ingredient.name}')
      ]
    );
  }
}
