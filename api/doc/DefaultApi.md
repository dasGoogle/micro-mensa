# mensa_api.api.DefaultApi

## Load the API package
```dart
import 'package:mensa_api/api.dart';
```

All URIs are relative to *https://mensa.aaronschlitt.de*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAdditives**](DefaultApi.md#getadditives) | **GET** /additives/{location} | 
[**getAllergens**](DefaultApi.md#getallergens) | **GET** /allergens/{location} | 
[**getFeatures**](DefaultApi.md#getfeatures) | **GET** /features/{location} | 
[**getLocations**](DefaultApi.md#getlocations) | **GET** /locations | 
[**getMeals**](DefaultApi.md#getmeals) | **GET** /meals/{location} | 


# **getAdditives**
> List<Additive> getAdditives(location, lang)



Retrieve a list of all additives available at a location

### Example
```dart
import 'package:mensa_api/api.dart';

final api_instance = DefaultApi();
final location = location_example; // String | The location for which to retrieve additives. This is matched ignoring whitespace and capitalization.
final lang = lang_example; // String | The language in which to return the additives. Currently supported: en, de

try {
    final result = api_instance.getAdditives(location, lang);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getAdditives: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **location** | **String**| The location for which to retrieve additives. This is matched ignoring whitespace and capitalization. | 
 **lang** | **String**| The language in which to return the additives. Currently supported: en, de | [optional] [default to 'en']

### Return type

[**List<Additive>**](Additive.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllergens**
> List<Allergen> getAllergens(location, lang)



Retrieve all allergens available at a location

### Example
```dart
import 'package:mensa_api/api.dart';

final api_instance = DefaultApi();
final location = location_example; // String | The location for which to retrieve allergens. This is matched ignoring whitespace and capitalization.
final lang = lang_example; // String | The language in which to return the allergens. Currently supported: en, de

try {
    final result = api_instance.getAllergens(location, lang);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getAllergens: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **location** | **String**| The location for which to retrieve allergens. This is matched ignoring whitespace and capitalization. | 
 **lang** | **String**| The language in which to return the allergens. Currently supported: en, de | [optional] [default to 'en']

### Return type

[**List<Allergen>**](Allergen.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFeatures**
> List<Feature> getFeatures(location, lang)



Retrieve all features a meal can have at a given location (i.e., being vegan, vegetarian, etc.)

### Example
```dart
import 'package:mensa_api/api.dart';

final api_instance = DefaultApi();
final location = location_example; // String | The name of the location. This is matched ignoring whitespace and capitalization.
final lang = lang_example; // String | The language in which to return the meals. Currently supported: en, de

try {
    final result = api_instance.getFeatures(location, lang);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getFeatures: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **location** | **String**| The name of the location. This is matched ignoring whitespace and capitalization. | 
 **lang** | **String**| The language in which to return the meals. Currently supported: en, de | [optional] [default to 'en']

### Return type

[**List<Feature>**](Feature.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLocations**
> List<Location> getLocations()



Retrieve all locations available at the API

### Example
```dart
import 'package:mensa_api/api.dart';

final api_instance = DefaultApi();

try {
    final result = api_instance.getLocations();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getLocations: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Location>**](Location.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMeals**
> List<Meal> getMeals(location, date, evening, lang)



Retrieves all meals available at a location that match the given filters. The meals contain details on prices, allgergens, etc.

### Example
```dart
import 'package:mensa_api/api.dart';

final api_instance = DefaultApi();
final location = location_example; // String | The name of the location. This is matched ignoring whitespace and capitalization.
final date = date_example; // String | The date for which to retrieve meals. Format: YYYY-MM-DD
final evening = true; // bool | Whether to retrieve evening meals or not. If not specified, all meals are returned.
final lang = lang_example; // String | The language in which to return the meals. Currently supported: en, de

try {
    final result = api_instance.getMeals(location, date, evening, lang);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getMeals: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **location** | **String**| The name of the location. This is matched ignoring whitespace and capitalization. | 
 **date** | **String**| The date for which to retrieve meals. Format: YYYY-MM-DD | [optional] 
 **evening** | **bool**| Whether to retrieve evening meals or not. If not specified, all meals are returned. | [optional] 
 **lang** | **String**| The language in which to return the meals. Currently supported: en, de | [optional] [default to 'en']

### Return type

[**List<Meal>**](Meal.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

