import 'package:flutter/material.dart';
import '../models/topic.dart';
import './opinion_selector.dart';

class TopicTile extends StatelessWidget {
  final Topic topic;

  TopicTile(this.topic);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => OpinionSelector(
                      topicTitle:
                          "Sunt ad tempor minim excepteur magna ut proident magna pariatur culpa voluptate consequat duis non.",
                      opinion1:
                          "Culpa sit velit dolor eiusmod ad eu eu excepteur.",
                      opinion2:
                          "Veniam Lorem ad et aliqua cillum id minim ipsum ex laborum laborum nisi.")
                  .popup(context),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black26,
                    )
                  ],
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(topic.imgurl),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              topic.title,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star),
              SizedBox(
                width: 10,
              ),
              Text(
                "${topic.numAttempts}",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          )
        ],
      ),
    );
  }
}
