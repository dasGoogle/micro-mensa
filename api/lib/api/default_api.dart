//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DefaultApi {
  DefaultApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Retrieve a list of all additives available at a location
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] location (required):
  ///   The location for which to retrieve additives. This is matched ignoring whitespace and capitalization.
  ///
  /// * [String] lang:
  ///   The language in which to return the additives. Currently supported: en, de
  Future<Response> getAdditivesWithHttpInfo(
    String location, {
    String? lang,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/additives/{location}'.replaceAll('{location}', location);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (lang != null) {
      queryParams.addAll(_queryParams('', 'lang', lang));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve a list of all additives available at a location
  ///
  /// Parameters:
  ///
  /// * [String] location (required):
  ///   The location for which to retrieve additives. This is matched ignoring whitespace and capitalization.
  ///
  /// * [String] lang:
  ///   The language in which to return the additives. Currently supported: en, de
  Future<List<Additive>?> getAdditives(
    String location, {
    String? lang,
  }) async {
    final response = await getAdditivesWithHttpInfo(
      location,
      lang: lang,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Additive>')
              as List)
          .cast<Additive>()
          .toList(growable: false);
    }
    return null;
  }

  /// Retrieve all allergens available at a location
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] location (required):
  ///   The location for which to retrieve allergens. This is matched ignoring whitespace and capitalization.
  ///
  /// * [String] lang:
  ///   The language in which to return the allergens. Currently supported: en, de
  Future<Response> getAllergensWithHttpInfo(
    String location, {
    String? lang,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/allergens/{location}'.replaceAll('{location}', location);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (lang != null) {
      queryParams.addAll(_queryParams('', 'lang', lang));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve all allergens available at a location
  ///
  /// Parameters:
  ///
  /// * [String] location (required):
  ///   The location for which to retrieve allergens. This is matched ignoring whitespace and capitalization.
  ///
  /// * [String] lang:
  ///   The language in which to return the allergens. Currently supported: en, de
  Future<List<Allergen>?> getAllergens(
    String location, {
    String? lang,
  }) async {
    final response = await getAllergensWithHttpInfo(
      location,
      lang: lang,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Allergen>')
              as List)
          .cast<Allergen>()
          .toList(growable: false);
    }
    return null;
  }

  /// Retrieve all features a meal can have at a given location (i.e., being vegan, vegetarian, etc.)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] location (required):
  ///   The name of the location. This is matched ignoring whitespace and capitalization.
  ///
  /// * [String] lang:
  ///   The language in which to return the meals. Currently supported: en, de
  Future<Response> getFeaturesWithHttpInfo(
    String location, {
    String? lang,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/features/{location}'.replaceAll('{location}', location);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (lang != null) {
      queryParams.addAll(_queryParams('', 'lang', lang));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve all features a meal can have at a given location (i.e., being vegan, vegetarian, etc.)
  ///
  /// Parameters:
  ///
  /// * [String] location (required):
  ///   The name of the location. This is matched ignoring whitespace and capitalization.
  ///
  /// * [String] lang:
  ///   The language in which to return the meals. Currently supported: en, de
  Future<List<Feature>?> getFeatures(
    String location, {
    String? lang,
  }) async {
    final response = await getFeaturesWithHttpInfo(
      location,
      lang: lang,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Feature>')
              as List)
          .cast<Feature>()
          .toList(growable: false);
    }
    return null;
  }

  /// Retrieve all locations available at the API
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getLocationsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/locations';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve all locations available at the API
  Future<List<Location>?> getLocations() async {
    final response = await getLocationsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Location>')
              as List)
          .cast<Location>()
          .toList(growable: false);
    }
    return null;
  }

  /// Retrieves all meals available at a location that match the given filters. The meals contain details on prices, allgergens, etc.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] location (required):
  ///   The name of the location. This is matched ignoring whitespace and capitalization.
  ///
  /// * [String] date:
  ///   The date for which to retrieve meals. Format: YYYY-MM-DD
  ///
  /// * [bool] evening:
  ///   Whether to retrieve evening meals or not. If not specified, all meals are returned.
  ///
  /// * [String] lang:
  ///   The language in which to return the meals. Currently supported: en, de
  Future<Response> getMealsWithHttpInfo(
    String location, {
    String? date,
    bool? evening,
    String? lang,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/meals/{location}'.replaceAll('{location}', location);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (date != null) {
      queryParams.addAll(_queryParams('', 'date', date));
    }
    if (evening != null) {
      queryParams.addAll(_queryParams('', 'evening', evening));
    }
    if (lang != null) {
      queryParams.addAll(_queryParams('', 'lang', lang));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieves all meals available at a location that match the given filters. The meals contain details on prices, allgergens, etc.
  ///
  /// Parameters:
  ///
  /// * [String] location (required):
  ///   The name of the location. This is matched ignoring whitespace and capitalization.
  ///
  /// * [String] date:
  ///   The date for which to retrieve meals. Format: YYYY-MM-DD
  ///
  /// * [bool] evening:
  ///   Whether to retrieve evening meals or not. If not specified, all meals are returned.
  ///
  /// * [String] lang:
  ///   The language in which to return the meals. Currently supported: en, de
  Future<List<Meal>?> getMeals(
    String location, {
    String? date,
    bool? evening,
    String? lang,
  }) async {
    final response = await getMealsWithHttpInfo(
      location,
      date: date,
      evening: evening,
      lang: lang,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Meal>')
              as List)
          .cast<Meal>()
          .toList(growable: false);
    }
    return null;
  }
}
