import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    var sizeTransition = SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      axisAlignment: 0.0,
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text(_name[0]),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    _name, 
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Text(text),
                ],
              ),
            )
          ],
        ),
      ),
    );
    return sizeTransition;
  }
}
const String _name = "Your Name";