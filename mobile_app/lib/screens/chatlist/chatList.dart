import 'package:flutter/material.dart';
import 'package:Abigo/screens/chat/chatScreen.dart';
// import 'package:Abigo/model/user.dart';
import 'package:Abigo/nav/nav.dart';
// import 'package:Abigo/Screens/addChat.dart';

class ChatList extends StatefulWidget {
  // final String id;
  // final String edit;

  // final SignUpBloc _bloc = SignUpBloc();

  // ChatList({Key key, this.id, this.edit}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
  // _ChatListState createState() => _ChatListState(id);
}

class _ChatListState extends State<ChatList> {
  String _pageController = 'chatPage';

  // User _user;
// 
  // _ChatListState(String id) {
    // this._user = User(id);
  // }

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
          // Navigator.push(
            // context, 
            // MaterialPageRoute(builder: (context) => AddChat())
          // );
          _gotoaddChat();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildStack() => Stack(
    // alignment: const Alignment(10.0, 10.0),
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('assets/images/panda.jpeg'),
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
            image: AssetImage('assets/images/abigo_logo.png'),
          ),
        ),

        ListTile(
          title: Text('Chats'),
          onTap: () {
            if (_pageController != 'chatPage') {
              Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => ChatList())
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
              MaterialPageRoute(builder: (context) => ChatList())
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),

      ],
    ),
  );

  void _gotoaddChat() {
    Nav.of(context).navigateTo(context, '/addChat', replace: true, clearStack: true);
  }
}