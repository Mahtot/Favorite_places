import 'package:uuid/uuid.dart';

var uuid = Uuid();

class FavoritePlace {
  final String id;
  final String title;

  FavoritePlace({String? id, required this.title}) : id = id ?? uuid.v4();
}
