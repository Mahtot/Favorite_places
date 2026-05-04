import 'dart:io';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;
  final double longitude;
  final String address;
}

class FavoritePlace {
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
  FavoritePlace({
    String? id,
    required this.title,
    required this.image,
    required this.location,
  }) : id = id ?? uuid.v4();
}
