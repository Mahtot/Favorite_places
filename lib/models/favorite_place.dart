import 'dart:io';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class FavoritePlace {
  final String id;
  final String title;
  final File image;
  FavoritePlace({String? id, required this.title, required this.image}) : id = id ?? uuid.v4();
}
