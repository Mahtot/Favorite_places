import 'package:favorite_places/models/favorite_place.dart';
import 'package:flutter/material.dart';

class FavoriteDetailScreen extends StatelessWidget {
  const FavoriteDetailScreen({super.key, required this.favoritePlace});

  final FavoritePlace favoritePlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(favoritePlace.title),
      ),
      body: Center(
        child: Text(' ${favoritePlace.title}', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
      ),
    );
}
}