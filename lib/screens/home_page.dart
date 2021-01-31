import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mchacks2021/components/carousel.dart';
import 'package:mchacks2021/constants.dart';

import 'chat_screen.dart';
import '../components/categories.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_background,
      appBar: AppBar(
        backgroundColor: color_background,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 15),
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
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

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _controller = StreamController<String>();
  Stream<String> get stream => _controller.stream;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CategoryList(_controller),
            SizedBox(
              height: 20,
            ),
            Carousel(stream),
          ],
        ),
      ),
    );
  }
}
