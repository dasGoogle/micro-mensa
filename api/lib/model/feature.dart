//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Feature {
  /// Returns a new [Feature] instance.
  Feature({
    required this.name,
    required this.abbreviation,
  });

  /// The name of the feature
  String name;

  /// The abbreviation of the feature
  String abbreviation;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Feature &&
     other.name == name &&
     other.abbreviation == abbreviation;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (abbreviation.hashCode);

  @override
  String toString() => 'Feature[name=$name, abbreviation=$abbreviation]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'abbreviation'] = this.abbreviation;
    return json;
  }

  /// Returns a new [Feature] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Feature? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Feature[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Feature[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Feature(
        name: mapValueOfType<String>(json, r'name')!,
        abbreviation: mapValueOfType<String>(json, r'abbreviation')!,
      );
    }
    return null;
  }

  static List<Feature> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Feature>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Feature.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Feature> mapFromJson(dynamic json) {
    final map = <String, Feature>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Feature.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Feature-objects as value to a dart map
  static Map<String, List<Feature>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Feature>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Feature.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'abbreviation',
  };
}

