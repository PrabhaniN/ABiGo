import 'package:abigo_mobile/screens/live/live_text_page.dart';
import 'package:flutter/material.dart';
import 'package:abigo_mobile/screens/live/live_talk_page.dart';

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
    return PageView(
      scrollDirection: Axis.horizontal,
      children: _pages,
      onPageChanged: _onPageChanged,
    );
  }
}
