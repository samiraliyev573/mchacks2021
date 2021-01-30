import 'package:flutter/material.dart';
import 'package:mchacks2021/components/carousel.dart';
import 'package:mchacks2021/components/genres.dart';
import 'chat_screen.dart';
import '../components/categories.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 15),
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
            padding: EdgeInsets.symmetric(horizontal: 15),
          ),
        ],
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CategoryList(),
          Genres(),
          SizedBox(
            height: 20,
          ),
          Carousel(),
        ],
      ),
    );
  }
}
