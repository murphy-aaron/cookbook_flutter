import 'package:cookbook_flutter/util/constants.dart';
import 'package:flutter/material.dart';

class IngredientListItem extends StatelessWidget {
  const IngredientListItem({required this.ingredientName, required this.isChecked, required this.checkboxCallback});

  final String ingredientName;
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
        Text(ingredientName)
      ]
    );
  }
}
