
import 'package:flutter/material.dart';
import 'package:Abigo/screens/chatlist/chatList.dart';

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
              image: AssetImage('assets/images/abigo_logo.png'),
            ),
          ),
          ListTile(
            title: Text('Chats'),
            onTap: () {
              // if (_pageController != 'chatPage') {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ChatList())
              );
              // } else {
              // Navigator.pop(context);
              // }
            },
          ),
          ListTile(
            title: Text('asdas'),
            onTap: () {
              // if (_pageController != 'asdas') {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ChatList())
              );
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
