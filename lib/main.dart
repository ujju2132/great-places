import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: Colors.amber, primary: Colors.indigo),
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName:(context) => AddPlaceScreen()
        },
      ),
    );
  }
}
