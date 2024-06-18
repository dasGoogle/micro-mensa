import 'package:card_loading/card_loading.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mensa_api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import 'location_select_screen.dart';
import 'meal_details_screen.dart';

String defaultLocation = "Griebnitzsee";
String apiBasePath = "https://mensa.aaronschlitt.de";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: 'micro-Mensa',
        theme: ThemeData(
          colorScheme: lightColorScheme ?? _defaultLightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: const MyHomePage(title: 'micro-Mensa'),
      );
    });
  }

  static final _defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.red);

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.red, brightness: Brightness.light);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _selectedDay = DateTime.timestamp().toLocal();
  String _location = defaultLocation;
  List<Meal> _meals = [];
  bool _loading = false;
  DefaultApi apiInstance = DefaultApi(ApiClient(basePath: apiBasePath));

  void _resetDate() {
    selectDay(DateTime.timestamp().toLocal());
  }

  void selectDay(DateTime day) async {
    setState(() {
      _selectedDay = day;
    });
    loadMeals();
  }

  void openMealDetails(Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal)),
    );
  }

  void loadMeals() async {
    if (_loading) return;
    setState(() {
      _loading = true;
      _meals = [];
    });

    String date = _selectedDay.toIso8601String().split("T")[0];
    var meals = await apiInstance.getMeals(_location, date: date, lang: "de");
    if (meals != null) {
      meals.sort((a, b) => a.isEveningMeal ? 1 : -1);
    }
    setState(() {
      _meals = meals!;
      _loading = false;
    });
  }

  void loadLastSelectedLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setLocation(prefs.getString("location") ?? defaultLocation);
  }

  @override
  void initState() {
    super.initState();
    loadLastSelectedLocation();
  }

  void setLocation(String location) async {
    _location = location;
    loadMeals();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("location", location);
  }

  void selectLocation() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(
                apiClient: apiInstance,
              )),
    ).then((value) {
      if (value != null) {
        setLocation(value.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton.icon(
              label: const Icon(Icons.arrow_drop_down_rounded),
              onPressed: () {
                selectLocation();
              },
              icon: Text(
                _location,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            if (kIsWeb)
              InkWell(
                  child: const Text('Open API Docs'),
                  onTap: () => launchUrl(
                      Uri.parse('https://mensa.aaronschlitt.de/docs/'))),
          ])),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            buildDatePicker(context),
            ..._meals.map((meal) => buildCardForMeal(context, meal)),
            if (_loading) ...loadingIndicator(3),
            if (!_loading && _meals.isEmpty) buildNoMealsFound(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetDate,
        tooltip: 'Heute',
        child: const Icon(Icons.today),
      ),
    );
  }

  WeeklyDatePicker buildDatePicker(BuildContext context) {
    return WeeklyDatePicker(
      selectedDay: _selectedDay,
      changeDay: selectDay,
      enableWeeknumberText: false,
      backgroundColor: Colors.transparent,
      weekdayTextColor: Theme.of(context).disabledColor,
      digitsColor: Theme.of(context).colorScheme.onSurface,
      selectedDigitBackgroundColor: Theme.of(context).colorScheme.primary,
      selectedDigitColor: Theme.of(context).colorScheme.onPrimary,
    );
  }

  List<Widget> loadingIndicator(int count) {
    return List.generate(
      count,
      (index) => CardLoading(
          height: 100,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          margin: const EdgeInsets.all(4),
          cardLoadingTheme: CardLoadingTheme(
            colorOne: Theme.of(context).cardColor,
            colorTwo: Theme.of(context).highlightColor,
          )),
    );
  }

  Widget buildNoMealsFound() {
    return Center(
      child: Column(
        children: [
          Icon(Icons.no_food_outlined,
              size: Theme.of(context).textTheme.displayLarge?.fontSize ?? 40),
          Text("Kein Speiseplan für den gewählten Tag gefunden.",
              style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }

  GestureDetector buildCardForMeal(BuildContext context, Meal meal) {
    String features = meal.features.map((e) => e.abbreviation).join(", ");
    String allergens = meal.allergens.map((e) => e.abbreviation).join(", ");
    String additives = meal.additives.map((e) => e.abbreviation).join(", ");
    String info =
        "$features${allergens.isNotEmpty ? " • $allergens" : ""}${additives.isNotEmpty ? " • $additives" : ""}";
    var card = Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title:
                Text(meal.name, style: Theme.of(context).textTheme.titleMedium),
            leading:
                Icon(meal.isEveningMeal ? Icons.dark_mode : Icons.light_mode),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("${meal.studentPrice.toStringAsFixed(2)}€",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
                const SizedBox(width: 2),
                Text("${meal.guestPrice.toStringAsFixed(2)}€",
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(info,
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.fade,
                      softWrap: false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return GestureDetector(
      onTap: () => openMealDetails(meal),
      child: card,
    );
  }
}
