import 'package:flutter/material.dart';
import 'chatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool _isComposing =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: _buildStack(),
        title: Text('Name'),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            Flexible(
              child: new ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
                reverse: true,
              ),
            ),
            Divider(height: 1.0),
            Container(
              // decoration: BoxDecoration(
                // color: Theme.of(context).cardColor,
              // ),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(
        color: Theme.of(context).accentColor
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: TextEditingController(),
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Send Message'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Widget _buildStack() => Stack(
    // alignment: const Alignment(10.0, 10.0),
    // children: [
      // CircleAvatar(
        // backgroundImage: AssetImage('images/panda.jpeg'),
        // radius: 25.0, 
      // ),
    // ],
  // );
}