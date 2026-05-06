import 'package:favorite_places/models/favorite_place.dart';
import 'package:favorite_places/providers/favorite_places_provider.dart';
import 'package:favorite_places/screens/favorite_detail.dart';
import 'package:favorite_places/screens/new_favorite_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _addPlace(context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => NewFavoritePlaceScreen()));
  }

  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(favoritePlaceProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: _placesFuture,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : favoritePlaces.isEmpty
            ? const Center(
                child: Text('No places added yet. Start adding some!', style: TextStyle(color: Colors.white),),
              )
            : ListView.builder(
                itemCount: favoritePlaces.length,
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(favoritePlaces[index].image),
                  ),
                  title: Text(favoritePlaces[index].title),
                  subtitle: Text(favoritePlaces[index].location.address),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => FavoriteDetailScreen(
                          favoritePlace: favoritePlaces[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
