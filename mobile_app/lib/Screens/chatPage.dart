import 'package:flutter/material.dart';
import 'package:Abigo/Screens/textChatScreen.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String _pageController = 'chatPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats', 
          style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          // fontFamily: 'Roboto'
          ),
        ),
        backgroundColor: Colors.blue[900],
      ),

      drawer: _drawer(),
      
      body: ListView(
        children: _buildListCards(1),
      ),

      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        backgroundColor: Colors.blue[900],
        onPressed: (){
          print('adjbisufwsf');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildStack() => Stack(
    // alignment: const Alignment(10.0, 10.0),
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('images/panda.jpeg'),
        radius: 40.0, 
      ),
    ],
  );

  Widget _buildCard() => SizedBox(
    height: 100.0,
    child: Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => ChatScreen())
          );
        },
        title: Text(
          'Samanthi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            // fontFamily: 'Roboto'
          ),
        ),
        subtitle: Text('Yes I did'),
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

  Widget _drawer() => Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Image(
            image: AssetImage('images/abigo_logo.png'),
          ),
        ),

        ListTile(
          title: Text('Chats'),
          onTap: () {
            if (_pageController != 'chatPage') {
              Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => ChatPage())
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),

        ListTile(
          title: Text('asdas'),
          onTap: () {
            if (_pageController != 'asdas') {
              Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => ChatPage())
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),

      ],
    ),
  );
}