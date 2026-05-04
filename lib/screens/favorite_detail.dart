import 'package:favorite_places/models/favorite_place.dart';
import 'package:favorite_places/screens/map.dart';
import 'package:flutter/material.dart';

class FavoriteDetailScreen extends StatelessWidget {
  const FavoriteDetailScreen({super.key, required this.favoritePlace});

  final FavoritePlace favoritePlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(favoritePlace.title)),
      body: Stack(
        children: [
          Image.file(
            favoritePlace.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MapScreen(location: favoritePlace.location, isSelecting: false)));
                  },
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: FileImage(favoritePlace.image),
                   foregroundColor: Colors.yellow,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    favoritePlace.location.address,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
