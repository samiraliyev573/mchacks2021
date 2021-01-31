import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mchacks2021/services/category_service.dart';
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
  List<DocumentSnapshot> topicList;
  StreamSubscription<QuerySnapshot> subscription;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('topics');

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );

    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        topicList = datasnapshot.docs;
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: topicList != null
            ? PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    initialPage = value;
                  });
                },
                physics: ClampingScrollPhysics(),
                controller: _controller,
                itemCount: topicList.length,
                itemBuilder: (context, index) {
                  return buildTopicSlider(index);
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
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
            angle: math.pi * value,
            child: TopicTile(
              new Topic(
                  id: topicList[index].data()['url'],
                  numAttempts: topicList[index].data()['numAttempts'],
                  title: topicList[index].data()['title'],
                  desc: topicList[index].data()['desc'],
                  imgurl: topicList[index].data()['imgurl'],
                  option1: topicList[index].data()['option1'],
                  option2: topicList[index].data()['option2'],
                  date: topicList[index].data()['date'],
                  category: topicList[index].data()['category']),
            ),
          ),
        );
      });
}
