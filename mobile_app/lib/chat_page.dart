import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bla bla'),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        children: _buildCards(5),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: (){
          print('adjbisufwsf');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  List<Card> _buildCards(int count) {
    List<Card> cards = List.generate(
      count, 
      (int index) => Card(
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0/11.0,
              child: Image.asset('images/panda.jpeg'),
              
            ),
          ],
        ),
      ),
    );
    return cards;
  }
}