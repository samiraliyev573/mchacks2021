import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mchacks2021/services/category_service.dart';
import '../models/topic.dart';
import 'carousel_tile.dart';
import 'dart:math' as math;

class Carousel extends StatefulWidget {
  final Stream<String> categoryStream;
  Carousel(this.categoryStream);
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController _controller;
  int initialPage = 1;
  List<DocumentSnapshot> topicList;
  StreamSubscription<QuerySnapshot> subscription;
  StreamSubscription<String> categorySub;
  String selectedCategory;
  String prevCat;
  List<DocumentSnapshot>
      categoryElements; // Get elements corresponding to the current category
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
        this.categoryElements = topicList
            .where((topic) => topic.data()['category'] == this.selectedCategory)
            .toList();
      });
    });

    categorySub = widget.categoryStream.listen(
      (data) => setState(() {
        this.prevCat = this.selectedCategory;
        this.selectedCategory = data.toString();
        this.categoryElements = topicList != null
            ? topicList
                .where((topic) =>
                    topic.data()['category'] == this.selectedCategory)
                .toList()
            : null;
        if (this.prevCat != 'Sports' && this.prevCat != 'Politics') {
          this.initialPage = 1;
          this._controller.jumpToPage(1);
        }
      }),
    );
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return this.categoryElements != null
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: AspectRatio(
                aspectRatio: 0.85,
                child: this.categoryElements.isNotEmpty
                    ? PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            initialPage = value;
                          });
                        },
                        physics: ClampingScrollPhysics(),
                        controller: _controller,
                        itemCount: this.categoryElements.length,
                        itemBuilder: (context, index) {
                          return buildTopicSlider(
                              this.categoryElements[index], index);
                        })
                    : Center(
                        child: Text(
                          "Coming Soon",
                          style: TextStyle(fontSize: 24),
                        ),
                      )),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget buildTopicSlider(DocumentSnapshot element, int index) =>
      AnimatedBuilder(
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
                      id: element.data()['url'],
                      numAttempts: element.data()['numAttempts'],
                      title: element.data()['title'],
                      desc: element.data()['desc'],
                      imgurl: element.data()['imgurl'],
                      option1: element.data()['option1'],
                      option2: element.data()['option2'],
                      date: element.data()['date'],
                      category: element.data()['category']),
                ),
              ),
            );
          });
}
