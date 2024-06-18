//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NutritionInformation {
  /// Returns a new [NutritionInformation] instance.
  NutritionInformation({
    required this.kj,
    required this.kcal,
    required this.fat,
    required this.saturatedFat,
    required this.carbohydrates,
    required this.sugar,
    required this.protein,
    required this.salt,
  });

  /// The energy of the meal in kJ
  double kj;

  /// The energy of the meal in kcal
  double kcal;

  /// The fat of the meal in g
  double fat;

  /// The saturated fat of the meal in g
  double saturatedFat;

  /// The carbohydrates of the meal in g
  double carbohydrates;

  /// The sugar of the meal in g
  double sugar;

  /// The protein of the meal in g
  double protein;

  /// The salt of the meal in g
  double salt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionInformation &&
          other.kj == kj &&
          other.kcal == kcal &&
          other.fat == fat &&
          other.saturatedFat == saturatedFat &&
          other.carbohydrates == carbohydrates &&
          other.sugar == sugar &&
          other.protein == protein &&
          other.salt == salt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (kj.hashCode) +
      (kcal.hashCode) +
      (fat.hashCode) +
      (saturatedFat.hashCode) +
      (carbohydrates.hashCode) +
      (sugar.hashCode) +
      (protein.hashCode) +
      (salt.hashCode);

  @override
  String toString() =>
      'NutritionInformation[kj=$kj, kcal=$kcal, fat=$fat, saturatedFat=$saturatedFat, carbohydrates=$carbohydrates, sugar=$sugar, protein=$protein, salt=$salt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'kj'] = this.kj;
    json[r'kcal'] = this.kcal;
    json[r'fat'] = this.fat;
    json[r'saturatedFat'] = this.saturatedFat;
    json[r'carbohydrates'] = this.carbohydrates;
    json[r'sugar'] = this.sugar;
    json[r'protein'] = this.protein;
    json[r'salt'] = this.salt;
    return json;
  }

  /// Returns a new [NutritionInformation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NutritionInformation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "NutritionInformation[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "NutritionInformation[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NutritionInformation(
        kj: mapValueOfType<double>(json, r'kj')!,
        kcal: mapValueOfType<double>(json, r'kcal')!,
        fat: mapValueOfType<double>(json, r'fat')!,
        saturatedFat: mapValueOfType<double>(json, r'saturatedFat')!,
        carbohydrates: mapValueOfType<double>(json, r'carbohydrates')!,
        sugar: mapValueOfType<double>(json, r'sugar')!,
        protein: mapValueOfType<double>(json, r'protein')!,
        salt: mapValueOfType<double>(json, r'salt')!,
      );
    }
    return null;
  }

  static List<NutritionInformation> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NutritionInformation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NutritionInformation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NutritionInformation> mapFromJson(dynamic json) {
    final map = <String, NutritionInformation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NutritionInformation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NutritionInformation-objects as value to a dart map
  static Map<String, List<NutritionInformation>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NutritionInformation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NutritionInformation.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'kj',
    'kcal',
    'fat',
    'saturatedFat',
    'carbohydrates',
    'sugar',
    'protein',
    'salt',
  };
}
