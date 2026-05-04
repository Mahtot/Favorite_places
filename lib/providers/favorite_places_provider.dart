import 'dart:io';
import 'package:favorite_places/models/favorite_place.dart';
import 'package:flutter_riverpod/legacy.dart';

class FavoritePlacesNotifier extends StateNotifier<List<FavoritePlace>> {
  FavoritePlacesNotifier() : super([]);

  void addPlace(String title, File image, PlaceLocation location) {
    state = [...state, FavoritePlace(title: title, image: image, location: location)];
  }
}

final favoritePlaceProvider = StateNotifierProvider<FavoritePlacesNotifier, List<FavoritePlace>>((ref){
    return FavoritePlacesNotifier();
});       