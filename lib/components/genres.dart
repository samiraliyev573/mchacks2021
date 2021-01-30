import 'package:flutter/material.dart';
import 'genre_tile.dart';

class Genres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> genres = ["Fun", "Informational", "Technology", "Politics"];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 36,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return GenreTile(genres[index]);
          }),
    );
  }
}
