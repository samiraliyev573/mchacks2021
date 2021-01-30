import 'package:flutter/material.dart';
import '../models/topic.dart';

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
    _controller = PageController();
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
            itemCount: topics.length,
            itemBuilder: (context, index) {
              return TopicTile(topics[index]);
            }),
      ),
    );
  }
}

class TopicTile extends StatelessWidget {
  final Topic topic;

  TopicTile(this.topic);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(topic.imgurl))),
        ))
      ],
    );
  }
}
