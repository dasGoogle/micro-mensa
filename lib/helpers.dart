import 'package:mensa_api/api.dart';

class MealHelpers {
  static List<Feature> vegetarianOrVeganFeatures(Meal meal) {
    return meal.features.where((element) => element.abbreviation.toLowerCase().contains('veg')).toList();
  }
}