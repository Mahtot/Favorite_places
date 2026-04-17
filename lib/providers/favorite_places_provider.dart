import 'package:favorite_places/models/favorite_place.dart';
import 'package:flutter_riverpod/legacy.dart';

class FavoritePlacesNotifier extends StateNotifier<List<FavoritePlace>> {
  FavoritePlacesNotifier() : super([]);

  void addPlace(String title) {
    state = [...state, FavoritePlace(title: title)];
  }
}

final favoritePlaceProvider = StateNotifierProvider<FavoritePlacesNotifier, List<FavoritePlace>>((ref){
    return FavoritePlacesNotifier();
});