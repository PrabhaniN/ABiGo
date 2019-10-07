import 'package:abigo_mobile/screens/live/live_text_page.dart';
import 'package:flutter/material.dart';
import 'package:abigo_mobile/screens/live/live_talk_page.dart';
import 'package:abigo_mobile/screens/text/text_chats/text_chats_list/text_chats_list.dart';

class LiveScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LiveScreenState();
}

class LiveScreenState extends State<LiveScreen> {
  final _pages = [
    LiveTextScreen(),
    LiveTalkPage(),
  ];

  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Say what you want!'),
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
      ),
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            children: _pages,
            onPageChanged: _onPageChanged,
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: FloatingActionButton.extended(
              heroTag: "left",
              label: Text('Talk'),
              icon: Icon(Icons.mic),
              onPressed: () {},
              backgroundColor: Color.fromRGBO(35, 153, 209, 1),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton.extended(
              heroTag: "right",
              label: Text('Chats'),
              icon: Icon(Icons.message),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TextChatsList()),
                );
              },
              backgroundColor: Color.fromRGBO(35, 153, 209, 1),
            ),
          ),
        ],
      ),
    );
  }
}
