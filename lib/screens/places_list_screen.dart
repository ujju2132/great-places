import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? CircularProgressIndicator()
              : Consumer<GreatPlaces>(
                  builder: (ctx, greatPlaces, ch) {
                    // Check if there are no items in greatPlaces.items
                    if (greatPlaces.items.isEmpty) {
                      return Center(
                        child:
                            const Text('Got no places yet, start adding some!'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: greatPlaces.items.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatPlaces.items[index].image),
                          ),
                          title: Text(greatPlaces.items[index].title),
                          onTap: () {
                            // Handle onTap action here
                          },
                        ),
                      );
                    }
                  },
                ),
        ));
  }
}
