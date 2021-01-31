import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final Color color;
  ChatScreen({this.color});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Chat Screen"),
        ),
      ),
    );
  }
}
