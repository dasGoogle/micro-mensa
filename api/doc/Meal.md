# mensa_api.model.Meal

## Load the model package
```dart
import 'package:mensa_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The name of the meal | 
**studentPrice** | **num** | The price of the meal for students | 
**guestPrice** | **num** | The price of the meal for guests | 
**date** | [**DateTime**](DateTime.md) | The when the meal is available | 
**allergens** | [**List<Allergen>**](Allergen.md) | The allergens of the meal | [default to const []]
**additives** | [**List<Additive>**](Additive.md) | The additives of the meal | [default to const []]
**features** | [**List<Feature>**](Feature.md) | The features of the meal | [default to const []]
**isEveningMeal** | **bool** | Whether the meal is an evening meal | 
**id** | **num** | The id of the meal | 
**nutritionInformation** | [**NutritionInformation**](NutritionInformation.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


