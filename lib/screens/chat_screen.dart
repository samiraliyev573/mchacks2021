import 'dart:async';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mchacks2021/constants.dart';
import 'package:mchacks2021/screens/home_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rating_dialog/rating_dialog.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  final Color color;
  final String title;
  ChatScreen({this.color, this.title});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String messageText;

  Timer _timer;
  int _start = 10;
  @override
  void initState() {
    super.initState();

    getCurrentUser();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void startTimer() {
    const oneSec = const Duration(milliseconds: 900);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            showDialog(
                context: context,
                barrierDismissible:
                    true, // set to false if you want to force a rating
                builder: (context) {
                  return RatingDialog(
                    icon: const Icon(
                      Icons.rate_review,
                      size: 100,
                      color: Colors.red,
                    ), // set your own image/icon widget
                    title: "Rate this conversation",
                    description:
                        "Tap a star to set your rating. Add more description here if you want.",
                    submitButton: "SUBMIT",
                    alternativeButton: "Contact us instead?", // optional
                    positiveComment: "We are so happy to hear :)", // optional
                    negativeComment: "We're sad to hear :(", // optional
                    accentColor: Colors.red, // optional
                    onSubmitPressed: (int rating) {
                      print("onSubmitPressed: rating = $rating");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    onAlternativePressed: () {
                      print("onAlternativePressed: do something");
                      // TODO: maybe you want the user to contact you instead of rating a bad review
                    },
                  );
                });
            _timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int minute = ((_start) ~/ 60);
    int second = (_start % 60);
    var linearPercent = LinearPercentIndicator(
      alignment: MainAxisAlignment.center,
      width: MediaQuery.of(context).size.width * 0.75,
      animation: true,
      lineHeight: MediaQuery.of(context).size.height * 0.05,
      animationDuration: _start * 1000,
      percent: 1.0,
      linearGradient: LinearGradient(colors: [
        Color(0xFFFC4F6C),
        Color(0xFFDF5CA6),
        Color(0xFFDF5CA8),
        Color(0xFFB46FFB),
        Colors.purple[400]
      ]),
      linearStrokeCap: LinearStrokeCap.roundAll,
      center: Text(
        '$minute:$second',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
      ),
      animateFromLastPercent: true,
      clipLinearGradient: true,
      fillColor: Color(0xFF3E4665),
      backgroundColor: Color(0xFF252C4A),
      restartAnimation: true,
    );
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 40, 50, 1),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color.withOpacity(0.7),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            linearPercent,
            MessagesStream(mycolor: widget.color),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: InputDecoration(
                          filled: false,
                          fillColor: Color(0xFFFFFFFF),
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                      });
                    },
                    child: Icon(
                      Icons.send,
                      color: widget.color.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  final Color mycolor;
  MessagesStream({this.mycolor});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data()['text'];
          final messageSender = message.data()['sender'];

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            mycolor: mycolor,
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe, this.mycolor});
  final Color mycolor;
  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
            elevation: 5.0,
            color: isMe ? mycolor.withOpacity(0.7) : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
