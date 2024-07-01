import 'package:flutter/material.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          )),
    );
  }
}
