import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class OpinionSelector {
  final String topicTitle;
  final String opinion1;
  final String opinion2;

  OpinionSelector(
      {@required this.topicTitle,
      @required this.opinion1,
      @required this.opinion2});

  popup(context) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.QUESTION,
      headerAnimationLoop: false,
      animType: AnimType.SCALE,
      title: topicTitle,
      body: Text('hello'),
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }
}
