import 'dart:io';
import 'package:favorite_places/models/favorite_place.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class FavoritePlacesNotifier extends StateNotifier<List<FavoritePlace>> {
  FavoritePlacesNotifier() : super([]);

  void addPlace(String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedPath = await image.copy('${appDir.path}/$fileName');

    state = [
      ...state,
      FavoritePlace(title: title, image: copiedPath, location: location),
    ];
  }
}

final favoritePlaceProvider =
    StateNotifierProvider<FavoritePlacesNotifier, List<FavoritePlace>>((ref) {
      return FavoritePlacesNotifier();
    });
