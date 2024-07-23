class Ingredient {

  Ingredient({required this.id, required this.name, required this.portion, required this.unit});

  String id;
  String name;
  double portion;
  Unit unit;

  String getLabel() {
    return name;
  }

  static getUnit(String unit) {
    switch (unit) {
      case 'tsp':
        return Unit.tsp;
      case 'tbsp':
        return Unit.tbsp;
      case 'cup':
        return Unit.cup;
      case 'pt':
        return Unit.pt;
      case 'qt':
        return Unit.qt;
      case 'gal':
        return Unit.gal;
      case 'oz':
        return Unit.oz;
      case 'lb':
        return Unit.lb;
      case 'g':
        return Unit.g;
    }

    return Unit.missing;
  }
}

enum Unit { tsp, tbsp, cup, pt, qt, gal, oz, lb, g, missing }