import 'package:flutter/material.dart';
import '../util/constants.dart';

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