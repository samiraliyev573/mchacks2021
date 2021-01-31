import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:mchacks2021/constants.dart';

class OpinionSelector {
  final String topicTitle;
  final String opinion1;
  final String opinion2;

  OpinionSelector(
      {@required this.topicTitle,
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
      title: topicTitle,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              topicTitle,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(79, 192, 209, 1.0), // background color
              ),
              // style: ButtonStyle(backgroundColor: Color.fromRGBO(244, 179, 3, 1),),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  opinion1,
                  style: TextStyle(
                    color: Color.fromRGBO(37, 44, 74, 1.0),
                    fontSize: 18,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context)?.pop();
                // TODO navigate to waiting screen
              },
            ),
            SizedBox(height: 10),
            // Container(
            //   decoration: BoxDecoration(
            //     gradient: kGradient,
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(12),
            //     ),
            //   ),
            //   child: Text("heloooo"),
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(79, 192, 209, 1.0), // background color
              ),
              // style: ButtonStyle(backgroundColor: Color.fromRGBO(244, 179, 3, 1),),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  opinion2,
                  style: TextStyle(
                    color: Color.fromRGBO(37, 44, 74, 1.0),
                    fontSize: 18,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context)?.pop();
                // TODO navigate to waiting screen
              },
            ),
          ],
        ),
      ),
    )..show();
  }
}

// class GradientButton extends StatelessWidget {
//   final Widget child;
//   final Gradient gradient;
//   final double width;
//   final double height;
//   final Function onPressed;

//   const GradientButton({
//     Key key,
//     @required this.child,
//     this.gradient,
//     this.width = double.infinity,
//     this.height = 50.0,
//     this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: 50.0,
//       decoration: BoxDecoration(gradient: gradient, boxShadow: [
//         BoxShadow(
//           color: Colors.grey[500],
//           offset: Offset(0.0, 1.5),
//           blurRadius: 1.5,
//         ),
//       ]),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//             onTap: onPressed,
//             child: Center(
//               child: child,
//             )),
//       ),
//     );
//   }
// }
