import 'package:flutter/material.dart';
// import 'package:Abigo/Screens/chats/chatPage.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              // if (_pageController != 'chatPage') {
              // Navigator.push(
              // context,
              // MaterialPageRoute(builder: (context) => ChatPage())
              // );
              // } else {
              // Navigator.pop(context);
              // }
            },
          ),
          ListTile(
            title: Text('asdas'),
            onTap: () {
              // if (_pageController != 'asdas') {
              // Navigator.push(
              // context,
              // MaterialPageRoute(builder: (context) => ChatPage())
              // );
              // } else {
              // Navigator.pop(context);
              // }
            },
          ),
        ],
      ),
    );
  }
}
