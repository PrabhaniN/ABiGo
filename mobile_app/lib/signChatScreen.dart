import 'package:flutter/material.dart';

class SignChatScreen extends StatefulWidget {
  @override
  _SignChatScreenState createState() => _SignChatScreenState();
}

class _SignChatScreenState extends State<SignChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ABiGo',
          style: TextStyle(
            // fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 10.0 / 13.0,
        children: _buildGridCards(8),
      ),
    );
  }
  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count, 
      (int index) => Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 21.0 / 20.0,
            child: Image.asset('images/abigo logo.png'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            child: Text('Sign Name'),
          ),
        ],
      ),
    ),
    );
    return cards;
  }
}