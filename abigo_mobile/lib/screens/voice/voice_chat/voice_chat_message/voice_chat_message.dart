import 'package:flutter/material.dart';

class VoiceChatMessage extends StatelessWidget {
  VoiceChatMessage({this.text, this.animationController});
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
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text(_name[0]),
                backgroundColor: Color.fromRGBO(35, 153, 209, 1),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(text),
                  ),
                  Icon(
                    Icons.volume_up,
                    size: 20.0,
                  )
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
const String _name = "Sample Name";