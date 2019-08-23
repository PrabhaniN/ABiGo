import 'package:flutter/material.dart';

import 'package:abigo_mobile/screens/voice/voice_chat/voice_chat_list/voice_chat_list.dart';

class VoiceGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'How to use'
        ),
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 7.0/2.0,
            ),
            delegate: SliverChildListDelegate([
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                    ),
                    ListTile(
                      title: Text(
                        'Send a new message',
                        style: TextStyle(
                          fontSize: 25.0
                        ),
                      ),
                      leading: Icon(
                        Icons.add,
                        size: 50.0,
                        color: Colors.black87,
                      ),
                      // subtitle: Text('description if need'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                    ),
                    ListTile(
                      title: Text(
                        'Read unread messages',
                        style: TextStyle(
                          fontSize: 25.0
                        ),
                      ),
                      leading: Icon(
                        Icons.drafts,
                        size: 50.0,
                        color: Colors.black87,
                      ),
                      // subtitle: Text('description if need'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                    ),
                    ListTile(
                      title: Text(
                        'Read conversations',
                        style: TextStyle(
                          fontSize: 25.0
                        ),
                      ),
                      leading: Icon(
                        Icons.message,
                        size: 50.0,
                        color: Colors.black87,
                      ),
                      // subtitle: Text('description if need'),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => VoiceChatList())
          );
        },
        label: Text(
          'Next',
        ),
        icon: Icon(Icons.navigate_next),
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}