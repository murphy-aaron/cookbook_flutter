class Ingredient {

  Ingredient({required this.name, required this.portion, required this.unit});

  String name;
  double portion;
  Unit unit;

  String getLabel() {
    return name;
  }
}

enum Unit { tsp, tbsp, cup, pt, qt, gal, oz, lb, g }