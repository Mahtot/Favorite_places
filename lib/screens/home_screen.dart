import 'package:favorite_places/models/favorite_place.dart';
import 'package:favorite_places/providers/favorite_places_provider.dart';
import 'package:favorite_places/screens/favorite_detail.dart';
import 'package:favorite_places/screens/new_favorite_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _addPlace(context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => NewFavoritePlaceScreen()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     List<FavoritePlace> favoritePlaces = ref.watch(favoritePlaceProvider);
     
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _addPlace(context);
            },
          ),
        ],
      ),
      body: favoritePlaces.isEmpty
          ? const Center(
              child: Text(
                'No places added yet.',
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: favoritePlaces.length,
              itemBuilder: (ctx, index) => InkWell(
                onTap: (){
                   Navigator.of(context).push(MaterialPageRoute
                   (builder: (context) => FavoriteDetailScreen(favoritePlace: favoritePlaces[index]),)
                   );
                }, 
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    favoritePlaces[index].title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
    );
  }
}
