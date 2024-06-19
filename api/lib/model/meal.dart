//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Meal {
  /// Returns a new [Meal] instance.
  Meal({
    required this.name,
    required this.studentPrice,
    required this.guestPrice,
    required this.date,
    this.allergens = const [],
    this.additives = const [],
    this.features = const [],
    required this.isEveningMeal,
    required this.id,
    required this.nutritionInformation,
  });

  /// The name of the meal
  String name;

  /// The price of the meal for students
  num studentPrice;

  /// The price of the meal for guests
  num guestPrice;

  /// The when the meal is available
  DateTime date;

  /// The allergens of the meal
  List<Allergen> allergens;

  /// The additives of the meal
  List<Additive> additives;

  /// The features of the meal
  List<Feature> features;

  /// Whether the meal is an evening meal
  bool isEveningMeal;

  /// The id of the meal
  num id;

  NutritionInformation nutritionInformation;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Meal &&
          other.name == name &&
          other.studentPrice == studentPrice &&
          other.guestPrice == guestPrice &&
          other.date == date &&
          _deepEquality.equals(other.allergens, allergens) &&
          _deepEquality.equals(other.additives, additives) &&
          _deepEquality.equals(other.features, features) &&
          other.isEveningMeal == isEveningMeal &&
          other.id == id &&
          other.nutritionInformation == nutritionInformation;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) +
      (studentPrice.hashCode) +
      (guestPrice.hashCode) +
      (date.hashCode) +
      (allergens.hashCode) +
      (additives.hashCode) +
      (features.hashCode) +
      (isEveningMeal.hashCode) +
      (id.hashCode) +
      (nutritionInformation.hashCode);

  @override
  String toString() =>
      'Meal[name=$name, studentPrice=$studentPrice, guestPrice=$guestPrice, date=$date, allergens=$allergens, additives=$additives, features=$features, isEveningMeal=$isEveningMeal, id=$id, nutritionInformation=$nutritionInformation]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    json[r'studentPrice'] = this.studentPrice;
    json[r'guestPrice'] = this.guestPrice;
    json[r'date'] = this.date.toUtc().toIso8601String();
    json[r'allergens'] = this.allergens;
    json[r'additives'] = this.additives;
    json[r'features'] = this.features;
    json[r'isEveningMeal'] = this.isEveningMeal;
    json[r'id'] = this.id;
    json[r'nutritionInformation'] = this.nutritionInformation;
    return json;
  }

  /// Returns a new [Meal] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Meal? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Meal[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Meal[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Meal(
        name: mapValueOfType<String>(json, r'name')!,
        studentPrice: mapValueOfType<num>(json, r'studentPrice')!,
        guestPrice: mapValueOfType<num>(json, r'guestPrice')!,
        date: mapDateTime(json, r'date', r'')!,
        allergens: Allergen.listFromJson(json[r'allergens']),
        additives: Additive.listFromJson(json[r'additives']),
        features: Feature.listFromJson(json[r'features']),
        isEveningMeal: mapValueOfType<bool>(json, r'isEveningMeal')!,
        id: mapValueOfType<num>(json, r'id')!,
        nutritionInformation:
            NutritionInformation.fromJson(json[r'nutritionInformation'])!,
      );
    }
    return null;
  }

  static List<Meal> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Meal>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Meal.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Meal> mapFromJson(dynamic json) {
    final map = <String, Meal>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Meal.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Meal-objects as value to a dart map
  static Map<String, List<Meal>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Meal>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Meal.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'studentPrice',
    'guestPrice',
    'date',
    'allergens',
    'additives',
    'features',
    'isEveningMeal',
    'id',
    'nutritionInformation',
  };
}
