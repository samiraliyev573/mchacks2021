import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../screens/chat_screen.dart';

class OpinionSelector {
  final String title;
  final String topicDesc;
  final String opinion1;
  final String opinion2;

  OpinionSelector(
      {@required this.title,
      @required this.topicDesc,
      @required this.opinion1,
      @required this.opinion2});

  // Display popup to choose opinion on the topic
  popup(context) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.QUESTION,
      dialogBackgroundColor: const Color.fromRGBO(37, 44, 74, 1.0),
      headerAnimationLoop: false,
      animType: AnimType.SCALE,
      title: topicDesc,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              topicDesc,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            SizedBox(height: 20),
            OpinionButton(
              title: title,
              opinionText: opinion1,
              buttonColor: Colors.yellowAccent,
            ),
            SizedBox(height: 10),
            OpinionButton(
              title: title,
              opinionText: opinion2,
              buttonColor: Colors.greenAccent,
            ),
          ],
        ),
      ),
    )..show();
  }
}

// Button with opinion sentence text
class OpinionButton extends StatelessWidget {
  final String title;
  final String opinionText;
  final Color buttonColor;
  OpinionButton({this.opinionText, this.buttonColor, this.title});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: buttonColor // background color
          ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          opinionText,
          style: TextStyle(
            color: Color.fromRGBO(37, 44, 74, 1.0),
            fontSize: 18,
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ChatScreen(
              title: title,
              color: buttonColor,
            );
          },
        ));
      },
    );
  }
}
