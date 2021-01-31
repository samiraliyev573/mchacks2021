import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class OpinionSelector {
  final String topicDesc;
  final String opinion1;
  final String opinion2;

  OpinionSelector(
      {@required this.topicDesc,
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
            OpinionButton(opinion1),
            SizedBox(height: 10),
            OpinionButton(opinion2),
          ],
        ),
      ),
    )..show();
  }
}

// Button with opinion sentence text
class OpinionButton extends StatelessWidget {
  final String opinionText;
  OpinionButton(this.opinionText);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(79, 192, 209, 1.0), // background color
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
        Navigator.of(context)?.pop();
        // TODO navigate to waiting screen; send 'opinionText' as argument
      },
    );
  }
}
