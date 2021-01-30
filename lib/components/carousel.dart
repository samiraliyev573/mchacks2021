import 'package:flutter/material.dart';
import '../models/topic.dart';
import 'carousel_tile.dart';
import 'dart:math' as math;

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController _controller;
  int initialPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                initialPage = value;
              });
            },
            physics: ClampingScrollPhysics(),
            controller: _controller,
            itemCount: topics.length,
            itemBuilder: (context, index) {
              return buildTopicSlider(index);
            }),
      ),
    );
  }

  Widget buildTopicSlider(int index) => AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 0;
        if (_controller.position.haveDimensions) {
          value = index - _controller.page;
          value = (value * 0.038).clamp(-1, 1);
        }
        return AnimatedOpacity(
          duration: Duration(milliseconds: 350),
          opacity: initialPage == index ? 1 : 0.4,
          child: Transform.rotate(
              angle: math.pi * value, child: TopicTile(topics[index])),
        );
      });
}
