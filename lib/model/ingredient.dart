class Ingredient {

  Ingredient({required this.id, required this.name, required this.portion, required this.unit});

  String id;
  String name;
  double portion;
  Unit unit;

  String getLabel() {
    return name;
  }
}

enum Unit { tsp, tbsp, cup, pt, qt, gal, oz, lb, g }