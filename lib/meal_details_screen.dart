import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mensa/helpers.dart';
import 'package:mensa_api/api.dart';

final String defaultLocale = Platform.localeName;

class Pair {
  Pair(this.key, this.value);

  final String key;
  final String value;
}

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    String title = DateFormat.MMMMEEEEd().format(meal.date.toLocal());

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTitleCard(context),
            buildPriceCard(context),
            buildAllergensCard(context),
            buildAdditivesCard(context),
            buildFeaturesCard(context),
          ],
        ),
      ),
    );
  }

  Card cardElement(List<Widget> content) => Card(
    child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: content,
        )
    ),
  );

  Widget priceColumn(String price, String label, BuildContext context) => Column(
    children: [
      Text(
          price,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.primary)
      ),
      Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ],
  );

  Card buildPriceCard(BuildContext context) {
    return cardElement([ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                priceColumn("${meal.studentPrice.toStringAsFixed(2)}€", "Studierende", context),
                priceColumn("${meal.guestPrice.toStringAsFixed(2)}€", "Gäste", context),
              ],
            ),
          )]);
  }

  Card buildTitleCard(BuildContext context) {
    String mealType = meal.isEveningMeal ? "Abendangebot" : "Mittagsangebot";
    String mealFeatures = MealHelpers.vegetarianOrVeganFeatures(meal).map((e) => e.name).join(", ");

    return cardElement([ListTile(
            title: Text(
              meal.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              "$mealType${mealFeatures.isNotEmpty ? " • $mealFeatures" : ""}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )]);
  }

  buildAllergensCard(BuildContext context) {
    return buildKeyValueCard("Allergene", meal.allergens.map((e) => Pair(e.abbreviation, e.name)).toList(), context);
  }

  buildAdditivesCard(BuildContext context) {
    return buildKeyValueCard("Zusatzstoffe", meal.additives.map((e) => Pair(e.abbreviation, e.name)).toList(), context);
  }

  buildFeaturesCard(BuildContext context) {
    return buildKeyValueCard("Eigenschaften", meal.features.map((e) => Pair(e.abbreviation, e.name)).toList(), context);
  }

  buildKeyValueCard(String title, List<Pair> pairs, BuildContext context) {
    return cardElement([ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...pairs.map((e) => Row(children: [Text(e.key, style: Theme.of(context).textTheme.titleMedium), const SizedBox(width: 16), Text(e.value, style: Theme.of(context).textTheme.bodyMedium)])),
              ],
            )
          )]);
  }
}