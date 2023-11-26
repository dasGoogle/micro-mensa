import 'dart:io';

import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:mensa_api/api.dart';

final String defaultLocale = Platform.localeName;

class Pair {
  Pair(this.key, this.value);

  final String key;
  final String value;
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.apiClient});
  final DefaultApi apiClient;

  @override
  State<LocationScreen> createState() => _LocationScreenState(apiClient: apiClient);
}

class _LocationScreenState extends State<LocationScreen> {
  List<Location> _locations = [];
  bool _loading = false;

  _LocationScreenState({required this.apiClient});
  final DefaultApi apiClient;

  @override
  void initState() {
    super.initState();
    loadLocations();
  }


  void loadLocations() async {
    setState(() {
      _loading = true;
    });
    try {
      final locations = await apiClient.getLocations();
      if(locations == null) throw Exception("No locations found");
      setState(() {
        _locations = locations;
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Standort auswählen"),
        ),
        body: Column(
          children: [
            if(_loading) ...loadingCards(6, context),
            ..._locations.map((location) => buildLocationListEntry(location, context)),
          ],
        )
    );
  }

  Widget buildLocationListEntry(Location location, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(location.name, style: Theme.of(context).textTheme.titleLarge,),
        subtitle: Text("ID: ${location.id}"),
        leading: const Icon(Icons.location_on_rounded),
        onTap: () {
          Navigator.pop(context, location);
        },
      )
    );
  }

  List<Widget> loadingCards(int count, BuildContext context) {
    return List.generate(
      count,
          (index) => CardLoading(
          height: 70,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          margin: const EdgeInsets.all(4),
          cardLoadingTheme: CardLoadingTheme(
            colorOne: Theme.of(context).cardColor,
            colorTwo: Theme.of(context).highlightColor,
          )),
    );
  }
}