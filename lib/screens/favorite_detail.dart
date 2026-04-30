import 'package:favorite_places/models/favorite_place.dart';
import 'package:flutter/material.dart';

class FavoriteDetailScreen extends StatelessWidget {
  const FavoriteDetailScreen({super.key, required this.favoritePlace});

  final FavoritePlace favoritePlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(favoritePlace.title)),
      body: Stack(
        children: [Image.file(
          favoritePlace.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          right:0,
          left:0,
          bottom:0,
          child: Container(
            height: 50,
            color: const Color.fromARGB(255, 37, 37, 37),
            alignment: Alignment.bottomCenter,
            child:Text(favoritePlace.title, style: TextStyle(fontSize: 20, color: Colors.white),),
          ),
        )
        ],
      ),
    );
  }
}
