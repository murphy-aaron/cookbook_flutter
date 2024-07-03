class Ingredient {

  Ingredient({required this.name, required this.portion, required this.unit});

  String name;
  double portion;
  Unit unit;
}

enum Unit { tsp, tbsp, cup, pt, qt, gal, oz, lb, g }