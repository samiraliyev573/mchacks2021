import 'package:flutter/material.dart';

class GenreTile extends StatelessWidget {
  final String genre;

  GenreTile(this.genre);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 8),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        genre,
        style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 16),
      ),
    );
  }
}
