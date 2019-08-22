import 'package:flutter/material.dart';

import 'package:abigo_mobile/screens/text/text_chats/text_chat_screen/text_chat_screen.dart';

class TextChatsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextChatsListState();
}

class TextChatsListState extends State<TextChatsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABiGo'),
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: _buildListCards(10),
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
        onPressed: () {},
      ),
    );
  }

  Widget _buildStack() => Stack(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('assets/images/abigo_logo.png'),
        radius: 40.0, 
      ),
    ],
  );

  Widget _buildCard() => SizedBox(
    height: 100.0,
    child: Card(
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TextChatScreen()));
        },
        title: Text(
          'Name',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text('Sample Text'),
        leading: _buildStack(),
        contentPadding: EdgeInsets.fromLTRB(5.0, 6.0, 5.0, 2.0),
      ),
    ),
  );

  List<Card> _buildListCards(int count){
    List<Card> card =List.generate(
      count, 
      (int index) => Card(
        child: _buildCard(),
      )
    );
    return card;
  }
}