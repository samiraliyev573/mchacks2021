import 'package:flutter/material.dart';
import 'chat_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
            child: Text("Go to Chat Screen"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChatScreen();
              }));
            },
          ),
        ),
      ),
    );
  }
}
