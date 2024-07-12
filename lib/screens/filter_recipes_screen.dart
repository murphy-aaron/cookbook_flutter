import 'package:flutter/material.dart';

class FilterRecipesScreen extends StatelessWidget {
  const FilterRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Center(
        child: Text(
          'Filter Recipes'
        ),
      ),
    );
  }
}
